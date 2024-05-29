;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruit08_00157577 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(20)
setStage(100)
; handle player already cleared the area
if GetStageDone(200)
	SetStage(400)
endif
; increment global counter
MinRecruit08Count.SetValue(MinRecruit08Count.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
SetStage(20)
setStage(100)
; handle player already cleared the area
if GetStageDone(200)
	SetStage(400)
endif
; increment global counter
MinRecruit08Count.SetValue(MinRecruit08Count.GetValue() + 1)
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
	SetObjectiveDisplayed(40)
endif
setStage(400)
kmyQuest.ResetTimeout()
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
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(40)
endif
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

GlobalVariable Property MinRecruit08Count Auto Const
