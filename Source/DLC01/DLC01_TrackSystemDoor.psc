Scriptname DLC01:DLC01_TrackSystemDoor extends Default2StateActivator
{Part of the DLC01 Track System. Script on the Default2StateActivator switch doors at the ends of the track.}
;
;In addition to the normal Default2StateActivator behavior, these doors won't shut if there are any actors in the
;associated trigger (to make sure the player can't get trapped inside, etc.).


Group Autofill_Properties
	Keyword property LinkCustom02 Auto Const	;Link to the door's associated trigger.
EndGroup

;Local properties.
DLC01:DLC01_TrackSystemDoorTrigger myTrigger 	;The trigger associated with this door. [LinkCustom02]


;Initialize the door and its trigger. Called by DLC01_TrackSystemTrack as part of its initialization.
Function InitDoor(DLC01:DLC01_TrackSystemTrack track, int doorID)
	myTrigger = Self.GetLinkedRef(LinkCustom02) as DLC01:DLC01_TrackSystemDoorTrigger
	if (myTrigger != None)
		myTrigger.InitTrigger(track, Self)
	EndIf
EndFunction

;Make sure the door doesn't shut if anything is in the associated trigger.
Function SetOpen(bool abOpen = true)
	;Handle an edge case from Default2StateActivator.
	;On the off-chance that SetOpen was called while SetOpenNoWait was in its timer loop, make sure to cancel the timer.
	CancelTimer(0)

	if ((Self.Is3DLoaded()) && (!abOpen) && (myTrigger != None) && (myTrigger.GetTriggerObjectCount() > 0))
		;If we're trying to close (abOpen=False), we have a trigger, and something is in the trigger, delay and try again later.
		StartTimer(1)
	Else
		;In any other case, just let the parent handle opening or closing the door.
		Parent.SetOpen(abOpen)
	EndIf
EndFunction