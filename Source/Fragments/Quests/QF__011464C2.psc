;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__011464C2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
kmyQuest.RegisterForWorkshopEvents()
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
SetObjectiveDisplayed(20)
setStage(20)
kmyQuest.InitializeObjective()
; reset shutdown timer
kmyQuest.SetTimeOutStatus(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; update to "defend" objective
; for now just go to stage 150
setStage(150)
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
; now quest should shutdown when everything unloads
kmyQuest.StopQuestWhenAliasesUnloaded = true
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
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned01Script
Quest __temp = self as Quest
MinRadiantOwned01Script kmyQuest = __temp as MinRadiantOwned01Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveCompleted(35)
kmyQuest.FinishQuest(false)
; give Preston objective if appropriate
setStage(450)
; mod happiness down
kmyQuest.ModifyWorkshopHappiness(-25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
kmyQuest.CheckResolveAttack()
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

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.trace(self + " stage 500")
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
