Scriptname MQ101VertibirdSoldierScript extends ReferenceAlias

Keyword Property LinkPowerArmor Auto
Keyword Property LinkVehicle Auto


;snap guys into their power armor
Event OnAliasInit()
	;Self.GetActorRef().SwitchToPowerArmor(Self.GetActorRef().GetLinkedRef(LinkPowerArmor))
EndEvent