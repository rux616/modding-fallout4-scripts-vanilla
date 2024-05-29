Scriptname MQ101GearDoorOpenStateScript extends ObjectReference

;when Vault door loads, put it in the open state
Auto State WaitingForLoad
	Event OnLoad()
		gotoState("doneState")
		Self.PlayAnimation("GameStart")
	EndEvent
EndState

State doneState
	;empty state
EndState
