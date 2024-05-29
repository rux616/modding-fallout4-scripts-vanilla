Scriptname MS03Stepper7Script extends ReferenceAlias

Message Property MS03TempEscapeMessage Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(800) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(900)
			MS03TempEscapeMessage.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState
