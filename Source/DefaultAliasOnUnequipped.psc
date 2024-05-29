Scriptname DefaultAliasOnUnequipped extends DefaultAlias Const Default
{Default script used for checking if an alias is Unequipped, and optionally what Unequipped it.}

Group Optional_Properties
	Bool Property PlayerUnequippedOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Unequipped by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Unequipped by anybody.}

	ObjectReference[] Property UnequippedByReferences Auto Const
	{OPTIONAL: Stage will be set if Unequipped by any of these references.
	If ALL arrays are empty then stage is set if Unequipped by anybody.}

	ReferenceAlias[] Property UnequippedByAliases Auto Const
	{OPTIONAL: Stage will be set if Unequipped by any of these aliases.
	If ALL arrays are empty then stage is set if Unequipped by anybody.}

	Faction[] Property UnequippedByFactions Auto Const
	{OPTIONAL: Stage will be set if Unequipped by any of these factions.
	If ALL arrays are empty then stage is set if Unequipped by anybody.}
EndGroup

Event OnUnequipped(Actor akActor)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnUnequipped() Called on DefaultAliasOnOnUnequipped script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerUnequippedOnly, RefToCheck = akActor, ReferenceArray = UnequippedByReferences, AliasArray = UnequippedByAliases, FactionArray = UnequippedByFactions)
EndEvent