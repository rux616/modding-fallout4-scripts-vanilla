ScriptName TrapFlamethrowerDummy Extends ObjectReference


Spell Property WorkshopTrapFlamethrowerSpell Auto Const
float Property BackupTimer = 15.0 Auto Const

ObjectReference myFlamethrower

Event OnLoad()
	Debug.Trace(self + ": Onload")
	ObjectReference objSelf = self as ObjectReference
	WorkshopTrapFlamethrowerSpell.Cast(objSelf)
	StartTimer(BackupTimer)

EndEvent

Function FireSpell()
	Debug.Trace(self + ": FireSpell")
	ObjectReference objSelf = self as ObjectReference
	WorkshopTrapFlamethrowerSpell.Cast(objSelf)
	StartTimer(BackupTimer)
EndFunction

Function RegisterMyFlamethrower(ObjectReference ft)
	myFlamethrower = ft
	RegisterForRemoteEvent(ft, "OnWorkShopObjectDestroyed")
EndFunction

Event OnCellDetach()
	Debug.Trace(self + ": OnCellDetach")
	myFlamethrower = none
	InterruptCast()
	delete()
EndEvent

Event OnTimer(int aiTimerID)
	Debug.Trace(self + ": OnTimer")
	myFlamethrower = none
	InterruptCast()
	Delete()
EndEvent

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": OnWorkshopObjectDestroyed From >> " + akSender)
	if akSender == myFlamethrower
		CancelTimer()
		Debug.Trace(self + ": Should Be Deleted ")
		myFlamethrower = none
		UnRegisterForRemoteEvent(akSender, "OnWorkShopObjectDestroyed")
		InterruptCast()
		Delete()
	endif
EndEvent