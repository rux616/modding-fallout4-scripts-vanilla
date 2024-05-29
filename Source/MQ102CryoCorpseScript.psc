Scriptname MQ102CryoCorpseScript extends actor

Auto STATE WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		;Kill when Parent Ref is activated
		gotoState("hasBeenTriggered")
		Self.KillSilent()
	EndEvent
EndState

State hasBeenTriggered
	;empty State
EndState