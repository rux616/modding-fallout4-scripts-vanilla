Scriptname DefaultAliasOnOpen extends DefaultAlias Const Default
{Default script used for checking if an alias has been opened.}

Group Optional_Properties
	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Opened by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Opened by anybody.}

	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: Stage will be set if Opened by any of these references.
	If ALL arrays are empty then stage is set if Opened by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: Stage will be set if Opened by any of these aliases.
	If ALL arrays are empty then stage is set if Opened by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: Stage will be set if Opened by any of these factions.
	If ALL arrays are empty then stage is set if Opened by anybody.}
EndGroup


Event OnOpen(ObjectReference akActionRef)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnOpen() Called on DefaultAliasOnOnOpen script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerTriggerOnly, RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions)
EndEvent
