Scriptname DLC04:DLC04HarveyCollarScript extends Actor Const

Armor Property DLC04_ShockCollar Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory
Actor Property DLC04Harvey Auto Const Mandatory
Quest Property DLC04RaiderKickout Auto Const Mandatory

Event OnLoad()
	IF DLC04Harvey.IsInLocation(DLC04NukaTownUSALocation) && DLC04RaiderKickout.GetStageDone(10) == 0
		DLC04Harvey.EquipItem(DLC04_ShockCollar, True, True)
	EndIf
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF akNewLoc == DLC04NukaTownUSALocation && DLC04RaiderKickout.GetStageDone(10) == 0
		DLC04Harvey.EquipItem(DLC04_ShockCollar, True, True)
	EndIf
EndEvent