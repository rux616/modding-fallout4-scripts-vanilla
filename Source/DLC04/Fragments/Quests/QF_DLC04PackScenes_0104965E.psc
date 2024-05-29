;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04PackScenes_0104965E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC04PackScenes_OpeningMason.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; Have Pack member evaluate package to get him moving.
Alias_PackMember.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DLC04_CustomItemQuest.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04PackScenes_OpeningMason Auto Const Mandatory

Quest Property DLC04_CustomItemQuest Auto Const Mandatory

ObjectReference Property DLC04MasonAudienceMarker Auto Const Mandatory

ReferenceAlias Property Alias_PackMember Auto Const Mandatory
