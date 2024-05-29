;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01CodsworthCompanionDa_0100EAD4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01CodsworthCompanionDataUpdate
Quest __temp = self as Quest
DLC01:DLC01CodsworthCompanionDataUpdate kmyQuest = __temp as DLC01:DLC01CodsworthCompanionDataUpdate
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateDataAndUndoHatred()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
