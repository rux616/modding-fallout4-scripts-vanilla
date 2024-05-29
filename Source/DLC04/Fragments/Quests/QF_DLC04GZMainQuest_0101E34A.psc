;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZMainQuest_0101E34A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player has found Battle Site 1.

if (!GetStageDone(21) && !GetStageDone(22))
     ;The journal starts in the Battle Site 1 corpse, so no need to move it.
     Alias_BattleSite_CorpseNamed.ForceRefTo(Alias_BattleSite1_Corpse.GetReference())
EndIf
if (GetStage() < 30)
     ;Display 'Investigate the Battle Site', pointing to the journal.
     SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Player has found Battle Site 2.

if (!GetStageDone(20) && !GetStageDone(22))
     ;Move the journal to the Battle Site 2 corpse.
     Alias_BattleSite2_Corpse.GetReference().AddItem(Alias_BattleSite_Journal.GetReference())
     Alias_BattleSite_CorpseNamed.ForceRefTo(Alias_BattleSite2_Corpse.GetReference())
EndIf
if (GetStage() < 30)
     ;Display 'Investigate the Battle Site', pointing to the journal.
     SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Player has found Battle Site 3.

if (!GetStageDone(20) && !GetStageDone(21))
     ;Move the journal to the Battle Site 2 corpse.
     Alias_BattleSite3_Corpse.GetReference().AddItem(Alias_BattleSite_Journal.GetReference())
     Alias_BattleSite_CorpseNamed.ForceRefTo(Alias_BattleSite3_Corpse.GetReference())
EndIf
if (GetStage() < 30)
     ;Display 'Investigate the Battle Site', pointing to the journal.
     SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set when the player picks up the Battle Site journal. (Alias script.)
;Update objectives; the player now needs to read it.
if (GetStage() < 40)
     SetObjectiveCompleted(20)
     SetObjectiveDisplayed(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set when the player reads the Battle Site journal.
;Update objectives; they now need to find Star Control.
if (GetStage() < 40)
     SetObjectiveCompleted(30)
     SetObjectiveDisplayed(35)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set when the player finds Star Control. (Trigger)
;Update objectives; they now need to check out the mainframe.
if (IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20))
     SetObjectiveDisplayed(20, False)
EndIf
if (IsObjectiveDisplayed(30) && !IsObjectiveCompleted(30))
     SetObjectiveDisplayed(30, False)
EndIf
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set when the player interacts with Star Control, when no Star Cores have been installed.
;Update objectives; the player needs to install one.
SetObjectiveCompleted(40)
if (DLC04GZTrackingQuest.PlayerHasCore())
     ;If they already have a core, skip to installing it.
     SetStage(60)
