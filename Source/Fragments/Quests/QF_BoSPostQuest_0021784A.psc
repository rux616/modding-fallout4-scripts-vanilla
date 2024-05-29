;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSPostQuest_0021784A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE BoSPostQuestScript
Quest __temp = self as Quest
BoSPostQuestScript kmyQuest = __temp as BoSPostQuestScript
;END AUTOCAST
;BEGIN CODE
;Post Quest Packages and Endgate Vars
;This is kicked off in BoS305 Stage 10 (BoS Win) or 
kmyQuest.BoSEndGates()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Never use
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
