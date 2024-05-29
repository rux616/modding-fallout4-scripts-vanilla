;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06WorkshopPhoropterHan_01005718 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_TargetObject.GetRef().SetActorRefOwner(Alias_TargetNPC.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DLC06OBJPhoropterRadBlast.Play(alias_targetObject.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_TargetObject.GetRef().SetActorRefOwner(Alias_OwnerNPC.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_targetObject Auto Const Mandatory

ReferenceAlias Property Alias_TargetNPC Auto Const Mandatory

ReferenceAlias Property Alias_OwnerNPC Auto Const Mandatory

Sound Property DLC06OBJPhoropterRadBlast Auto Const Mandatory
