;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruit02_00099848 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
; only times out if player owned
if kmyQuest.startsOwned
	kmyQuest.SetTimeOutStatus(true, true)
endif

; increment "low level" counter - used in story manager to condition out priority branches
MinRecruitLowLevelCount.Mod(1)
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
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
if kmyQuest.startsOwned
	kmyQuest.SetTimeOutStatus(true, true)
endif
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_SettlementSpokesman.GetActorRef() as WorkshopNPCScript
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
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
; only has negative impact if this is a player-owned settlement
if kmyQuest.startsOwned
	setstage(20) ; quest now counts as "active"
	; mod happiness down (permanently)
	kmyQuest.ModifyWorkshopHappiness(-10)
endif
; quest can now time out
kmyQuest.SetTimeOutStatus(true, false)

followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementRefuseHelp)

kmyQuest.AddNPCsToDisappointedFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveCompleted(10)
setStage(20)
Game.GetPlayer().RemoveItem(Game.GetCaps(), kmyQuest.MinRecruit02Ransom.GetValueInt())
setStage(200)
setStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15, false)
setStage(20)
; reset shutdown timer
kmyQuest.SetTimeOutStatus(true, true)
; show on map
setStage(70)
kmyQuest.AddNPCsToHopefulFaction(Alias_SettlementNPCs)
; handle player already completed quest
if GetStageDone(200)
	setStage(400)
else
	SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_03
Function Fragment_Stage_0100_Item_03()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_04
Function Fragment_Stage_0100_Item_04()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
; turn off Preston intro if he didn't actually give it
kmyQuest.PrestonIntroOn = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
; free captive
kmyQuest.FreeCaptive()
; success
setStage(200)
if IsObjectiveDisplayed(15)
	SetObjectiveCompleted(15, false)
endif
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetTimeout()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(10)
	SetObjectiveFailed(10)
endif
if IsObjectiveDisplayed(15)
	SetObjectiveFailed(15)
endif
SetObjectiveFailed(20)
SetObjectiveFailed(30)
kmyQuest.FinishQuest(false)
; give Preston objective if appropriate
setStage(450)
; mod happiness down
kmyQuest.ModifyWorkshopHappiness(-25)
kmyQuest.AddNPCsToFailureFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveCompleted(30)
kmyQuest.FinishQuest(true, (GetStageDone(90) == false))
; complete quest
setStage(450)
if kmyQuest.startsOwned
	; mod happiness up
	kmyQuest.ModifyWorkshopHappiness(10)
else
	; clear any happiness modifiers
	kmyQuest.SetWorkshopHappinessModifier(0)
endif
kmyQuest.AddNPCsToThankfulFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_01
Function Fragment_Stage_0450_Item_01()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_04
Function Fragment_Stage_0450_Item_04()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MinRecruit02Script
Quest __temp = self as Quest
MinRecruit02Script kmyQuest = __temp as MinRecruit02Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
SetObjectiveCompleted(40)
kmyQuest.EndQuest()
; failsafe - make sure captive is freed
kmyquest.FreeCaptive()
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

ReferenceAlias Property Alias_KidnappedActor Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

GlobalVariable Property MinRecruitLowLevelCount Auto Const Mandatory
