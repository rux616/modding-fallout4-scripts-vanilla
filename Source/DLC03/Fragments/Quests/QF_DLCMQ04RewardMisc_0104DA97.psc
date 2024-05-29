;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLCMQ04RewardMisc_0104DA97 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Shipment.GetRef().Enable()
Alias_Shipment02.GetRef().Enable()
Alias_Shipment03.GetRef().Enable()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;complete the quest if the player has also activated the other shipments
If GetStageDone(30) && GetStageDone(40)
  SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;complete the quest if the player has also activated the other shipments
If GetStageDone(20) && GetStageDone(40)
  SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;complete the quest if the player has also activated the other shipments
If GetStageDone(30) && GetStageDone(20)
  SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Shipment Auto Const Mandatory

ReferenceAlias Property Alias_Shipment02 Auto Const Mandatory

ReferenceAlias Property Alias_Shipment03 Auto Const Mandatory
