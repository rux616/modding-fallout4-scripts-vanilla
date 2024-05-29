;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_WorkshopRE02_0003E0C1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
; quest can timeout
kmyQuest.SetTimeOutStatus(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; for now, just the same as if Preston gave it
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
setStage(20)
Alias_SettlementMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
; reveal map marker
Alias_DungeonMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
kmyQuest.SetTimeOutStatus(true, true)
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_WorkshopSpokesman.GetActorRef() as WorkshopNPCScript
if workshopNPC
	workshopNPC.bNewSettler = false
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
if !IsObjectiveDisplayed(15)
	SetObjectiveDisplayed(15)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
; mod happiness down (permanently)
kmyQuest.ModifyWorkshopHappiness(-10)

followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementRefuseHelp)

kmyQuest.AddNPCsToDisappointedFaction(Alias_WorkshopNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(15)
Game.GetPlayer().RemoveItem(Game.GetCaps(), kmyQuest.MinRadiantOwned03Ransom.GetValueInt())
kmyQuest.AddNPCsToHopefulFaction(Alias_WorkshopNPCs)
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15, false)
setStage(20)
; show on map
setStage(70)
kmyQuest.AddNPCsToHopefulFaction(Alias_WorkshopNPCs)
; handle player already completed quest
if GetStageDone(200)
	setStage(400)
else
	SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
; free captive
kmyQuest.FreeCaptive()
; undo happiness modifier
kmyQuest.UndoAppliedHappinessModifier()
If IsObjectiveDisplayed(15)
	SetObjectiveCompleted(15, false)
endif
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
kmyQuest.ResetTimeout()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
SetStage(300)
; give Preston objective if appropriate
setStage(450)
; mod happiness down
kmyQuest.ModifyWorkshopHappiness(-25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.FinishQuest(false)
kmyQuest.AddNPCsToFailureFaction(Alias_WorkshopNPCs)
if IsObjectiveCompleted(10) == false
	SetObjectiveFailed(10)
endif
if IsObjectiveCompleted(15) == false
	SetObjectiveFailed(15)
endif
if IsObjectiveCompleted(20) == false
	SetObjectiveFailed(20)
endif
if IsObjectiveCompleted(30) == false
	SetObjectiveFailed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveCompleted(30)
kmyQuest.FinishQuest(true, (GetStageDone(90) == false))
; complete quest
setStage(450)
; clear any happiness modifiers
kmyQuest.SetWorkshopHappinessModifier(0)
kmyQuest.AddNPCsToThankfulFaction(Alias_WorkshopNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_05
Function Fragment_Stage_0450_Item_05()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRE02Script
Quest __temp = self as Quest
WorkshopRE02Script kmyQuest = __temp as WorkshopRE02Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stopped")
kmyQuest.EndQuest()
; failsafe - make sure captive is freed
kmyQuest.FreeCaptive()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_caravanActor Auto Const

ReferenceAlias Property Alias_CaptiveMarker Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

Faction Property CaptiveFaction Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_WorkshopSpokesman Auto Const

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const
