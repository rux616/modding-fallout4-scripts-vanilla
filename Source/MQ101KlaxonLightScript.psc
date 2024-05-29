Scriptname MQ101KlaxonLightScript extends ObjectReference

Auto State Waiting
	Event OnLoad()
		gotoState("HasBeenTriggered")
		;animate light
		Self.PlayAnimation("Stage2")
		Self.GetLinkedRef().PlayAnimation("Stage2")
	EndEvent
EndState

State HasBeenTriggered
	;empty state
EndState