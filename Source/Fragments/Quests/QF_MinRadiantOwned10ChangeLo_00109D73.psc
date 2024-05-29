;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRadiantOwned10ChangeLo_00109D73 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
if MinRadiantOwned10Intro.IsPlaying() == false
	MinRadiantOwned10Intro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
; quest can timeout
kmyQuest.SetTimeOutStatus(true, true)
; change location only
setstage(80)
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
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
kmyQuest.SetTimeOutStatus(true, true)
; clear new settler flag on spokesman
WorkshopNPCScript workshopNPC = Alias_WorkshopSpokesman.GetActorRef() as WorkshopNPCScript
if workshopNPC
	workshopNPC.bNewSettler = false
endif
; automatically accept quest in this case
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
setStage(20)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(20)
	; only give new objective if player was on 20
	SetObjectiveCompleted(20)
endif
setStage(400)

followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_SynthSuspectRelease)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
; make sure suspect dies if not attacked by player
Alias_SuspectedSynth.GetActorRef().KillEssential()
SetStage(400)
; give Preston objective if appropriate
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResolveDeath()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveCompleted(30)
; complete quest
setStage(450)
kmyQuest.Cleanup()
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
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.stopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MinRadiantOwned10Script
Quest __temp = self as Quest
MinRadiantOwned10Script kmyQuest = __temp as MinRadiantOwned10Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stopped")
; failsafe
if GetStageDone(250)
  setStage(270)
endif
kmyQuest.EndQuest()
kmyQuest.Cleanup()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_caravanActor Auto Const

ReferenceAlias Property Alias_CaptiveMarker Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

Faction Property CaptiveFaction Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

ReferenceAlias Property Alias_WorkshopSpokesman Auto Const

ReferenceAlias Property Alias_SuspectedSynth Auto Const

ReferenceAlias Property Alias_SettlementLeader Auto Const

Faction Property MinRadiantOwned10SpecialCombatFaction Auto Const

Scene Property MinRadiantOwned10Intro Auto Const
