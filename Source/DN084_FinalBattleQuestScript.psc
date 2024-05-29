Scriptname DN084_FinalBattleQuestScript extends Quest Hidden
{Script for the DN084 Final Battle quests. Cleans up corpses and combatants when the owning quest shuts down.}

ObjectReference[] corpses

Function AddCorpse(ObjectReference corpse)
	if (corpses == None)
		corpses = new ObjectReference[0]
	EndIf
	corpses.Add(corpse)
EndFunction

;Cleanup any corpses tracked by this script.
Function CleanupCorpses()
	int i = 0
	While (i < corpses.Length)
		corpses[i].Disable()
		corpses[i].Delete()
		i = i + 1
	EndWhile
	;Then discard the array itself.
	corpses = None
EndFunction

;Cleanup any surviving combatants from the battle.
Function CleanupCombatants(ReferenceAlias[] combatants)
	ObjectReference combatant
	int i = 0
	While (i < combatants.Length)
	     combatant = combatants[i].GetReference()
	     combatant.Disable()
	     combatant.Delete()
	     i = i + 1
	EndWhile
EndFunction