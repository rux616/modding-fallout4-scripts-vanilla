;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04PostQuestFlags_0104690A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC04MQ03.SetStage(110)
DLC04MQ03.SetStage(210)
DLC04MQ03.SetStage(310)
DLC04MQ03.SetStage(410)
DLC04MQ03.SetStage(510)
DLC04EnemyGang.SetValue(1)
DLC04MQ03ClaimedBP.SetValue(1)
DLC04MQ03ClaimedGZ.SetValue(1)
DLC04MQ03ClaimedDRG.SetValue(2)
DLC04MQ03ClaimedKK.SetValue(2)
DLC04MQ03ClaimedSA.SetValue(2)
DLC04ParkPopulationHandler.Start()
DLC04MQ05.SetStage(255)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DLC04MQ03.SetStage(110)
DLC04MQ03.SetStage(210)
DLC04MQ03.SetStage(310)
DLC04MQ03.SetStage(410)
DLC04MQ03.SetStage(510)
DLC04EnemyGang.SetValue(2)
DLC04MQ03ClaimedBP.SetValue(2)
DLC04MQ03ClaimedGZ.SetValue(2)
DLC04MQ03ClaimedDRG.SetValue(1)
DLC04MQ03ClaimedKK.SetValue(1)
DLC04MQ03ClaimedSA.SetValue(1)
DLC04ParkPopulationHandler.Start()
DLC04MQ05.SetStage(255)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
DLC04MQ03.SetStage(110)
DLC04MQ03.SetStage(210)
DLC04MQ03.SetStage(310)
DLC04MQ03.SetStage(410)
DLC04MQ03.SetStage(510)
DLC04EnemyGang.SetValue(3)
DLC04MQ03ClaimedBP.SetValue(3)
DLC04MQ03ClaimedGZ.SetValue(3)
DLC04MQ03ClaimedDRG.SetValue(2)
DLC04MQ03ClaimedKK.SetValue(2)
DLC04MQ03ClaimedSA.SetValue(2)
DLC04ParkPopulationHandler.Start()
DLC04MQ05.SetStage(255)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04PostQuestFlagsQuestScript
Quest __temp = self as Quest
DLC04:DLC04PostQuestFlagsQuestScript kmyQuest = __temp as DLC04:DLC04PostQuestFlagsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ZoneReset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04ParkPopulationHandler Auto Const Mandatory

Quest Property DLC04MQ05 Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

GlobalVariable Property DLC04MQ03ClaimedBP Auto Const Mandatory

GlobalVariable Property DLC04MQ03ClaimedGZ Auto Const Mandatory

GlobalVariable Property DLC04MQ03ClaimedDRG Auto Const Mandatory

GlobalVariable Property DLC04MQ03ClaimedKK Auto Const Mandatory

GlobalVariable Property DLC04MQ03ClaimedSA Auto Const Mandatory

Quest Property DLC04MQ03 Auto Const Mandatory
