Scriptname MQ102StrobeLightScript extends ReferenceAlias

Auto State Waiting
	Event OnLoad()
		;animate light
		Self.GetRef().PlayAnimation("Stage2")
		gotoState("HasBeenTriggered")
	EndEvent
EndState

State HasBeenTriggered
	;empty state
EndState