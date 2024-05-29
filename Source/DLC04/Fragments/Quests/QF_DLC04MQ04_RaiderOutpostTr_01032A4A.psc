;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04_RaiderOutpostTr_01032A4A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaiderOutpostTrackerScript
Quest __temp = self as Quest
DLC04:DLC04RaiderOutpostTrackerScript kmyQuest = __temp as DLC04:DLC04RaiderOutpostTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateOutpostCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Inform player of their success
DLC04WastelandWarlord02Message.Show()

;Update objectives
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Update objectives
CompleteAllObjectives()

;Throw message
DLC04WastelandWarlord03Message.Show()

;Throw achievement
Game.AddAchievement(78)

;Shut it down
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLC04WastelandWarlord03Message Auto Const Mandatory

Message Property DLC04WastelandWarlord02Message Auto Const Mandatory
