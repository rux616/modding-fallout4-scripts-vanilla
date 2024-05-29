;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN151_Tracking_00048327 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DN151_TrackingQuestScript
Quest __temp = self as Quest
DN151_TrackingQuestScript kmyQuest = __temp as DN151_TrackingQuestScript
;END AUTOCAST
;BEGIN CODE
;On cell load, the pump terminal sets this stage to run the initial terminal text update.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
