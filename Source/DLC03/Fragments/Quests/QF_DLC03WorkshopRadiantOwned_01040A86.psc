;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopRadiantOwned_01040A86 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; set up attackers collection
kmyQuest.SetCrabAttackers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
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
;BEGIN CODE
setstage(300) ; complete quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
setStage(20)

; increment global
kmyquest.ModObjectiveGlobal(1, DLC03WorkshopRadiantOwned04Count)

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

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetTimeout()
if IsObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
	DLC03WorkshopRadiantOwned04Outro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DLC03FinishQuest(false)
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.DLC03FinishQuest(true, false)
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_02
Function Fragment_Stage_0450_Item_02()
;BEGIN AUTOCAST TYPE DLC03:WorkshopRadiantOwned04Script
Quest __temp = self as Quest
DLC03:WorkshopRadiantOwned04Script kmyQuest = __temp as DLC03:WorkshopRadiantOwned04Script
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

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_HermitCrab Auto Const Mandatory

GlobalVariable Property DLC03WorkshopRadiantOwned04Count Auto Const Mandatory

Scene Property DLC03WorkshopRadiantOwned04Outro Auto Const Mandatory
