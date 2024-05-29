Scriptname InstM02Terminal3 extends ReferenceAlias
{When the player accesses terminal 3 in Dr. Binet's lab, this script pops a message box and sets stage 600}

Message Property InstM02Terminal3Message Auto Const

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(400) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(600)
			InstM02Terminal3Message.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState
