ScriptName DLC01:DLC01_TrackSystemTrapElectricArc extends DLC01:DLC01_TrackSystemTrapBase
{Part of the DLC01 Track System. Script on a dummy object; when activated, fires electric arcs from the associated arm.}
;This script does NOT extend TrapElectricArc or TrapBase, since it doesn't really use any of their functionality.

;Autofill Properties
Group Autofill_Properties
	Static property XMarker Auto Const Mandatory 						;XMarker
	Spell property DLC01TrackSystem_TrapElectricArcSpell Auto Const Mandatory 	;Our version the electric arc spell.
EndGroup

;Local variables.
DLC01:DLC01_TrackSystemMachine myMachine	;The Machine associated with the trap.
ObjectReference myArm					;The Machine Arm associated with this trap; we throw spells from the arm at target points.
ObjectReference[] actorsInTrigger			;The Electric Arc trap's arm has a built-in cylindrcal trigger so we can track which actors are in range.
									;Interaction conditions on the trigger limit it to living, conscious actors.
ObjectReference targetMarker				;If no actors are in range, we cast the spell at a target marker instead.

;Timer Properties
int FIRE_TIMER = 1 Const


Function InitTrap(DLC01:DLC01_TrackSystemMachine m)
	myMachine = m 
	myArm = myMachine.GetArm()
	actorsInTrigger = new ObjectReference[0]
	targetMarker = Self.PlaceAtMe(XMarker)

	;Register for Enter and Leave events on the trigger.
	Self.RegisterForRemoteEvent(myArm, "OnTriggerEnter")
	Self.RegisterForRemoteEvent(myArm, "OnTriggerLeave")
			
	;Then start firing bolts.
	StartTimer(0, FIRE_TIMER)
EndFunction


;On Unload, the track system will disable and delete us anyway, so make sure all of our
;objects get cleaned up.
Event OnUnload()
	Self.UnregisterForAllEvents()
	CancelTimer(FIRE_TIMER)
	myMachine = None
	myArm = None
	actorsInTrigger = None
	targetMarker.DisableNoWait()
	targetMarker.Delete()
	targetMarker = None
EndEvent


;Handle events for myArm's trigger.
Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
	if (actorsInTrigger.Find(akActionRef) < 0)
		actorsInTrigger.Add(akActionRef)
	EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
	int index = actorsInTrigger.Find(akActionRef)
	if (index >= 0)
		actorsInTrigger.Remove(index)
	EndIf
EndEvent


Event OnTimer(int timerID)
	if (timerID == FIRE_TIMER)
		;We don't fire if:
		; - The trap isn't loaded.
		; - The trap's machine is paused.
		; - The trap's machine is set to prohibit dropoffs. In this context, we interpret that as 'Keep moving but stop firing.'
		if (Is3DLoaded() && !myMachine.IsPaused() && !myMachine.IsDropoffProhibited())
			;Decide where to fire at.
			int actorCount = actorsInTrigger.Length - 1
			if (actorCount >= 0)
				;If we have targets in the trigger, fire at one of them.
				ObjectReference target = actorsInTrigger[Utility.RandomInt(0, actorCount)]
				DLC01TrackSystem_TrapElectricArcSpell.Cast(myArm, target)
			Else
				;Otherwise, cast the spell at a random point.
				targetMarker.MoveToNode(myArm, "ArcTarget01")
				targetMarker.MoveTo(targetMarker, afXOffset=Utility.RandomFloat(-384, 384), afYOffset=Utility.RandomFloat(-384, 384))
				DLC01TrackSystem_TrapElectricArcSpell.Cast(myArm, targetMarker)
			EndIf

			;Then restart the timer.
			StartTimer(Utility.RandomFloat(0.125, 0.25), FIRE_TIMER)
		EndIf
	EndIf
EndEvent