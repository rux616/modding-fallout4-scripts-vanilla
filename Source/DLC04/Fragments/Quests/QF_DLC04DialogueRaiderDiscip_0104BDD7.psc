;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DialogueRaiderDiscip_0104BDD7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Plays Disciple intro scene. Moves NPCs if needed.
; Triggered off DLC04IntroSceneRef in cell DLC04HubFizzTopMountainInterior01

Alias_Nisha.GetActorRef().MoveTo(DLC04NishaIntroMarkerRef)
Alias_Dixie.GetActorRef().MoveTo(DLC04DixieIntroMarkerRef)
Alias_Savoy.GetActorRef().SnapIntoInteraction(DLC04SavoyIntroMarkerRef)

DLC04DialogueRaiderDiscipleScenes_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DLC04_CustomItemQuest.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04DialogueRaiderDiscipleScenes_Intro Auto Const Mandatory

ObjectReference Property DLC04NishaIntroMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_Nisha Auto Const Mandatory

ObjectReference Property DLC04DixieIntroMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_Dixie Auto Const Mandatory

ObjectReference Property DLC04SavoyIntroMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_Savoy Auto Const Mandatory

Quest Property DLC04_CustomItemQuest Auto Const Mandatory
