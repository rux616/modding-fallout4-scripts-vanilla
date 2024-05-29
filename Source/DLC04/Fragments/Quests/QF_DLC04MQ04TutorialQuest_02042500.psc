;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04TutorialQuest_02042500 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForMapTutorialEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialClearRaiderSettlement()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
