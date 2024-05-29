;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN084_BoS303Battle_000F8D39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE defaultcounterquesta
Quest __temp = self as Quest
defaultcounterquesta kmyQuest = __temp as defaultcounterquesta
;END AUTOCAST
;BEGIN CODE
;Startup

;Prevent the quest counter from tracking deaths until the player enters the battle.
kMyQuest.GoToState("StopCounting")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE defaultcounterquesta
Quest __temp = self as Quest
defaultcounterquesta kmyQuest = __temp as defaultcounterquesta
;END AUTOCAST
;BEGIN CODE
;When the player enters the lobby, disable infinite respawning and start tracking deaths.

;Allow the counter to begin tracking deaths.
kMyQuest.GoToState("AllowCounting")

;Stop BoS Infinite Respawn
DefaultQuestRespawnScriptA selfAsA = ((Self as Quest)  as DefaultQuestRespawnScriptA)
selfAsA.respawnCount = 0
selfAsA.respawnPool = 5

;Stop Inst Infinite Respawn
DefaultQuestRespawnScriptB selfAsB = ((Self as Quest)  as DefaultQuestRespawnScriptB)
selfAsB.respawnCount = 0
selfAsB.respawnPool = 8
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Notify DN084 that the battle has ended.
DN084.SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE DN084_FinalBattleQuestScript
Quest __temp = self as Quest
DN084_FinalBattleQuestScript kmyQuest = __temp as DN084_FinalBattleQuestScript
;END AUTOCAST
;BEGIN CODE
;Clean up the combatants.
kMyQuest.CleanupCombatants(allCombatants)

;Cleanup the corpses.
kMyQuest.CleanupCorpses()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN084 Auto Const

ReferenceAlias[] property AllCombatants Auto Const
