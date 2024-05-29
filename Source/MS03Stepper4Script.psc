Scriptname MS03Stepper4Script extends ReferenceAlias

Message Property MS03TempPasswordMessage Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(500) == 1 && GetOwningQuest().GetStageDone(600) == 0
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(600)
			MS03TempPasswordMessage.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState
