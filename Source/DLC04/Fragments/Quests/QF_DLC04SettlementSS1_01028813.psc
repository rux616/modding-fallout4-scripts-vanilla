;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04SettlementSS1_01028813 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;make the Pack raider play the beer chug animation

Alias_Raider1Pack.GetActorRef().PlayIdle(DLC04NPCBeerChug)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Raider1Pack Auto Const Mandatory

Idle Property DLC04NPCBeerChug Auto Const Mandatory
