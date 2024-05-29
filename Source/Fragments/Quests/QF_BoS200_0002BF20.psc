;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS200_0002BF20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoS100.SetStage(255)
BoS101.SetStage(320)
BoS101.SetStage(455)
BoS100Fight.SetStage(1)
Alias_BoS200Haylen.GetActorRef().MoveTo(BoS200HaylenReturnsSceneMarker)
Alias_BoS200Danse.GetActorRef().MoveTo(BoS01DanseStage155Dest)
Alias_BoS200Rhys.GetActorRef().MoveTo(BoS200RhysReturnsSceneMarker)
Alias_BoS200Haylen.GetActorRef().EvaluatePackage()
Alias_BoS200Rhys.GetActorRef().EvaluatePackage()
Alias_BoS200Danse.GetActorRef().EvaluatePackage()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
BoSMedicalSceneTrigger.Disable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS200JoinedBoSAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
BoSMedicalSceneTrigger.Disable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS200JoinedBoSAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_BoS200Danse.GetActorRef().MoveTo(BoS200DanseReturnsSceneMarker)
Alias_BoS200Danse.GetActorRef().EvaluatePackage()
Alias_BoS200Danse.GetActorRef().RemoveItem(Armor_Power_T60_Helm)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
BoS200_01_ReturnScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_BoS200Haylen.GetActorRef().EvaluatePackage()
Alias_BoS200Rhys.GetActorRef().EvaluatePackage()
Alias_BoS200Danse.GetActorRef().EvaluatePackage()
BoSJoined.SetValue(1)
BoSPrydwenDialogue.SetStage(10)
BoSKickOut.SetStage(10)
Game.AddAchievement(16)
BoSR01.SetStage(10)
BoSR02.SetStage(10)
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
if BoS201.GetStageDone(5) == 1
BoS201.SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;BoS200 completes when Rhys' quest, Haylen's quest, and BoSM01's report to Danse are done.
if (GetStageDone(210) && GetStageDone(220))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;BoS200 completes when Rhys' quest, Haylen's quest, and BoSM01's report to Danse are done.
if (GetStageDone(210) && GetStageDone(220))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS200Danse Auto Const

ReferenceAlias Property Alias_BoS200Rhys Auto Const

ReferenceAlias Property Alias_BoS200Haylen Auto Const

ObjectReference Property BoS200HaylenReturnsSceneMarker Auto Const

ObjectReference Property BoS200RhysReturnsSceneMarker Auto Const

ObjectReference Property BoS200DanseReturnsSceneMarker Auto Const

GlobalVariable Property BoSTraining Auto Const

Quest Property DN130 Auto Const

ObjectReference Property BoS01DanseStage155Dest Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoSPoliceStation Auto Const

GlobalVariable Property BoSJoined Auto Const

Quest Property BoSPrydwenDialogue Auto Const

Quest Property BoSKickOut Auto Const

Quest Property BoS201 Auto Const

BoSM01QuestScript Property BoSM01 Auto Const

Scene Property BoS200_01_ReturnScene Auto Const

Quest Property BoSR01 Auto Const

Quest Property BosR02 Auto Const

Armor Property Armor_Power_T60_Helm Auto Const

ObjectReference Property BoSMedicalSceneTrigger Auto Const

ActorValue Property COMQC_BoS200JoinedBoSAV Auto Const
