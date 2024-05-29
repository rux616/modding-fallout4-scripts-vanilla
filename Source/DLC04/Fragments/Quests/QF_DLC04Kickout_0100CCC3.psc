;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04Kickout_0100CCC3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KickOutQuestScript
Quest __temp = self as Quest
DLC04:DLC04KickOutQuestScript kmyQuest = __temp as DLC04:DLC04KickOutQuestScript
;END AUTOCAST
;BEGIN CODE
;Do whatever maintenance needs to be done here
kmyQuest.DLC04KickGo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
