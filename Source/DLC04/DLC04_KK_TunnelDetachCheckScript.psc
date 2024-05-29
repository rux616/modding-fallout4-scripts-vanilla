Scriptname DLC04:DLC04_KK_TunnelDetachCheckScript extends ObjectReference Const


Quest Property DLC04_KiddieKingdomMain Auto Const Mandatory

Event OnCellDetach()
	if DLC04_KiddieKingdomMain.IsRunning() && !DLC04_KiddieKingdomMain.GetStageDone(800)
		(DLC04_KiddieKingdomMain as DLC04:DLC04KiddieKingdomMainQuestScript).SetRadMisterState(true)
	endif
EndEvent