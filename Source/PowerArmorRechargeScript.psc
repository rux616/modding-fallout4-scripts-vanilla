Scriptname PowerArmorRechargeScript extends ObjectReference  

SystemPowerArmorScript Property SystemPowerArmorQuest Auto
Race Property PowerArmorRace Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		If Game.GetPlayer().GetRace() == PowerArmorRace
			SystemPowerArmorQuest.PowerArmorRecharge(20)
		EndIf
	EndIf

EndEvent