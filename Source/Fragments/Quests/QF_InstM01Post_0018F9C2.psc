;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM01Post_0018F9C2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set the first time the player leaves the Institute after completing InstM01
;Used to condition all of the post-quest hellos in the Institute and at Warwick Farm

;Disable Bill Sutton
Alias_Bill.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Bill Auto Const Mandatory
