Scriptname DefaultAliasOnAggro extends DefaultAlias Const Default
{Default script used for checking if an alias has attacked or been attacked
 (basically a combination of DefaultAliasOnHit and DefaultAliasOnCombatStateChanged
 }

Group Optional_Properties
	Int Property CombatStateToCheckFor = 4 Auto Const
	{
	0: Not In Combat
	1: In Combat
	2: Searching
	4: In Combat or Searching (DEFAULT)
	}

	ObjectReference[] Property TargetingOrHitByOneOfTheseReferences Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these references.
	If ALL arrays are empty then stage is set if In Combat with or Hit by anybody.}

	ReferenceAlias[] Property TargetingOrHitByOneOfTheseAliases Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these aliases.
	If ALL arrays are empty then stage is set if In Combat with or Hit by anybody.}

	Faction[] Property TargetingOrHitByOneOfTheseFactions Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these factions.
	If ALL arrays are empty then stage is set if In Combat with or Hit by anybody.}

	Bool Property PlayerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if targeting or Hit by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if targeting or Hit by anybody.}
EndGroup

Event OnAliasInit()
	; Preferably we only have a filter in place when the object is loaded, but we won't get load events if the object
	; is already loaded before it is put inside us, so just set up the as soon as the alias is initialized
	RegisterForHitEvent(self) ; just get a single hit (can't filter on arrays anyway)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnHit() Called on DefaultAliasOnHit script.", ShowTraces)
	TryToSetStage(PlayerCheckOverride = PlayerOnly, RefToCheck = akAggressor, ReferenceArray = TargetingOrHitByOneOfTheseReferences, AliasArray = TargetingOrHitByOneOfTheseAliases, FactionArray = TargetingOrHitByOneOfTheseFactions)
	RegisterForHitEvent(self) ; we're ready for another one
EndEvent


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if ((aeCombatState > 0) && (CombatStateToCheckFor == 4)) || (aeCombatState == CombatStateToCheckFor)
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnCombatStateChanged() Called on DefaultAliasOnOnCombatStateChanged script.", ShowTraces)
		TryToSetStage(PlayerCheckOverride = PlayerOnly, RefToCheck = akTarget, ReferenceArray = TargetingOrHitByOneOfTheseReferences, AliasArray = TargetingOrHitByOneOfTheseAliases, FactionArray = TargetingOrHitByOneOfTheseFactions)
	endif	
EndEvent


