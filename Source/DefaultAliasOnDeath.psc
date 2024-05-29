Scriptname DefaultAliasOnDeath extends DefaultAlias Const Default
{Default script used for checking if an alias is Killed, and optionally what Killed it.}

Group Optional_Properties
	Bool Property UseOnDyingInstead = FALSE Auto Const
	{OPTIONAL: Default = FALSE, If TRUE then StageToSet will be set when OnDying() event is sent, which happens the second this actor dies, not a 
	few seconds after they are dead, which is when OnDeath() gets sent.}

	ObjectReference[] Property KilledByReferences Auto Const
	{OPTIONAL: Stage will be set if Killed by any of these references.
	If ALL arrays are empty then stage is set if Killed by anybody.}

	ReferenceAlias[] Property KilledByAliases Auto Const
	{OPTIONAL: Stage will be set if Killed by any of these aliases.
	If ALL arrays are empty then stage is set if Killed by anybody.}

	Faction[] Property KilledByFactions Auto Const
	{OPTIONAL: Stage will be set if Killed by any of these factions.
	If ALL arrays are empty then stage is set if Killed by anybody.}
EndGroup

Event OnDeath(Actor akKiller)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDeath() Called on DefaultAliasOnDeath script.", ShowTraces)
	if UseOnDyingInstead == false
		TryToSetStage(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions)
	endif
EndEvent

Event OnDying(Actor akKiller)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDying() Called on DefaultAliasOnDeath script.", ShowTraces)
	if UseOnDyingInstead == true
		TryToSetStage(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions)
	endif
EndEvent