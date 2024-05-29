;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN151_000482CD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
;For Minutemen Recruitment Quest
;debug.trace(self + " starting")
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
;For Minutemen Recruitment Quest
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
; increment "low level" counter - used in story manager to condition out priority branches
MinRecruitLowLevelCount.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;For Minutemen Recruitment Quest
;For now, just the same as if Preston gave it
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;For Minutemen Recruitment Quest
SetObjectiveDisplayed(5)
SetStage(20)
Alias_SettlementMapMarker.GetRef().AddToMap()
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
;For Minutemen Recruitment Quest
; -Quest is active.
setStage(20)
; -Complete pointer objective.
if (!GetStageDone(200))
     SetObjectiveCompleted(5)
EndIf

;Determine which objective to display.
if (GetStageDone(80))
     ;Player has at least spoken to White.
     if (GetStageDone(130))
          SetObjectiveDisplayed(130)
     ElseIf (GetStageDone(120))
         SetObjectiveDisplayed(120)
     Else
          SetObjectiveDisplayed(100)
     EndIf
EndIf
followersScript.SendAffinityEvent(self, kmyQuest.MinutemenCentralQuest.CA__CustomEvent_MinSettlementHelp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Update objectives if the player is on the quest.
if (GetStageDone(100))
     ;Complete 'Investigate the Water Treatment Plant'
     SetObjectiveCompleted(100)
     ;Display 'Drain the flooded Water Treatment Plant'
     SetObjectiveDisplayed(120)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Set prior stages to make sure they don't inadvertently trigger.
SetStage(120)

;Remove the elevator navcut collision.
DN151_ElevatorInteriorNavcutCollision.Disable()
DN151_ElevatorExteriorNavcutCollision.Disable()

;Update objectives if the player is on the quest.
if (GetStageDone(100))
     ;Complete 'Drain the flooded Water Treatment Plant'
     SetObjectiveCompleted(120)
     ;Display 'Restart the Main Pump'
     SetObjectiveDisplayed(130)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set prior stages to make sure they don't inadvertently trigger.
SetStage(130)

;Set Weston cleared.
Alias_WestonWaterTreatmentLocation.GetLocation().SetCleared()

;Update objectives if the player is on the quest.
if (GetStageDone(100))
     ;Complete 'Restart the Main Pump'
     SetObjectiveCompleted(130)
     ;Display 'Return to Supervisor White'
     SetObjectiveDisplayed(200)
EndIf

;Set Stage 100, since the quest will never be offered now.
SetStage(100)
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
;Fail objectives related to Supervisor White and Weston.
SetObjectiveFailed(5)
SetObjectiveFailed(100)
SetObjectiveFailed(120)
SetObjectiveFailed(130)
SetObjectiveFailed(200)

;Report the failure to MinRecruitQuestScript
kmyQuest.FinishQuest(false)

;Give Preston objective if appropriate
setStage(450)

;Mod happiness down
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
;Complete objectives.
SetObjectiveCompleted(5)
SetObjectiveCompleted(200)

;Award farm discount for Graygarden.
Alias_SupervisorGreene.GetActorRef().AddToFaction(FarmDiscountFaction)

;For Minutemen Recruitment Quest
kmyQuest.FinishQuest(true)
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;For Minutemen Recruitment Quest
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_01
Function Fragment_Stage_0450_Item_01()
;BEGIN CODE
;For Minutemen Recruitment Quest
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_02
Function Fragment_Stage_0450_Item_02()
;BEGIN CODE
;Just end the quest.
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_03
Function Fragment_Stage_0450_Item_03()
;BEGIN CODE
;Just end the quest.
SetStage(500)
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
;When this quest ends, if the player restarted the plant, take this opportunity to spawn
;a Sentry Bot at Weston to make future visits more interesting.
if (GetStageDone(200))
     Actor WestonSentryBot = DN151_GatedSentryBotSpawnPoint.PlaceActorAtMe(LvlSentryBot_LevelGated, 2, WestonWaterTreatmentZone)
     WestonSentryBot.SetLinkedRef(DN151_GatedSentryBotPatrolMarker)
     WestonSentryBot.SetLinkedRef(DN151_WestonPackageLocationPrimitive, DMP_Combat_HoldPosition_128)
     WestonSentryBot.Disable()
EndIf

debug.trace(self + " stage 500")
SetObjectiveCompleted(450)
kmyQuest.EndQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property DN151_WaterImprovementPerk Auto Const

ObjectReference Property WaterPuzzle1Controller Auto Const

ObjectReference Property WaterPuzzle2Controller Auto Const

ObjectReference Property DN151_WestonExtWaterEnableHigh Auto Const

ObjectReference Property DN151_WestonExtWaterEnableLow Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_SupervisorGreene Auto Const

Faction Property FarmDiscountFaction Auto Const

ObjectReference Property DN151_ExitElevatorDoor01 Auto Const

ObjectReference Property DN151_ExitElevatorDoor02 Auto Const

LocationAlias Property Alias_WestonWaterTreatmentLocation Auto Const

ObjectReference Property DN151_ElevatorInteriorNavcutCollision Auto Const

ObjectReference Property DN151_ElevatorExteriorNavcutCollision Auto Const

ObjectReference Property DN151_GatedSentryBotSpawnPoint Auto Const Mandatory

ObjectReference Property DN151_GatedSentryBotPatrolMarker Auto Const Mandatory

ActorBase Property LvlSentryBot_LevelGated Auto Const Mandatory

EncounterZone Property WestonWaterTreatmentZone Auto Const Mandatory

ObjectReference Property DN151_WestonPackageLocationPrimitive Auto Const Mandatory

Keyword Property DMP_Combat_HoldPosition_128 Auto Const Mandatory

GlobalVariable Property MinRecruitLowLevelCount Auto Const Mandatory
