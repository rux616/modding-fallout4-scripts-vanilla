;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_01039953 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
; quest can now shutdown on timer
kmyQuest.SetTimeOutStatus(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
kmyQuest.SetTimeOutStatus(true, true)
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_SettlementSpokesman.GetActorRef() as WorkshopNPCScript
if workshopNPC
	workshopNPC.bNewSettler = false
endif
; start attack
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(30)
setStage(20)
setStage(120)
; reset shutdown timer
kmyQuest.SetTimeOutStatus(true, true)

kmyQuest.AddNPCsToHopefulFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
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
kmyQuest.TryToStartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
; now quest should shutdown when everything unloads
;kmyQuest.StopQuestWhenAliasesUnloaded = true
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
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

;kmyQuest.AddNPCsToThankfulFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; put NPCs in grateful faction
kmyQuest.AddToGratefulFaction(theAlias = Alias_SettlementSpokesman, theCollection = Alias_SettlementNPCs, bAddToFaction = true, attackFactionValue = 7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
if GetStageDone(20)
	; failsafe
	SetStage(150)
	if IsObjectiveCompleted(20) == false
		setObjectiveFailed(20)
	endif
	setObjectiveFailed(30)
	setObjectiveCompleted(35)
	; mod happiness down
	kmyQuest.ModifyWorkshopHappiness(-25)
endif
kmyQuest.FinishQuest(false)
kmyQuest.AddNPCsToFailureFaction(Alias_SettlementNPCs)
; give next objective if appropriate
setStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(35)
kmyQuest.DLC03FinishQuest(true, GetStageDone(300) == false, bReadyToStop = false) ; NOT ready to stop
; next objective
setStage(410)
; mod happiness up
kmyQuest.ModifyWorkshopHappiness(10)
kmyQuest.StopQuestWhenAliasesUnloaded = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_RaiderMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; handle player already completed quest
if GetStageDone(420)
	setStage(430)
else
	SetObjectiveDisplayed(40)
	SetStage(405)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Actor spokesman = Alias_SettlementSpokesman.GetActorRef()
spokesman.EvaluatePackage()
; make NPC essential
spokesman.SetEssential(true)
spokesman.SetPlayerTeammate(true, false, true)
; put in "go home" alias to make sure doesn't get stuck in kidnap location after quest shuts down
GenericGoHome.AddRef(spokesman)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0418_Item_00
Function Fragment_Stage_0418_Item_00()
;BEGIN CODE
DLC03WorkshopRadiantOwned03EnterDungeonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(40)
	; only give new objective if player was on 20
	SetObjectiveCompleted(40)
	SetObjectiveDisplayed(50)
endif
kmyQuest.ResetTimeout()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
if GetStageDone(415)
	; make NPC essential during dungeon
	Actor spokesman = Alias_SettlementSpokesman.GetActorRef()
	spokesman.SetEssential(false)
	spokesman.SetPlayerTeammate(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned03Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned03Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned03Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
kmyQuest.EndQuest()

; clear grateful faction
((kmyQuest as Quest) as WorkshopAttackScript).AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)


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

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

GenericGoHomeScript Property GenericGoHome Auto Const Mandatory

Scene Property DLC03WorkshopRadiantOwned03EnterDungeonScene Auto Const Mandatory
