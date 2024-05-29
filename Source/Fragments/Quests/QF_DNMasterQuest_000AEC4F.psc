;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DNMasterQuest_000AEC4F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Create fixed-level custom items that are safe to spawn on game start.
CustomItemQuest.SetStage(140) ;Grognak's Axe
CustomItemQuest.SetStage(150) ;Grognak Costume

;Starts the endless timer loop for the Radio Scene Failsafe
((self as quest) as RadioFailsafeScript).StartAllScenes()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pulowski_Shelter Auto Const

Quest Property CustomItemQuest Auto Const Mandatory
