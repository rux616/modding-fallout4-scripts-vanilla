;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04TransitCenterQuest_0201EA23 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Restore power to the Monorail.
DLC04MQ00.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Swap the lighting state.
DLC04TransitCenterAuxPowerEnableMarker.EnableNoWait()
DLC04TransitCenterAuxPowerDisableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04TransitCenterAuxPowerEnableMarker Auto Const Mandatory

ObjectReference Property DLC04TransitCenterAuxPowerDisableMarker Auto Const Mandatory

Quest Property DLC04MQ00 Auto Const Mandatory
