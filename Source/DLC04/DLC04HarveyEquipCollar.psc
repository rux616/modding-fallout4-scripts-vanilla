Scriptname DLC04:DLC04HarveyEquipCollar extends ReferenceAlias

Armor Property DLC04_ShockCollar Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory
ReferenceAlias Property DLC04Harvey Auto Const Mandatory

Event OnLoad()
	IF DLC04Harvey.GetActorRef().IsInLocation(DLC04NukaTownUSALocation)
		DLC04Harvey.GetActorRef().EquipItem(DLC04_ShockCollar, True, True)
	EndIf
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF akNewLoc == DLC04NukaTownUSALocation
		DLC04Harvey.GetActorRef().EquipItem(DLC04_ShockCollar, True, True)
	EndIf
EndEvent