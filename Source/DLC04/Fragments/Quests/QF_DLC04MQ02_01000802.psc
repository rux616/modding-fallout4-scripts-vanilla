;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ02_01000802 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;set stages to simulate completing MQ01
DLC04MQ01.SetStage(800)
DLC04MQ01.SetStage(1000)

Game.GetPlayer().MoveTo(DLC04MQ02StartMarkerRef)

SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Alias_Gage.GetReference().MoveTo(DLC04MQ02OverlookGageMarker)
Alias_Gage.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ02QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ02QuestScript kmyQuest = __temp as DLC04:DLC04MQ02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(110)
SetObjectiveDisplayed(120)
if kmyquest.TalkedToDisciples==True
SetStage(200)
endif
if kmyquest.TalkedToOperators==True
SetStage(300)
endif
if kmyquest.TalkedToPack==True
SetStage(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0192_Item_00
Function Fragment_Stage_0192_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0193_Item_00
Function Fragment_Stage_0193_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0194_Item_00
Function Fragment_Stage_0194_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0196_Item_00
Function Fragment_Stage_0196_Item_00()
;BEGIN CODE
;Companion Affinity for Nisha's intro.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
if GetStageDone(300) && GetStageDone (400)
SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
if GetStageDone(200) && GetStageDone (400)
SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
if GetStageDone(300) && GetStageDone (200)
SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Alias_Gage.GetActorRef().GetActorBase().SetEssential()
Alias_Gage.GetActorRef().SetAvailableToBeCompanion()
DLC04MQ03.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
DLC04RaiderKickout.SetStage(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ03 Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

ObjectReference Property DLC04MQ02StartMarkerRef Auto Const Mandatory

ObjectReference Property DLC04MQ02OverlookGageMarker Auto Const Mandatory

ReferenceAlias Property Alias_Gage Auto Const Mandatory

Quest Property DLC04RaiderKickout Auto Const Mandatory
