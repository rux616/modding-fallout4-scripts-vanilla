Scriptname DN084_ElevatorDisableFastTravelScript extends ObjectReference Hidden
{Trigger that disables fast travel while the player is taking the exterior glass elevator down.}
;
;We need to disable fast travel while the player is taking the exterior glass elevator down, since fast-travelling away can
;cause unexpected behavior. However, we can't just do that in the elevator script, because the player can slip out of the
;elevator before the doors shut. So each elevator closes its doors, turns this trigger on, and then turns it back off, giving
;it a chance to detect the player's presence and disable fast travel if the player is really inside.

DN084_GlassElevatorScript property DN084_ExteriorGlassElevator1 Auto Const Mandatory
{Exterior Glass Elevator 1}

DN084_GlassElevatorScript property DN084_ExteriorGlassElevator2 Auto Const Mandatory
{Exterior Glass Elevator 1}


;If the player is inside this trigger, notify the active elevator.
Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (DN084_ExteriorGlassElevator1.isActiveElevator)
			DN084_ExteriorGlassElevator1.DisableFastTravel()
		Else
			DN084_ExteriorGlassElevator2.DisableFastTravel()
		EndIf
	EndIf
EndEvent