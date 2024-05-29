Scriptname DN138Elevator extends ObjectReference Hidden



auto State DownPosition
	Function MoveElevator()
		GoToState("MovingUp")
		RegisterForAnimationEvent(self, "done")
		PlayAnimation("TopLevel")
	EndFunction
EndState


State UpPosition
	Function MoveElevator()
		GoToState("MovingDown")
		RegisterForAnimationEvent(self, "done")
		PlayAnimation("GroundLevel")
	EndFunction
EndState


State MovingUp
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "done"
			GoToState("UpPosition")
			UnRegisterForAnimationEvent(self, "done")
		endif
	EndEvent
EndState


State MovingDown
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "done"
			GoToState("DownPosition")
			UnRegisterForAnimationEvent(self, "done")
		endif
	EndEvent
EndState

Function MoveElevator()
	;Cause I have to
EndFunction