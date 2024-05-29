;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN109_001D5BD8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Tell custom item quest to spawn Clint's gun into his inventory
CustomItemQuest.SetStage(270)

;Tell custom item quest to spawn Tessa's Power Armor fist into her inventory
CustomItemQuest.SetStage(310)

;Force equip Tessa's Fist
Alias_Tessa.GetActorRef().EquipItem(Armor_Power_Raider_ArmRight)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CustomItemQuest Auto Const Mandatory

ReferenceAlias Property Alias_Tessa Auto Const Mandatory

ReferenceAlias Property Alias_TessasFist Auto Const Mandatory

Armor Property Armor_Power_Raider_ArmRight Auto Const Mandatory
