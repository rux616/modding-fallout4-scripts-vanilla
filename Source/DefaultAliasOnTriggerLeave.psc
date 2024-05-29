Scriptname DefaultAliasOnTriggerLeave extends DefaultAlias Const Default
{Default script used for checking if an alias is Triggered, and optionally what Triggered it.}

Group Optional_Properties
	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Triggered by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Triggered by anybody.}

	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these references.
	If ALL arrays are empty then stage is set if Triggered by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these aliases.
	If ALL arrays are empty then stage is set if Triggered by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these factions.
	If ALL arrays are empty then stage is set if Triggered by anybody.}
EndGroup

Event OnTriggerLeave(ObjectReference akActionRef)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnTriggerLeave() Called on DefaultAliasOnTriggerLeave script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerTriggerOnly, RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions)
EndEvent