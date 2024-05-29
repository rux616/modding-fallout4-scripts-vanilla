Scriptname DLC04:DLC04_KK_PumpDeactivatorScript extends ObjectReference Const

Quest property DLC04_KiddieKingdomMain Auto Const Mandatory

Event onActivate(objectReference akActivator)
	if  DLC04_KiddieKingdomMain.IsRunning()
		 (DLC04_KiddieKingdomMain as DLC04:DLC04KiddieKingdomMainQuestScript).SetRadMisterState(False)
	Endif
EndEvent


