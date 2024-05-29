Scriptname vaultExitElevatorDownSCRIPT extends ObjectReference

OBJECTREFERENCE PROPERTY elevator AUTO

QUEST PROPERTY pMQ102 AUTO

Auto State WaitingForTrigger
	EVENT OnTriggerEnter(ObjectReference akActionRef)
		If (pMQ102.getStage() >= 9 && (akActionRef == game.getPlayer()))
			GoToState("hasbeentriggered")
			Self.Disable()
			elevator.PlayAnimation("stage2")
		EndIf
	ENDEVENT
EndState

State hasbeentriggered
	;empty state
EndState