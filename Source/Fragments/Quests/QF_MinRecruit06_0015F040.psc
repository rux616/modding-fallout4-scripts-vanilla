;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruit06_0015F040 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE MinRecruit06Script
Quest __temp = self as Quest
MinRecruit06Script kmyQuest = __temp as MinRecruit06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForWorkshopEvents()
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

; increment "low level" counter - used in story manager to condition out priority branches
MinRecruitLowLevelCount.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(20)
Alias_RaiderMapMarker.GetRef().AddToMap()
; handle player already cleared the area
if GetStageDone(200)
	SetObjectiveDisplayed(30)
else
	SetObjectiveDisplayed(20)
endif

; handle player already set up a radio beacon
if GetStageDone(400)
                SetObjectiveCompleted(30)
	SetObjectiveDisplayed(40)
endif
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
SetStage(20)
Alias_RaiderMapMarker.GetRef().AddToMap()
; handle player already completed quest
if GetStageDone(200)
	setStage(400)
else
	SetObjectiveDisplayed(20)
endif
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
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
; turn off Preston intro if he didn't actually give it
kmyQuest.PrestonIntroOn = false
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
SetObjectiveFailed(10)
SetObjectiveFailed(20)
SetObjectiveFailed(30)
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
kmyQuest.FinishQuest(true)
if IsObjectiveDisplayed(30)
	; only give new objective if player was on 30
	SetObjectiveCompleted(30)
	SetObjectiveDisplayed(40)
endif

; complete quest
setStage(450)
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
if IsObjectiveDisplayed(30)
	; only give new objective if player was on 30
	SetObjectiveCompleted(30)
	SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_03
Function Fragment_Stage_0450_Item_03()
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
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RaiderMapMarker Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_HostileWorkshop Auto Const

GlobalVariable Property MinRecruitLowLevelCount Auto Const Mandatory

LocationAlias Property Alias_HostileWorkshopLocation Auto Const Mandatory
