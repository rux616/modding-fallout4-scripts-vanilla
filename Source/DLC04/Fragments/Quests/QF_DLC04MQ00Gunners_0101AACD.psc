;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ00Gunners_0101AACD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Make sure Kaylor and the Gunners are in position for their scene.
Alias_Kaylor.GetActorRef().MoveTo(Alias_Kaylor.GetActorRef().GetLinkedRef(LinkCustom01))
Alias_Gunner01.GetActorRef().MoveTo(Alias_Gunner01.GetActorRef().GetLinkedRef(LinkCustom01))
Alias_Gunner02.GetActorRef().MoveTo(Alias_Gunner02.GetActorRef().GetLinkedRef(LinkCustom01))
Alias_Gunner03.GetActorRef().MoveTo(Alias_Gunner03.GetActorRef().GetLinkedRef(LinkCustom01))
Alias_Gunner04.GetActorRef().MoveTo(Alias_Gunner04.GetActorRef().GetLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Start Kaylor's scene.
DLC04MQ00_200_KaylorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the player hits Kaylor for the first time in combat, give her a Stealth Boy.
;Otherwise, she uses it too early in the fight, and it's wasted.
Alias_Kaylor.GetActorRef().AddItem(StealthBoy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04MQ00_200_KaylorScene Auto Const Mandatory

ObjectReference Property DLC04MQ00GunnersEnableMarker Auto Const Mandatory

Potion Property StealthBoy Auto Const Mandatory

ReferenceAlias Property Alias_Kaylor Auto Const Mandatory

ReferenceAlias Property Alias_Gunner01 Auto Const Mandatory

ReferenceAlias Property Alias_Gunner02 Auto Const Mandatory

ReferenceAlias Property Alias_Gunner03 Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

ReferenceAlias Property Alias_Gunner04 Auto Const Mandatory
