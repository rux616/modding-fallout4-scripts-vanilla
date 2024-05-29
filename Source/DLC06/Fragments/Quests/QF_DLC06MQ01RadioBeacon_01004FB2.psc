;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06MQ01RadioBeacon_01004FB2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_IntroRadioTransmitter.TryToEnable()
DLC06MQ01RadioBeaconScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
; shut down beacon if player never listened
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DLC06MQ01.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DLC06MQ01RadioBeaconScene.Stop()
Alias_IntroRadioTransmitter.TryToDisable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_IntroRadioTransmitter Auto Const Mandatory

Scene Property DLC06MQ01RadioBeaconScene Auto Const Mandatory

Quest Property DLC06MQ01 Auto Const Mandatory

Quest Property DLC06WorkshopParent Auto Const Mandatory
