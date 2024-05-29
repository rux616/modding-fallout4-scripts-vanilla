Scriptname DefaultCollectionAliasOnHit extends DefaultCollectionAlias Default
{Default script used for checking if a collection alias is hit, and optionally what Activated it.}

Group Optional_Properties
	bool property setStageWhenAnyRefHit = true auto const
	{
	 	FALSE = the stage to be set only when all refs in the collection are hit 
		TRUE (default) = stage is set when ANY ref is hit  
	} 

	Bool Property PlayerHitOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Hit by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Hit by anybody.}

	ObjectReference[] Property HitByReferences Auto Const
	{OPTIONAL: Stage will be set if Hit by any of these references.
	If ALL arrays are empty then stage is set if Hit by anybody.}

	ReferenceAlias[] Property HitByAliases Auto Const
	{OPTIONAL: Stage will be set if Hit by any of these aliases.
	If ALL arrays are empty then stage is set if Hit by anybody.}

	Faction[] Property HitByFactions Auto Const
	{OPTIONAL: Stage will be set if Hit by any of these factions.
	If ALL arrays are empty then stage is set if Hit by anybody.}
EndGroup

Event OnAliasInit()
	; Preferably we only have a filter in place when the object is loaded, but we won't get load events if the object
	; is already loaded before it is put inside us, so just set up the filter now that the alias is initialized
	RegisterForHitEvent(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace(self + "OnHit " + akTarget + " " + akAggressor)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnHit() Called on DefaultCollectionAliasOnHit script. akAggressor=" + akAggressor, ShowTraces)
	if !TryToSetStage(TriggeredRef = akTarget, setStageOnSingleTrigger = setStageWhenAnyRefHit, PlayerCheckOverride = PlayerHitOnly, RefToCheck = akAggressor, ReferenceArray = HitByReferences, AliasArray = HitByAliases, FactionArray = HitByFactions)
		; if stage not set, reregister
		RegisterForHitEvent(self)
	endif
EndEvent