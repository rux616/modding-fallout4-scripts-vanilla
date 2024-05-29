;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRadiantOwned06ChangeLo_00161D1D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
; quest can now shutdown on timer
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

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
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
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
setStage(20)
; quest can now shutdown on timer
kmyQuest.SetTimeOutStatus(true, false)
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementRefuseHelp)
kmyQuest.AddNPCsTodisappointedFaction(Alias_WorkshopNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
setStage(20)
kmyQuest.SetTimeOutStatus(true, true)  ; reset time out counter
kmyQuest.InitializeObjective()
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
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
kmyQuest.ResetTimeout()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
; player refuses quest and it times out
setObjectiveCompleted(20)
setObjectiveCompleted(30)
kmyQuest.FinishQuest(false)
kmyQuest.AddNPCsToFailureFaction(Alias_WorkshopNPCs)
; give Preston objective if appropriate
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
; add happiness
kmyQuest.ModifyWorkshopHappiness(10)
setObjectiveCompleted(30)
kmyQuest.FinishQuest(true)
kmyQuest.AddNPCsToThankfulFaction(Alias_workshopNPCs)
; complete quest
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_03
Function Fragment_Stage_0450_Item_03()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwnedBuildResourceScript
Quest __temp = self as Quest
MinRadiantOwnedBuildResourceScript kmyQuest = __temp as MinRadiantOwnedBuildResourceScript
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

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const
