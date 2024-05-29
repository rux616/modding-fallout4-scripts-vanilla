Scriptname DLC01:DLC01_TrackSystemDoorTrigger extends ObjectReference
{Part of the DLC01 Track System. Script on a trigger inside the unplayable area at the ends of each track.}
;
;Each DoorTrigger is associated with a Door (DLC01:DLC01_TrackSystemDoor) that's responsible for managing it. The Door script
;calls the trigger's native GetTriggerObjectCount function to check when its safe to close the door.
;
;The trigger's primary job is to deal with an edge case: What if something gets stuck in here?
;This is hard to pull off, but if you jump in between Machines on the track's incoming side, it is possible,
;and it's often difficult to escape. After some discussion, we've decided to handle this by:
;
; - Killing any robots who get stuck (eg. an Eyebot who floats in and becomes trapped).
; - Teleporting any other actors (the player, etc.) out to safety. That's ugly, but better than a kill box.
;
;This trigger has interaction conditions that exclude objects with the DLC01TrackSystemCarriedObject keyword (anything being
;actively carried by a machine on the track), so we're only going to get events from actors we actually care about.

Group Autofill_Properties
	Faction property RobotFaction Auto Const Mandatory	;Robot faction.
EndGroup

;Local properties.
DLC01:DLC01_TrackSystemTrack myTrack	;The Track associated with this trigger and its door.
DLC01:DLC01_TrackSystemDoor myDoor		;The Door associated with this trigger.
Actor[] myTriggerActors				;Array of actors currently in the trigger.

;Initialize the trigger. Called by DLC01_TrackSystemDoor, when it initializes.
Function InitTrigger(DLC01:DLC01_TrackSystemTrack parentTrack, DLC01:DLC01_TrackSystemDoor parentDoor)
	myTrack = parentTrack
	myDoor = parentDoor
	myTriggerActors = new Actor[0]
EndFunction

;When an actor enters the trigger, push them into the objects array and start/restart a timer, giving them a chance to get out on their own.
Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActionActor = akActionRef as Actor
	if (akActionActor != None)
		myTriggerActors.Add(akActionActor)
		StartTimer(0, 1)
	EndIf
EndEvent

;If an actor leaves the trigger, remove them from the array.
Event OnTriggerLeave(ObjectReference akActionRef)
	int index = myTriggerActors.Find(akActionRef as Actor)
	if (index > 0)
		myTriggerActors.Remove(index)
	EndIf

	;If nothing remains in the trigger, cancel it.
	if (Self.GetTriggerObjectCount() == 0)
		CancelTimer(1)
	EndIf
EndEvent

;When the timer expires, deal with any actors in the trigger.
Event OnTimer(int timerID)
	if (timerID == 1)
		int i = 0
		While (i < myTriggerActors.Length)
			;If a robot is stuck...
			if (myTriggerActors[i].IsInFaction(RobotFaction))
				;...is the player looking at it? If so, skip it for now. If not, disable and kill it.
				if (Game.GetPlayer().HasDetectionLoS(myTriggerActors[i]))
					i = i + 1
				Else
					myTriggerActors[i].Disable()
					myTriggerActors[i].Kill()
					myTriggerActors.Remove(i)
				EndIf
			Else
				;Expel anything other than a robot.
				;This turns out to be pretty straightforward. Track system doors have a pivot that is offset out in front of the door by
				;a considerable distance, so take advantage of that and just move the actor to the door('s pivot).
				myTriggerActors[i].MoveTo(myDoor)
				myTriggerActors.Remove(i)
			EndIf
		EndWhile
		;If anything is still left in the trigger, restart the timer.
		if (myTriggerActors.Length > 0)
			StartTimer(1, 1)
		EndIf
	EndIf
EndEvent