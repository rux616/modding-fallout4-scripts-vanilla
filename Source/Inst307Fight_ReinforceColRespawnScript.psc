Scriptname Inst307Fight_ReinforceColRespawnScript extends RefCollectionAlias Hidden
{Inst307 Fight - Phase 1. RefCollectionAlias script for respawning Phase 1 synth reinforcements.}
;
;This is just a named variant of defaultCollectionAliasRespawnScript.

Group Optional_Properties
	bool Property bRespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	;Debug.Trace("Respawning Reinforcement Synth OnDeath")
	if bRespawningOn
		defaultQuestRespawnScript myQuest = GetOwningQuest() as Inst307Fight_ReinforceRespawnQScript
		if myQuest
			myQuest.TryToRespawnCollection(self, akSenderRef as Actor)
		else
			Game.Warning(self + " ERROR: quest is not a defaultQuestRespawnScript")
		endif
	endif
endEvent
