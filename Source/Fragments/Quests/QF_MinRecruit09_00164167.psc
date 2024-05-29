;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruit09_00164167 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
; randomize number of refugees
int i = 0
int refugeeCount = utility.RandomInt(2, 5)
debug.trace(self + " refugeeCount = " + refugeeCount)
while i < Alias_Refugees.GetCount()
	Actor theRefugee = Alias_Refugees.GetAt(i) as Actor
	if i < refugeeCount
		theRefugee.SetProtected(true)
		theRefugee.Enable()
	else
		theRefugee.KillSilent()
		theRefugee.Delete()
	endif
	i += 1
endWhile
; add spokesman to ref collection for convenience later
Alias_Refugees.AddRef(Alias_SettlementSpokesman.GetRef())
Alias_SettlementSpokesman.GetActorRef().SetProtected(true)
; chance for pet gorilla :)
if Utility.RandomInt(1, 100) > 90
	Alias_Refugees.AddRef(Alias_SettlementSpokesman.GetActorRef().PlaceAtMe(WorkshopGorilla))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE MinRecruit05Script
Quest __temp = self as Quest
MinRecruit05Script kmyQuest = __temp as MinRecruit05Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.Startup()
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
; if player-owned already, can time out
if kmyQuest.startsOwned
	kmyQuest.SetTimeOutStatus(true, true)
endif
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
; increment global counter
MinRecruit09Count.SetValue(MinRecruit09Count.GetValue() + 1)
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
; just fail the quest
SetStage(300)
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
endif
; manually clear this location as failsafe
Alias_HostileWorkshopLocation.GetLocation().SetCleared(true)
kmyQuest.ResetTimeout()
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
; special case - this is one that the player is allowed to turn down
SetObjectiveCompleted(10)
kmyQuest.FinishQuest(false)
; give Preston objective if appropriate
setStage(450)
; mod happiness down
kmyQuest.ModifyWorkshopHappiness(-25)
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
kmyQuest.FinishQuest(true)
; complete quest
setStage(450)
; clear any happiness modifiers
kmyQuest.SetWorkshopHappinessModifier(0)
; add refugees to the new workshop location
WorkshopScript newWorkshop = Alias_HostileWorkshop.GetRef() as WorkshopScript
int i = 0
while i < Alias_Refugees.GetCount()
	WorkshopNPCScript theRefugee = Alias_Refugees.GetAt(i) as WorkshopNPCScript 
	if theRefugee && theRefugee.IsDead() == false
		kmyQuest.WorkshopParent.AddActorToWorkshopPUBLIC(theRefugee, newWorkshop)
	endif
	i += 1
endWhile
; make sure new workshop is friendly to player
newWorkshop.SetOwnedByPlayer(true)
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
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_04
Function Fragment_Stage_0450_Item_04()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
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
; clean up refugees if player didn't help (so they aren't permanent)
if GetStageDone(400) == false
	int i = 0
	while i < Alias_Refugees.GetCount()
		WorkshopNPCScript theRefugee = Alias_Refugees.GetAt(i) as WorkshopNPCScript 
		if theRefugee
			theRefugee.Delete()
		endif
		i += 1
	endWhile
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
; special case - always complete even if "fail" (by refusing to help)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RaiderMapMarker Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_HostileWorkshop Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_Refugees Auto Const

GlobalVariable Property MinRecruit09Count Auto Const

ActorBase Property WorkshopGorilla Auto Const

LocationAlias Property Alias_HostileWorkshopLocation Auto Const Mandatory
