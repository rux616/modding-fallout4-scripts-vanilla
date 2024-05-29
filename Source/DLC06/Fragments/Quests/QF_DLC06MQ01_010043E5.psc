;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06MQ01_010043E5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06MQ01Script
Quest __temp = self as Quest
DLC06:DLC06MQ01Script kmyQuest = __temp as DLC06:DLC06MQ01Script
;END AUTOCAST
;BEGIN CODE
DLC06MQ01RadioBeacon.SetStage(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
Alias_Vault88MapMarker.GetRef().Enable()
Alias_Vault88MapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
pDLC06MQ01_Intercom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
; Plays from a change location script on the quest
; Makes sure that it doesn't say the lines outside the Vault
pDLC06MQ01_Intercom.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
CompleteAllObjectives()
DLC06MQ02.SetStage(50)
; turn off radio beacon if player hasn't listened
DLC06MQ01RadioBeacon.SetStage(15)
; turn on regular beacon
DLC06WorkshopParent.SetStage(100)
; make raiders suspicious in case player is sneaking
Alias_Raiders.SetValue(Suspicious, 2)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Vault88MapMarker Auto Const Mandatory

Quest Property DLC06VaultWorkshopDoorHandler Auto Const Mandatory

ReferenceAlias Property Alias_Intercom Auto Const Mandatory

Quest Property DLC06MQ02 Auto Const Mandatory

Quest Property DLC06WorkshopParent Auto Const Mandatory

Quest Property DLC06MQ01RadioBeacon Auto Const Mandatory

Scene Property pDLC06MQ01_Intercom Auto Const Mandatory

RefCollectionAlias Property Alias_Raiders Auto Const Mandatory

ActorValue Property Suspicious Auto Const Mandatory
