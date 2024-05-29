Scriptname MinDefendCastleLoadedMarker extends ObjectReference Const

Quest Property MinDefendCastle Auto Const

Event OnCellAttach()
	Debug.Trace("Our parent cell has attached")
	If MinDefendCastle.IsRunning()
		(MinDefendCastle as MinDefendCastleAttackScript).SetAreaLoaded(TRUE)
	EndIf
EndEvent


Event OnCellDetach()
	Debug.Trace("Our parent cell has detached")
	If MinDefendCastle.IsRunning()
		(MinDefendCastle as MinDefendCastleAttackScript).SetAreaLoaded(FALSE)
	EndIf
EndEvent