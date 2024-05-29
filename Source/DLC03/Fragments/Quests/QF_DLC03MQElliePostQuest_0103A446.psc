;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQElliePostQuest_0103A446 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQElliePostQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQElliePostQuestScript kmyQuest = __temp as DLC03:DLC03MQElliePostQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

;register to shut everything down if Nick hates you
kmyquest.RegisterForRemoteEvent(COMNick, "OnStageSet")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;make sure the objective isn't displayed
SetObjectiveDisplayed(10, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ01 Auto Const Mandatory

Quest Property COMNick Auto Const Mandatory
