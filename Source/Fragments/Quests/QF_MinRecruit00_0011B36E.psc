;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruit00_0011B36E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; for this quest, Preston intro is always on
kmyQuest.PrestonIntroOn = true
; if the settlement workshop is already player owned, or no settlement found, advance quest
WorkshopScript workshopRef = Alias_SettlementWorkshop.GetRef() as WorkshopScript
if workshopRef == NONE || workshopRef.OwnedByPlayer
	setStage(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
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
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
if kmyQuest.startsOwned
	; if owned, can time out
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

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
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

kmyQuest.AddNPCsToDisappointedFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
setStage(20)
Alias_RaiderMapMarker.GetRef().AddToMap()
kmyQuest.AddNPCsToHopefulFaction(Alias_SettlementNPCs)
; handle player already completed quest
if GetStageDone(200)
	setStage(400)
else
	SetObjectiveDisplayed(20)
endif
; if player-owned, can time out
if kmyQuest.startsOwned
	kmyQuest.SetTimeOutStatus(true, true)
endif
; show boss QTs if 3 or less
if Alias_RaiderBosses.GetCount() <= 3
  setStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(10)
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

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(30)
kmyQuest.FinishQuest(true, GetStageDone(350) == false ) ; don't give reward if skipping this quest
; complete quest
setStage(450)
if GetStageDone(350) == false
	; clear any happiness modifiers
	kmyQuest.SetWorkshopHappinessModifier(0)
	kmyQuest.AddNPCsToThankfulFaction(Alias_SettlementNPCs)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_01
Function Fragment_Stage_0450_Item_01()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
Min01.SetStage(225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
SetObjectiveCompleted(40)
kmyQuest.EndQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RaiderMapMarker Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

Weapon Property FlareGun Auto Const

Ammo Property AmmoFlareGun Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_RaiderBosses Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Quest Property Min01 Auto Const
