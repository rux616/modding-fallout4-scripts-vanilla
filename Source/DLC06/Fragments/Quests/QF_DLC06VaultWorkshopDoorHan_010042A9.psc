;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06VaultWorkshopDoorHan_010042A9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC06MQ01.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
DLC06VaultWorkshopVaultDoorTriggerRef.ToggleGearDoor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC06:VaultDoorTriggerScript Property DLC06VaultWorkshopVaultDoorTriggerRef Auto Const Mandatory

Quest Property DLC06MQ01 Auto Const Mandatory