Else
     ;Otherwise, they need to find one first.
     SetObjectiveDisplayed(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set by DLC04GZTrackingQuest when [Stage=50] and the player picks up a Star Core.
;Update objectives; the player now needs to install it.
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Set by DLC04GZTrackingQuest when [Stage=60] and the player installs a Star Core.
;Update objectives; the player now needs to reboot the mainframe.
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set when the player interacts with Star Control, after a Star Core has been installed.
;Update objectives; the player now needs to finish repairs or clear the zone.
SetObjectiveCompleted(40)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
SetObjectiveDisplayed(81)

;Update the Star Core collection globals to get them ready for display.
kMyQuest.UpdateStarCoreGlobals()

;Set Stage 81 after a short delay. The player is in a terminal at this point, so use a timer so
;the wait doesn't cause it to stall out (since time is paused).
kMyQuest.StartTimer(4, kMyQuest.SetStage81ObjectiveStageAfterDelayTimerID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
;After a brief delay, display the objectives for the exterior.
SetStage(100)
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Display the objectives for this location.
;SetObjectiveDisplayed(101)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set a flag to enable the quest targets.
;kMyQuest.GalacticZoneExteriorQTsDisplayed = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
;Complete the objective to clear this location.
;SetObjectiveCompleted(101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Display the objectives for this location.
;SetObjectiveDisplayed(111)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set a flag to enable the quest targets.
;kMyQuest.NukaGalaxyQTsDisplayed = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
;Complete the objective to clear this location.
;SetObjectiveCompleted(111)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Display the objectives for this location.
;SetObjectiveDisplayed(121)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set a flag to enable the quest targets.
;kMyQuest.TheaterQTsDisplayed = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
;Complete the objective to clear this location.
;SetObjectiveCompleted(121)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Display the objectives for this location.
;SetObjectiveDisplayed(131)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set a flag to enable the quest targets.
;kMyQuest.VaultTecQTsDisplayed = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
;Complete the objective to clear this location.
;SetObjectiveCompleted(131)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Display the objectives for this location.
;SetObjectiveDisplayed(141)
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0141_Item_00
Function Fragment_Stage_0141_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set a flag to enable the quest targets.
;kMyQuest.BattlezoneQTsDisplayed = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0142_Item_00
Function Fragment_Stage_0142_Item_00()
;BEGIN CODE
;Complete the objective to clear this location.
;SetObjectiveCompleted(141)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Display the objectives for this location.
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when the player has installed [StarCoresClearTotal]; they now need to disable Defensive Mode
;to finish taking control of the zone. Update objectives.
if (IsObjectiveDisplayed(80))
     SetObjectiveCompleted(80)
     SetObjectiveDisplayed(81, False)
     SetObjectiveDisplayed(200)
     SetObjectiveDisplayed(201)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Set when the player has taken control of the mainframe in the zone.

;Is this the way the player cleared the zone? If so, update the log.
if (!GetStageDone(301))
     SetStage(211)
EndIf

;Take control of the zone.
kMyQuest.StarControl_TakeControlNoWait()

;Make sure the Emergency Protocol options are all turned off.
kMyQuest.DisableEmergencyProtocolOptions()

;Complete Objectives related to this path.
if (IsObjectiveDisplayed(80))
     SetObjectiveCompleted(80)
EndIf
if (IsObjectiveDisplayed(200))
     SetObjectiveCompleted(200)
EndIf

;The zone is now clear. Let Stage 1000 decide what to do next.
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
;Check to see if we can shut down yet. This quest only shuts down:
; - Once the player has repaired the mainframe, issued Take Control, and it's run. (Stage 212 set)
; - Once the flag raising is complete, or has been skipped. (Quest Complete)
;(This logic in Stages 212, 1000, 1500, and 1600, to handle the various cases.)
if (GetStageDone(212) && Self.IsCompleted())
     SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set when the player has killed all of the enemies in the zone.

;Is this the way the player cleared the zone? If so, update the log.
if (!GetStageDone(211))
     SetStage(301)
EndIf

;Cleanup Objectives related to this path.
if (IsObjectiveDisplayed(81))
     SetObjectiveCompleted(81)
EndIf
if (IsObjectiveDisplayed(201))
     SetObjectiveCompleted(201)
EndIf

;The zone is now clear. Let Stage 1000 decide what to do next.
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Cleanup any remaining objectives from the first part of this quest.
kMyQuest.CleanupObjectives()

;Flag the zone and its sub-locations as cleared.
DLC04GalacticZoneLocation.SetCleared(True)
DLC04GalacticZone_StarportNukaLocation.SetCleared(True)
DLC04GalacticZone_NukaGalaxyLocation.SetCleared(True)
DLC04GalacticZone_StarlightInterstellarTheaterLocation.SetCleared(True)
DLC04GalacticZone_VaultTecAmongTheStarsLocation.SetCleared(True)
DLC04GalacticZone_RobCoBattlezoneLocation.SetCleared(True)

;Disable the Battlezone arena trigger and clear the arena aliases.
;The arena fight won't occur after this point.
DLC04BattlezoneArenaStartTrigger.DisableNoWait()
DLC04GZBattlezone.SetStage(1000)

;Unlock all Galactic Zone robot mods at this point.
co_DLC04Bot_Hand_MrGutsy_Weap_Laser_Global.SetValue(1)
co_DLC04Bot_Hand_Protectron_Weap_Lasergun01_Global.SetValue(1)
co_DLC04Bot_Legs_Sentrybot_Global.SetValue(1)
co_DLC04Bot_Torso_MisterHandy_Armor_Global.SetValue(1)
co_DLC04Bot_Torso_Nira_Global.SetValue(1)
co_DLC04Bot_Torso_Nukatron_Global.SetValue(1)
;And let the player know they're unlocked, if appropriate.
GlobalVariable unlockGlobal = DLC04BotModQuest.DLC01AllowRobotModUnlocksGlobal
if ((unlockGlobal != None) && (unlockGlobal.GetValueInt() > 0))
     DLC04GZMainQuest_ModsUnlockedMessage.Show()
EndIf

;If MQ03 is running, and the player hasn't been kicked out, allow them to raise the flag.
if ((DLC04MQ03.IsRunning()) && (PDLC04PlayerKickedOut.GetValue() == 0))
     DLC04MQ03.SetStage(100)
     SetStage(1100)
Else
     ;Otherwise, MQ03 will handle it, or the player has been kicked out and it won't happen at all.
     ;Go ahead and complete the visible quest at this point.
     CompleteQuest()
EndIf

;Check to see if we can shut down yet. This quest only shuts down:
; - Once the player has repaired the mainframe, issued Take Control, and it's run. (Stage 212 set)
; - Once the flag raising is complete, or has been skipped. (Quest Complete)
;(This logic in Stages 212, 1000, 1500, and 1600, to handle the various cases.)
if (GetStageDone(212) && Self.IsCompleted())
     SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Display the objective to raise the flag.
SetObjectiveDisplayed(1000)

;Listen for the flag to be raised.
kmyQuest.ListenForFlagRaise()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Complete the objective to raise the flag, any other open objectives, and the quest.
SetObjectiveCompleted(1000)
CompleteAllObjectives()
CompleteQuest()

;Let MQ03 know that the flag has been raised.

;Check to see if we can shut down yet. This quest only shuts down:
; - Once the player has repaired the mainframe, issued Take Control, and it's run. (Stage 212 set)
; - Once the flag raising is complete, or has been skipped. (Quest Complete)
;(This logic in Stages 212, 1000, 1500, and 1600, to handle the various cases.)
if (GetStageDone(212) && Self.IsCompleted())
     SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;Fail the objective to raise the flag, complete any other open objectives, and complete the quest.
SetObjectiveFailed(1000)
CompleteAllObjectives()
CompleteQuest()

;Check to see if we can shut down yet. This quest only shuts down:
; - Once the player has repaired the mainframe, issued Take Control, and it's run. (Stage 212 set)
; - Once the flag raising is complete, or has been skipped. (Quest Complete)
;(This logic in Stages 212, 1000, 1500, and 1600, to handle the various cases.)
if (GetStageDone(212) && Self.IsCompleted())
     SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZMainQuestScript kmyQuest = __temp as DLC04:DLC04GZMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Display the Galactic Zone Misc Objective if there are still more Star Cores to be found.
if (DLC04GZ_StarCoresInstalled.GetValueInt() < DLC04GZ_StarCoresTotal.GetValueInt())
     DLC04GZMiscObjective.SetStage(10)
EndIf

;If power has been restored [Tracking 2000] and the Mainframe has been repaired [Main 210],
;reset the robots in Nuka-Galaxy so the player can see the full ride experience.
if (DLC04GZTrackingQuest.GetStageDone(2000) && Self.GetStageDone(210))
     SetStage(2010) 
EndIf

;Make sure the Emergency Protocol options are all turned off.
kMyQuest.DisableEmergencyProtocolOptions()

;Stop the Quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BattleSite1_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_BattleSite2_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_BattleSite_Journal Auto Const Mandatory

DLC04:DLC04GZTrackingQuestScript Property DLC04GZTrackingQuest Auto Const Mandatory

GlobalVariable Property DLC04GZ_StarCoresClearTotal Auto Const Mandatory

GlobalVariable Property DLC04GZ_StarCoresInstalled Auto Const Mandatory

GlobalVariable Property DLC04GZ_StarCoresTotal Auto Const Mandatory

DLC04:DLC04GZMiscObjectiveQuestScript Property DLC04GZMiscObjective Auto Const Mandatory

Quest Property DLC04MQ03 Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZoneExteriorEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_GalacticZoneEnemyQTs Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_StarportNukaEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_VaultTecAmongTheStarsEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_RobCoBattlezoneEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_StarlightInterstellarTheaterEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_NukaGalaxyEnemies Auto Const Mandatory

ReferenceAlias Property Alias_BattleSite3_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_BattleSite_CorpseNamed Auto Const Mandatory

ObjectReference Property DLC04BattlezoneArenaStartTrigger Auto Const Mandatory

Location Property DLC04GalacticZone_NukaGalaxyLocation Auto Const Mandatory

Quest Property DLC04GZNukaGalaxy Auto Const Mandatory

Cell Property DLC04GZNukaGalaxy01 Auto Const Mandatory

elevatormasterscript Property DLC04StarportNukaElevatorMaster Auto Const Mandatory

GlobalVariable Property PDLC04PlayerKickedOut Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_ExteriorCores Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_NukaGalaxyCores Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_StarlightInterstellarTheaterCores Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_VaultTecAmongTheStarsCores Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_RobCoBattlezoneStarCores Auto Const Mandatory

RefCollectionAlias Property Alias_DLC04GalacticZone_OutsideStarCores Auto Const Mandatory

Quest Property DLC04GZBattlezone Auto Const Mandatory

Message Property DLC04GZMainQuest_ModsUnlockedMessage Auto Const Mandatory

DLC04:DLC04BotModQuestScript Property DLC04BotModQuest Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Hand_MrGutsy_Weap_Laser_Global Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Hand_Protectron_Weap_Lasergun01_Global Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Legs_Sentrybot_Global Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Torso_MisterHandy_Armor_Global Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Torso_Nira_Global Auto Const Mandatory

GlobalVariable Property co_DLC04Bot_Torso_Nukatron_Global Auto Const Mandatory

Location Property DLC04GalacticZoneLocation Auto Const Mandatory

Location Property DLC04GalacticZone_StarportNukaLocation Auto Const Mandatory

Location Property DLC04GalacticZone_StarlightInterstellarTheaterLocation Auto Const Mandatory

Location Property DLC04GalacticZone_VaultTecAmongTheStarsLocation Auto Const Mandatory

Location Property DLC04GalacticZone_RobCoBattlezoneLocation Auto Const Mandatory
