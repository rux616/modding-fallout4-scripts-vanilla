Scriptname MS03Stepper1Script extends ReferenceAlias
{Steps quest from 100 to 200 and displays a message}

Message Property MS03TempHydroponicsMessage Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(100) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(200)
			MS03TempHydroponicsMessage.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState
