Scriptname MS03Stepper3Script extends ReferenceAlias

Message Property MS03TempOverseerMessage2 Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(100) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(450)
			MS03TempOverseerMessage2.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState
