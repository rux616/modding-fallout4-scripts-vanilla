;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RelayTowerQuest_0003C605 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RelayTowerQuestScript
Quest __temp = self as Quest
RelayTowerQuestScript kmyQuest = __temp as RelayTowerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAllScenes()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
