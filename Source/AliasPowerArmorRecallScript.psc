Scriptname AliasPowerArmorRecallScript extends ReferenceAlias

Quest Property PowerArmorRecallQuest auto
ReferenceAlias Property PowerArmorRef auto
ObjectReference Property PowerArmorLastUsed auto
{Pointer to Power Armor Furniture reference last used by the player.}

Keyword Property FurnitureTypePowerArmor auto
{autofill - used to check for Power Armor furniture.}

Actor playerRef

Event OnInit()
	playerRef = game.GetPlayer()
	RegisterForRemoteEvent(PlayerRef, "OnSit")
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	HandleOnSit(akFurniture)
EndEvent

Function HandleOnSit(ObjectReference akFurniture)
	if akFurniture.HasKeyword(FurnitureTypePowerArmor)
		PowerArmorLastUsed = akFurniture
		debug.trace(self + "PowerArmorLastUsed: " + PowerArmorLastUsed)
		PowerArmorRef.ForceRefTo(PowerArmorLastUsed)
	endif
EndFunction

ReferenceAlias Function GetPowerArmorLastUsed()
	debug.trace(self + "PowerArmorRef: " + PowerArmorRef)
	Return PowerArmorRef
EndFunction