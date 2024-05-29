;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_0100EB4C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; fill collection with condensers
Alias_FogCondensers.AddRef(Alias_FogCondenser01.GetRef())
Alias_FogCondensers.AddRef(Alias_FogCondenser02.GetRef())
Alias_FogCondensers.AddRef(Alias_FogCondenser03.GetRef())
int condenserCount = utility.randomInt(0, 3)
if condenserCount > 0
	ObjectReference condenser = Alias_FogCondenser04.GetRef()
	if condenser
		Alias_FogCondensers.AddRef(condenser)
	endif
endif
if condenserCount > 1
	ObjectReference condenser = Alias_FogCondenser05.GetRef()
	if condenser
		Alias_FogCondensers.AddRef(condenser)
	endif
endif
if condenserCount > 2
	ObjectReference condenser = Alias_FogCondenser06.GetRef()
	if condenser
		Alias_FogCondensers.AddRef(condenser)
	endif
endif

(Alias_FogCondensers as DLC03:FogCondenserCollectionAliasScript).BreakAllCondensers()

; initialize globals
DLC03WorkshopRadiantOwned01Count.SetValue(0)
UpdateCurrentInstanceGlobal(DLC03WorkshopRadiantOwned01Count)

DLC03WorkshopRadiantOwned01Total.SetValue(Alias_FogCondensers.GetCount())
UpdateCurrentInstanceGlobal(DLC03WorkshopRadiantOwned01Total)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
; quest can now shutdown on timer
kmyQuest.SetTimeOutStatus(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
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

;BEGIN FRAGMENT Fragment_Stage_0080_Item_01
Function Fragment_Stage_0080_Item_01()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TryToStartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)
setStage(20)
; reset shutdown timer
kmyQuest.SetTimeOutStatus(true, true)

kmyQuest.AddNPCsToHopefulFaction(Alias_SettlementNPCs)

; make NPC essential during attack
Alias_SettlementSpokesman.GetActorRef().SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)
kmyQuest.TryToStartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
;END AUTOCAST
;BEGIN CODE
; update to "defend" objective
if GetStageDone(20)
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
kmyQuest.TryToStartAttack()
; less spawns now that pylons are repaired
kmyQuest.iSpawnCount += 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
; now quest should shutdown when everything unloads
kmyQuest.StopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_01
Function Fragment_Stage_0130_Item_01()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
kmyQuest.StartSpawning(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if GetStageDone(300) == false
	setStage(20) ; failsafe
endif

if GetStageDone(300) == false
  SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
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
; make NPC essential during attack
Alias_SettlementSpokesman.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
;END AUTOCAST
;BEGIN CODE
; stop spawning
kmyquest.StartSpawning(false)
; put NPCs in grateful faction
if GetStageDone(300) == false
	kmyQuest.AddToGratefulFaction(theAlias =Alias_SettlementSpokesman, theCollection = Alias_SettlementNPCs, bAddToFaction = true, attackFactionValue = -1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopTimedAttackScript
Quest __temp = self as Quest
DLC03:WorkshopTimedAttackScript kmyQuest = __temp as DLC03:WorkshopTimedAttackScript
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
; repair all condensers to make sure we don't leave any unrepaired
(Alias_FogCondensers as DLC03:FogCondenserCollectionAliasScript).RepairAllCondensers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
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
kmyQuest.DLC03FinishQuest(false)
kmyQuest.AddNPCsToFailureFaction(Alias_SettlementNPCs)
; give next objective if appropriate
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(35)
kmyQuest.DLC03FinishQuest(true, GetStageDone(300) == false)
; complete quest
setStage(450)
; mod happiness up
kmyQuest.ModifyWorkshopHappiness(10)
kmyQuest.StopQuestWhenAliasesUnloaded = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Stop()
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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwnedDefendScript
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwnedDefendScript kmyQuest = __temp as DLC03:WorkshopRadiantOwnedDefendScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
; make NPC essential during attack
Alias_SettlementSpokesman.GetActorRef().SetEssential(false)
kmyQuest.EndQuest()

; repair all condensers, in case quest was never active
(Alias_FogCondensers as DLC03:FogCondenserCollectionAliasScript).RepairAllCondensers()

; clear grateful faction
((kmyQuest as Quest) as DLC03:WorkshopTimedAttackScript).AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)

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

RefCollectionAlias Property Alias_FogCondensers Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser01 Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser02 Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser03 Auto Const Mandatory

GlobalVariable Property DLC03WorkshopRadiantOwned01Count Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser04 Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser05 Auto Const Mandatory

ReferenceAlias Property Alias_FogCondenser06 Auto Const Mandatory

GlobalVariable Property DLC03WorkshopRadiantOwned01Total Auto Const Mandatory
