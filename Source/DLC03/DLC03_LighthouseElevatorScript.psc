Scriptname DLC03:DLC03_LighthouseElevatorScript extends ObjectReference

Auto State Idle
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("Busy")
	    PlayAnimationAndWait("Play01", "End")
	    GoToState("Idle")
	EndEvent

EndState

State Busy
EndState