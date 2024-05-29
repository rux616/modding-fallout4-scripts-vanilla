;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_RQ_KillRivalBoss_01017F46 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 0 - Startup")

;*** DOUBLE CHECK PARAMS IF COPYING AND PASTING***
kmyquest.FillAliasesIfNeededAndSetQuestData( allowHelpSettlement = true, allowMischief = true )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 9 - Player Refused Quest")
kmyquest.PlayerRefusedQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 10 - Player Accepted Quest")
kmyquest.PlayerAcceptedQuest()

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 100 - Player Completed All Objectives")

SetObjectiveCompleted(10)

SetObjectiveDisplayed(100)

kmyquest.DLC04_RQ_Manager.SetAffinityQuestStageForTarget(Alias_Target.GetActorReference(), Killed = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 150 - Player Received Reward")
kmyquest.RewardPlayer()
kmyquest.PlayerCompletedQuest()
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
failAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 255 - Shutdown")
kmyquest.DeleteSpawnedReferences()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_target Auto Const Mandatory
