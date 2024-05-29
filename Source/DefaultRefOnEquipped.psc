Scriptname DefaultRefOnEquipped extends DefaultRef Const Default
{Default script used for checking if this reference has been equipped, and optionally who equipped it.}

Group Optional_Properties
	Bool Property PlayerEquippedOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Equipped by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Equipped by anybody.}

	ObjectReference[] Property EquippedByReferences Auto Const
	{OPTIONAL: Stage will be set if Equipped by any of these references.
	If ALL arrays are empty then stage is set if Equipped by anybody.}

	ReferenceAlias[] Property EquippedByAliases Auto Const
	{OPTIONAL: Stage will be set if Equipped by any of these aliases.
	If ALL arrays are empty then stage is set if Equipped by anybody.}

	Faction[] Property EquippedByFactions Auto Const
	{OPTIONAL: Stage will be set if Equipped by any of these factions.
	If ALL arrays are empty then stage is set if Equipped by anybody.}
EndGroup

Event OnEquipped(Actor akActor)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnEquipped() Called on DefaultRefOnEquipped script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerEquippedOnly, RefToCheck = akActor, ReferenceArray = EquippedByReferences, AliasArray = EquippedByAliases, FactionArray = EquippedByFactions)
EndEvent