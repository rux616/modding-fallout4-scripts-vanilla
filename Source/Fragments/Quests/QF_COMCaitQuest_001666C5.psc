;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COMCaitQuest_001666C5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(COMCaitQuestStart)
utility.wait(2)
Alias_Cait.GetActorRef().MoveTo(Game.GetPlayer())
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Vault95Zone.Reset()
Vault95MapMarkerRef.AddToMap()
SetObjectiveDisplayed(5,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
COMCaitQuest_00_Vault95.Start()
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
COMCaitQuest_04_OverseerComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
COMCaitQuest_05_DrugStashComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
COMCaitQuest_06_MassGraveComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Cait.GetActorRef().DisallowCompanion(true)
COMCaitQuest_01_DrugChairScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Alias_Cait.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
COMCaitQuest_07_CaitSitsInChairScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Cait.GetActorRef().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Cait.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Cait_EventCondition_DislikesPlayerTakingChems.SetValue(1)
Cait_EventCondition_LikesPlayerTakingChems.SetValue(0)
COMCaitQuestAfterChairMarker.Disable()
Alias_Cait.GetActorRef().AllowCompanion()
Cait_AffinityCondition_PlayerCompletedQuest.SetValue(1)
SetObjectiveCompleted(50,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Companion hit Hatred or Essential was removed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property COMCaitQuest_01_DrugChairScene Auto Const
Scene Property COMCaitQuest_04_OverseerComment Auto Const
Scene Property COMCaitQuest_05_DrugStashComment Auto Const
Scene Property COMCaitQuest_06_MassGraveComment Auto Const

Scene Property COMCaitQuest_00_Vault95 Auto Const

ReferenceAlias Property Alias_Cait Auto Const

EncounterZone Property Vault95Zone Auto Const

GlobalVariable Property Cait_EventCondition_LikesPlayerTakingChems Auto Const

GlobalVariable Property Cait_EventCondition_DislikesPlayerTakingChems Auto Const

Scene Property COMCaitQuest_07_CaitSitsInChairScene Auto Const

ObjectReference Property Vault95MapMarkerRef Auto Const

ObjectReference Property COMCaitQuestAfterChairMarker Auto Const

ObjectReference Property COMCaitQuestStart Auto Const

Idle Property IdleExtractionChair Auto Const

GlobalVariable Property Cait_AffinityCondition_PlayerCompletedQuest Auto Const
