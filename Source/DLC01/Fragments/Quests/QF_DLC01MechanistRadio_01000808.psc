;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MechanistRadio_01000808 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DLC01MechanistRadioMainScene.Stop()
DLC01MechanistRadioSecondScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC01MechanistRadioSecondScene.Stop()
DLC01MechanistRadioThirdScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DLC01MechanistRadioThirdScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC01MechanistRadioMainScene Auto Const Mandatory

Scene Property DLC01MechanistRadioSecondScene Auto Const Mandatory

Scene Property DLC01MechanistRadioThirdScene Auto Const Mandatory
