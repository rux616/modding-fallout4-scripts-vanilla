Scriptname DefaultAliasOnHit extends DefaultAlias Const Default
{Default script used for checking if an alias is Hit, and optionally what Hit it.}

Group Optional_Properties
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
	RegisterForHitEvent(self) ; get one hit (can't filter on arrays anyway)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnHit() Called on DefaultAliasOnHit script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerHitOnly, RefToCheck = akAggressor, ReferenceArray = HitByReferences, AliasArray = HitByAliases, FactionArray = HitByFactions)
	RegisterForHitEvent(self) ; we're ready for a new hit
EndEvent
