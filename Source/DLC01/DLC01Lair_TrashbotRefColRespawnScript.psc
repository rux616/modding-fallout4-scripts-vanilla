Scriptname DLC01:DLC01Lair_TrashbotRefColRespawnScript extends DefaultCollectionAliasRespawnScript
{Variant of DefaultCollectionAliasRespawnScript, used for the Trashbots in the Mechanist Battle.}

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	;Debug.Trace("Respawning actor OnDeath")
	if bRespawningOn
		DLC01Lair_TrashbotQuestRespawnScript myQuest = GetOwningQuest() as DLC01Lair_TrashbotQuestRespawnScript
		if myQuest
			myQuest.TryToRespawnCollection(self, akSenderRef as Actor)
		else
			Game.Warning(self + " ERROR: quest is not a defaultQuestRespawnScript")
		endif
	endif
endEvent
