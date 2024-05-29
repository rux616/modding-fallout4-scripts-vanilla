;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MasterQuest_0100880B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaiderControllerQuestScript
Quest __temp = self as Quest
DLC04:DLC04RaiderControllerQuestScript kmyQuest = __temp as DLC04:DLC04RaiderControllerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ModRaiderScore(DLC04GangIDDisciples,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaiderControllerQuestScript
Quest __temp = self as Quest
DLC04:DLC04RaiderControllerQuestScript kmyQuest = __temp as DLC04:DLC04RaiderControllerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ModRaiderScore(DLC04GangIDOperators,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaiderControllerQuestScript
Quest __temp = self as Quest
DLC04:DLC04RaiderControllerQuestScript kmyQuest = __temp as DLC04:DLC04RaiderControllerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ModRaiderScore(DLC04GangIDPack,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Shutdown in DLC04MQ05 (Rankings no longer needed)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04GangIDDisciples Auto Const Mandatory
GlobalVariable Property DLC04GangIDPack Auto Const Mandatory
GlobalVariable Property DLC04GangIDOperators Auto Const Mandatory
