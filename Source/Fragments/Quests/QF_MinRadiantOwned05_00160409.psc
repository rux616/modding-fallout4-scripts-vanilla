;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRadiantOwned05_00160409 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()

; damage settlement to simulate previous super mutant attack
kmyQuest.WorkshopParent.ResolveAttack(Alias_SettlementWorkshop.GetRef() as WorkshopScript, 6, SuperMutantFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
; quest can now shutdown on timer
kmyQuest.SetTimeOutStatus(true, true)
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
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

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
kmyQuest.SetTimeOutStatus(true, true)
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_SettlementSpokesman.GetActorRef() as WorkshopNPCScript
if workshopNPC
	workshopNPC.bNewSettler = false
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
setstage(20) ; quest now counts as "active"
; mod happiness down (permanently)
kmyQuest.ModifyWorkshopHappiness(-10)

followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementRefuseHelp)

kmyQuest.AddNPCsToDisappointedFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
kmyQuest.InitializeObjective()
kmyQuest.RegisterForWorkshopEvents()
SetObjectiveDisplayed(20)
setStage(20)
; reset shutdown timer
kmyQuest.SetTimeOutStatus(true, true)
kmyQuest.AddNPCsToHopefulFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
; turn off Preston intro if he didn't actually give it
kmyQuest.PrestonIntroOn = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; update to "defend" objective
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
if GetStageDone(300) == false
	SetObjectiveDisplayed(30)
endif
kmyQuest.TryToStartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
; now quest should shutdown when everything unloads = quest fail
kmyQuest.StopQuestWhenAliasesUnloaded = true
kmyQuest.RegisterForWorkshopEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_01
Function Fragment_Stage_0130_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if GetStageDone(300) == false
	setStage(20) ; failsafe
endif
setStage(120) ; no more building defenses
SetObjectiveCompleted(20)
if GetStageDone(300) == false
  SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
if GetStageDone(300) == false
	setStage(20) ; failsafe
endif
setStage(150) ; failsafe
SetObjectiveCompleted(30)
if GetStageDone(300) == false
  SetObjectiveDisplayed(35)
endif
; quest should NOT shutdown when everything unloads
; (DailyUpdate on MinRecruitQuestScript will shut it down appropriately now)
kmyQuest.StopQuestWhenAliasesUnloaded = false
kmyQuest.AddNPCsToThankfulFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; if not active, turn off Preston intro flag
if GetStageDone(20) == false
	((kmyQuest as Quest) as MinRecruitQuestScript).PrestonIntroOn = false
endif

; check to see if attack needs to be resolved by script
if GetStageDone(290) == false && kmyQuest.CheckResolveAttack() == false
	; defenders win
	setStage(200)
	; don't send player back to settlement if resolved off-screen
	setStage(400)
else
	setStage(310)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
if GetStageDone(20)
	if IsObjectiveCompleted(10) == false
		setObjectiveCompleted(10)
	endif
	if IsObjectiveCompleted(20) == false
		setObjectiveFailed(20)
	endif
	setObjectiveFailed(30)
	setObjectiveCompleted(35)
	; mod happiness down
	kmyQuest.ModifyWorkshopHappiness(-25)
endif
kmyQuest.AddNPCsToFailureFaction(Alias_SettlementNPCs)
kmyQuest.FinishQuest(false)
; give Preston objective if appropriate
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(35)
kmyQuest.FinishQuest(true)
; complete quest
setStage(450)
; mod happiness up
kmyQuest.ModifyWorkshopHappiness(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_01
Function Fragment_Stage_0450_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_02
Function Fragment_Stage_0450_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_05
Function Fragment_Stage_0450_Item_05()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
if IsObjectiveDisplayed(40)
	SetObjectiveCompleted(40)
endif
kmyQuest.EndQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RaiderMapMarker Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

RefCollectionAlias Property Alias_Raiders Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Faction Property SuperMutantFaction Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const
