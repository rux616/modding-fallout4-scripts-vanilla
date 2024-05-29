Scriptname MS05ActivateGasLine extends ReferenceAlias
{Called when the player activates the gas line on Stage 330 of MS05}

Message Property MS05TempGasPipeMessage Auto

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		If akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(330) == 1
			;go to the empty state to prevent activation spam
			gotoState("EmptyState")
			GetOwningQuest().SetStage(340)
			MS05TempGasPipeMessage.Show()
		EndIF
	EndEvent
EndState

State EmptyState
	;empty state - activation has triggered
EndState