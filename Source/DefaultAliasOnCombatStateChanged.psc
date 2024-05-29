Scriptname DefaultAliasOnCombatStateChanged extends DefaultAlias Const Default
{Default script used for checking if an alias has changed combat state, and optionally who it's target is.}

Group Optional_Properties
	Int Property CombatStateToCheckFor = 4 Auto Const
	{
	0: Not In Combat
	1: In Combat
	2: Searching
	4: In Combat or Searching (DEFAULT)
	}

	ObjectReference[] Property TargetIsOneOfTheseReferences Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these references.
	If ALL arrays are empty then stage is set if In Combat with anybody.}

	ReferenceAlias[] Property TargetIsOneOfTheseAliases Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these aliases.
	If ALL arrays are empty then stage is set if In Combat with anybody.}

	Faction[] Property TargetIsOneOfTheseFactions Auto Const
	{OPTIONAL: Stage will be set if In Combat with any of these factions.
	If ALL arrays are empty then stage is set if In Combat with anybody.}
EndGroup

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if ((aeCombatState > 0) && (CombatStateToCheckFor == 4)) || (aeCombatState == CombatStateToCheckFor)
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnCombatStateChanged() Called on DefaultAliasOnOnCombatStateChanged script.", ShowTraces)
		TryToSetStage(RefToCheck = akTarget, ReferenceArray = TargetIsOneOfTheseReferences, AliasArray = TargetIsOneOfTheseAliases, FactionArray = TargetIsOneOfTheseFactions)
	endif	
EndEvent
 