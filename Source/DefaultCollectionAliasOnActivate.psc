Scriptname DefaultCollectionAliasOnActivate extends DefaultCollectionAlias Default
{Default script used for checking if a collection alias is activated, and optionally what Activated it.}

Group Optional_Properties
	bool property setStageWhenAnyRefActivated = false auto const
	{
	 	FALSE (default) = the stage to be set only when all refs in the collection are activated 
		TRUE = stage is set when ANY ref is activated  
	} 

	Bool Property PlayerActivateOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Activated by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Activated by anybody.}

	ObjectReference[] Property ActivatedByReferences Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these references.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	ReferenceAlias[] Property ActivatedByAliases Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these aliases.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	Faction[] Property ActivatedByFactions Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these factions.
	If ALL arrays are empty then stage is set if Activated by anybody.}
EndGroup

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
	debug.Trace(self + ": OnActivate() Called on DefaultCollectionAliasOnActivate script by " + akSenderRef + ".")
	if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions, PlayerCheckOverride = PlayerActivateOnly) == TRUE)
		TryToSetStage(TriggeredRef = akSenderRef, setStageOnSingleTrigger = setStageWhenAnyRefActivated, PlayerCheckOverride = PlayerActivateOnly, RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions)
	endif
EndEvent

