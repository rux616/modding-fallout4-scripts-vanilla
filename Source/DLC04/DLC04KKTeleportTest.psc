Scriptname DLC04:DLC04KKTeleportTest extends ObjectReference

DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory


Event OnActivate(ObjectReference akActionRef)
	if !(DLC04_KiddieKingdomMain as quest).isRunning()
		(DLC04_KiddieKingdomMain as quest).setstage(0)
	Endif	

	DLC04_KiddieKingdomMain.TeleportTest()
EndEvent
