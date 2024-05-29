;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CompanionAffinity_001C5099 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE CompanionAffinityEventQuestScript
Quest __temp = self as Quest
CompanionAffinityEventQuestScript kmyQuest = __temp as CompanionAffinityEventQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForCustomEvent(kmyQuest, "CompanionAffinityEvent")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
