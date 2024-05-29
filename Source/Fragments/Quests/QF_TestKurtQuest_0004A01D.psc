;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestKurtQuest_0004A01D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE TestKurtQuestScript
Quest __temp = self as Quest
TestKurtQuestScript kmyQuest = __temp as TestKurtQuestScript
;END AUTOCAST
;BEGIN CODE
; test disable controls
kmyQuest.myLayer = InputEnableLayer.Create()
kmyQuest.myLayer.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE TestKurtQuestScript
Quest __temp = self as Quest
TestKurtQuestScript kmyQuest = __temp as TestKurtQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.myLayer.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

inputenablelayer Property myLayer Auto Const
