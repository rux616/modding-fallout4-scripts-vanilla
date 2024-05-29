Scriptname MS03Stepper2Script extends ReferenceAlias
{Temp script for stepper 2 in MS03}

Message Property MS03TempOverseerMessage Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(100) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(400)
			MS03TempOverseerMessage.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState

