;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_01040A87 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned05Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; turn off trigger
RETriggerScript theTrigger = (Alias_Trigger.GetRef() as RETriggerScript)
theTrigger.QuestStarted(kmyQuest)
; tag trigger to monster so it can rearm it on death
(Alias_FogCrawler.GetActorRef() as DLC03:DLC03WorkshopRECreatureScript).myTrigger = theTrigger
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE DLC03:SignalStrengthMessageScript
Quest __temp = self as Quest
DLC03:SignalStrengthMessageScript kmyQuest = __temp as DLC03:SignalStrengthMessageScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartTransmitter(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned05Script
;END AUTOCAST
;BEGIN CODE
; handle player already completed quest
if GetStageDone(200)
	setStage(400)
else
	Alias_Transmitter.TryToEnable()
	SetObjectiveDisplayed(10)
	SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned05Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveCompleted(10) == false
  SetObjectiveDisplayed(10, false)
endif
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
DLC03WorkshopRadiantOwned05TransmitterScene.Stop()

; if Longfellow companion or nearby, set stage 220
actor longfellow = Alias_OldLongfellow.GetActorRef()
actor shipbreaker = Alias_FogCrawler.GetActorref()

if longfellow.IsInFaction(CurrentCompanionFaction) || longfellow.GetDistance(shipbreaker) < 3000
  setstage(220)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN AUTOCAST TYPE DLC03:SignalStrengthMessageScript
Quest __temp = self as Quest
DLC03:SignalStrengthMessageScript kmyQuest = __temp as DLC03:SignalStrengthMessageScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartTransmitter(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned05Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.DLC03FinishQuest(true, false)

; give harpoon gun as reward
DLC03_CustomItemQuest.SetStage(80)

; complete quest
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned05Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned05Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned05Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
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

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_RaiderBosses Auto Const

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_TRIGGER Auto Const Mandatory

ReferenceAlias Property Alias_Transmitter Auto Const Mandatory

Scene Property DLC03WorkshopRadiantOwned05TransmitterScene Auto Const Mandatory

ReferenceAlias Property Alias_FogCrawler Auto Const

ReferenceAlias Property Alias_OldLongfellow Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

Weapon Property DLC03_HarpoonGun Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory
