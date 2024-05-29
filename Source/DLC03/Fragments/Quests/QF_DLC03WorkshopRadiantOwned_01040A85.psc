;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_01040A85 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
if DLC03WorkshopRadiantOwned05.IsRunning() == false
	DLC03WorkshopRadiantOwned05.Start()
endif
kmyQuest.SetupFogCrawler()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_SettlementSpokesman.GetActorRef() as WorkshopNPCScript
if workshopNPC
	workshopNPC.bNewSettler = false
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
setStage(20)
; if Longfellow is with you, set stage 50

; give main quest objective
DLC03WorkshopRadiantOwned05.SetStage(100)

; handle player already completed quest
if GetStageDone(200)
	setStage(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetTimeout()
; just complete quest - no further objectives
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(200) == false
	Actor fogCrawler = Alias_FogCrawler.GetActorRef()
	fogCrawler.Disable()
	((DLC03WorkshopRadiantOwned05 as Quest) as DLC03:SignalStrengthMessageScript).StartTransmitter(false)
	kmyQuest.DLC03FinishQuest(false, bGiveReward = false)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DLC03FinishQuest(true, bGiveReward = false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05StarterScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05StarterScript kmyQuest = __temp as DLC03:WorkshopRadiantOwned05StarterScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
kmyQuest.EndQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_TRIGGER Auto Const Mandatory

Quest Property DLC03WorkshopRadiantOwned05 Auto Const Mandatory

ReferenceAlias Property Alias_Transmitter Auto Const Mandatory

ReferenceAlias Property Alias_FogCrawler Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory
