ScriptName PowerArmorActivatorScript extends ObjectReference

Int Property BatteryLife Auto
Int Property MaxBatteryLife Auto
SystemPowerArmorScript Property SystemPowerArmorQuest Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		;if I'm already in this power armor, step out
		If Self == (SystemPowerArmorQuest.myPowerArmorRef)
			SystemPowerArmorQuest.PowerArmorShutDown()
		;if I'm not in any power armor, step in
		ElseIf (SystemPowerArmorQuest.myPowerArmorRef) == None
			SystemPowerArmorQuest.PowerArmorStartUp(Self, BatteryLife, MaxBatteryLife)
		;if I'm in another suit of power armor, step out, then step in
		Else
			SystemPowerArmorQuest.PowerArmorShutDown()
			SystemPowerArmorQuest.PowerArmorStartUp(Self, BatteryLife, MaxBatteryLife)
		EndIf
	EndIf
EndEvent

;update battery levels based on current data inside the Power Armor System
Function PowerArmorSystemSync(int SystemBatteryLife, int SystemMaxBatteryLife)
	BatteryLife = SystemBatteryLife
	MaxBatteryLife = SystemMaxBatteryLife
EndFunction