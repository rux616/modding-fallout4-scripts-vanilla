;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_0100EB51 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; mod happiness down
kmyQuest.ModifyWorkshopHappiness(-15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
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

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
setStage(20)

followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementRefuseHelp)

kmyQuest.AddNPCsToDisappointedFaction(Alias_WorkshopNPCs)

; NPC goes alone
Alias_SettlementSpokesman.GetActorRef().SetProtected(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
setStage(20)
;kmyQuest.SetTimeOutStatus(true, true)  ; reset time out counter
Alias_DungeonMapMarker.GetRef().AddToMap()

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
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
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

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
DLC03WorkshopRadiantOwned02EnterDungeonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
kmyQuest.ResetTimeout()

; NPC went alone
if GetStageDone(90)
  Alias_SettlementSpokesman.GetActorRef().SetProtected(true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
; player refuses quest and it times out
setObjectiveCompleted(20)
setObjectiveCompleted(30)
kmyQuest.DLC03FinishQuest(false)
; give Preston objective if appropriate
setStage(450)

kmyQuest.AddNPCsToFailureFaction(Alias_WorkshopNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
; remove unhappiness
kmyQuest.UndoAppliedHappinessModifier()
setObjectiveCompleted(30)
kmyQuest.DLC03FinishQuest(true)
; complete quest
setStage(450)
kmyQuest.AddNPCsToThankfulFaction(Alias_WorkshopNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_02
Function Fragment_Stage_0450_Item_02()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
if GetStageDone(110)
	Actor spokesman = Alias_SettlementSpokesman.GetActorRef()
	spokesman.SetEssential(false)
	spokesman.SetPlayerTeammate(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned02Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned02Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned02Script
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

GenericGoHomeScript Property GenericGoHome Auto Const Mandatory

Scene Property DLC03WorkshopRadiantOwned02EnterDungeonScene Auto Const Mandatory
