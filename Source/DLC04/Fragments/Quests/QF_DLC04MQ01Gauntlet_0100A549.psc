;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ01Gauntlet_0100A549 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartColaCarsEntrance)

DLC04MQ01.SetStage(200)
DLC04MQ01.SetStage(205)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartLockerRoomEntrance)

SetStage(1000)
SetStage(1100)
SetStage(1130)
SetStage(1190)

DLC04MQ01.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartArenaEntrance)
Game.GetPlayer().AddItem(Alias_ThirstZapper.GetReference())
Game.GetPlayer().EquipItem(Alias_ThirstZapper.GetReference())

SetStage(1000)
SetStage(1100)
SetStage(1130)
SetStage(1210)
SetStage(1250)
DLC04MQ01.SetStage(600)
SetStage(1290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartOverbossBattle)
Game.GetPlayer().AddItem(Alias_ThirstZapper.GetReference())
Game.GetPlayer().EquipItem(Alias_ThirstZapper.GetReference())

SetStage(1000)
SetStage(1100)
SetStage(1130)
SetStage(1210)
SetStage(1250)
DLC04MQ01.SetStage(600)
SetStage(1400)
DLC04MQ01.SetStage(700)
SetStage(1500)

Alias_RaiderOverboss.GetActorRef().MoveTo(DLC04MQ01Gauntlet_OverbossFightStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartPostfight)
Game.GetPlayer().EquipItem(Alias_ThirstZapper.GetReference())

SetStage(1000)
SetStage(1100)
SetStage(1130)
SetStage(1210)
SetStage(1250)
DLC04MQ01.SetStage(600)
SetStage(1400)
DLC04MQ01.SetStage(700)
SetStage(1510)
SetStage(1520)
Alias_RaiderOverboss.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Force the Raider Overboss' combat style to Melee. (His Power Armor changes it at runtime.)
Alias_RaiderOverboss.GetActorRef().SetCombatStyle(DLC04RaiderOverboss_csMeleeFocus)

;Set up Gage.
Alias_Gage.GetActorRef().MoveTo(DLC04MQ01Gauntlet_GageStartMarker)
Alias_Gage.GetActorRef().EnableNoWait()
Alias_Gage.GetActorRef().EvaluatePackage()
Alias_Gage.GetActorRef().SetGhost(True)

;Set up the Overboss.
Alias_RaiderOverboss.GetActorRef().MoveTo(DLC04MQ01Gauntlet_OverbossStartMarker)
Alias_RaiderOverboss.GetActorRef().EnableNoWait()
Alias_RaiderOverboss.GetActorRef().EvaluatePackage()
Alias_RaiderOverboss.GetActorRef().SetGhost(True)

;Enable the warehouse bugs.
int i = 0
While (i < Alias_WarehouseBugs.GetCount())
     Alias_WarehouseBugs.GetAt(i).Enable()
     i = i + 1
EndWhile

;Initialize the quest script.
kMyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartTurretTrap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.EndTurretTrap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;Start the 'Picked the Lock' scene on MQ01.
DLC04MQ01.SetStage(204)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Let DLC04MQ01 know the player triggered the monkey trap.
DLC04MQ01.SetStage(208)

kMyQuest.StartMonkeyTrap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
int i = 0
While (i < Alias_MazeTrapRats.GetCount())
     Actor current = Alias_MazeTrapRats.GetAt(i) as Actor
     if (current != None)
          current.StartCombat(Game.GetPlayer())
     EndIf
     i = i + 1
EndWhile

if (!GetStageDone(411))
     DLC04MQ01.SetStage(211)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartGasTrap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.EndGasTrap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartPotshotRunners()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Disable Potshot Raiders to make absolutely sure they don't follow the player inside.
Utility.Wait(1)
int i = 0
While (i < Alias_RaiderPotshotRunners.GetCount())
     Alias_RaiderPotshotRunners.GetAt(i).DisableNoWait()
     i = i + 1
EndWhile

;Silently add 999 Water Ammo to the player so it will be on them when they take the Thirst Zapper.
Game.GetPlayer().AddItem(DLC04_Ammo_ThirstZapper_Water, 999, True)

;The Fire Alarm lights and sfx start on to make sure there's no delay after the load.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
;Crowd Manager:
; - Start up the Crowd Manager. Raiders begin trickling in to watch the fight.
DLC04_NUK001_CrowdManager.Start()
DLC04_NUK001_CrowdManager.TrickleInLimit = 15
DLC04_NUK001_CrowdManager.SetStage(100)

;DLC04MQ01: Start the Overboss/Gage overlook scene.
DLC04MQ01.SetStage(280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1119_Item_00
Function Fragment_Stage_1119_Item_00()
;BEGIN CODE
;Enable the Overboss/Player scene trigger.
DLC04MQ01Gauntlet_Overlook_OverbossPlayerSceneTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
;DLC04MQ01: Start the Overboss/Player scene.
DLC04MQ01.SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN CODE
;Turn off the Fire Alarm lights and sfx.
int i = 0
While (i < Alias_FireAlarms.GetCount())
     (Alias_FireAlarms.GetAt(i) as DLC04:DLC04FireAlarmLightScript).StopLights()
     (Alias_FireAlarms.GetAt(i) as DLC04:DLC04FireAlarmLightScript).StartOn = False
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
;Open the Overlook Door
DLC04_NUK001_OverlookDoor.SetOpenNoWait(True)
DLC04_NUK001_OverlookDoorCollision.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;DLC04MQ01: Start the Locker Room PA scene.
DLC04MQ01.SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
;Shut the Overlook door behind the player.
DLC04_NUK001_OverlookDoorCollision.EnableNoWait()
DLC04_NUK001_OverlookDoor.SetOpenNoWait(False)

;Shut the Arena Champion's Door.
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(False)

;Crowd Manager:
; - Warp in the remaining Raiders, so the gallery is full when the player comes out.
; - Go ahead and ghost the crowd now to prevent issues.
DLC04_NUK001_CrowdManager.SetStage(120)
DLC04_NUK001_CrowdManager.SetStage(180)

;Make sure Gage and the Overboss are in position for the beginning of the fight.
Alias_Gage.GetActorRef().MoveTo(DLC04MQ01Gauntlet_GageWatchFightMarker02)
Alias_RaiderOverboss.GetActorRef().MoveTo(DLC04MQ01Gauntlet_OverbossPreFightStartMarker)

;DLC04MQ01: Interrupt the PA Commentary with Gage's dialogue.
if (!GetStageDone(7) && !GetStageDone(8) && !GetStageDone(9))
     DLC04MQ01.SetStage(320)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
;Player takes the Thirst Zapper.

;DLC04MQ01: For now, just have Gage's next scene starts when the player takes the gun.
;Really, they should probably interact with the Intercom or something for this.
if (!GetStageDone(7) && !GetStageDone(8) && !GetStageDone(9))
     DLC04MQ01.SetStage(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1261_Item_00
Function Fragment_Stage_1261_Item_00()
;BEGIN CODE
;DLC04MQ01: When the player returns to the Locker Room after disabling the Generators, Gage reacts.
DLC04MQ01.SetStage(575)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Open the Approach Door.
DLC04_NUK001_ApproachDoor.SetOpenNoWait(True)

kMyQuest.SetRaiderOverbossResistanceMult(-0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
;Close the Approach Door.
DLC04_NUK001_ApproachDoorCollision.Enable()
DLC04_NUK001_ApproachDoor.SetOpenNoWait(False)

;DLC04MQ01: Begin the Overboss' Speech.
if (!GetStageDone(8) && !GetStageDone(9))
     DLC04MQ01.SetStage(610)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by DLC04MQ01 stage 700, when the Overboss has finished his Pre-Battle Speech.

;Initialize the fight.
kMyQuest.InitializeOverbossBattle()

;Remove Ghosting from the boss.
Alias_RaiderOverboss.GetActorRef().SetGhost(False)

;Open the arena door.
DLC04ColaCars_ChallengerDoor.SetOpenNoWait(True)

;Crowd Manager:
; - Start the fight audio.
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("HalfheartedApplause", False)
DLC04_NUK001_CrowdManager.SetStage(200)
DLC04_NUK001_CrowdManager.EnableCrowdReactions(Alias_RaiderOverboss.GetActorRef(), Game.GetPlayer(), DLC04MQ01Gauntlet, 1510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Shut the Challenger's Door behind the player, locking them into the arena.
DLC04ColaCars_ChallengerDoorCollision.EnableNoWait()
DLC04ColaCars_ChallengerDoor.SetOpenNoWait(False)

;Warp the player's follower into the arena, if possible, since they tend to get stuck outside otherwise.
Actor player = Game.GetPlayer()
Actor companion = Alias_Companion.GetActorRef()
if ((companion != None) && (!player.HasDetectionLoS(companion)) && (player.GetPositionX() < companion.GetPositionX()))
     ObjectReference[] warpPoints = DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker.GetLinkedRefChain()
     warpPoints.Insert(DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker, 0)
     bool hasWarpedCompanion = False
     int i = 0
     While (!hasWarpedCompanion && i < warpPoints.Length)
          if (!player.HasDetectionLoS(warpPoints[i]))
               companion.MoveTo(warpPoints[i])
               hasWarpedCompanion = True
          EndIf
          i = i + 1
     EndWhile
EndIf

;Expand the Overboss' DMP Combat Hold Position to the full arena.
;(He has to be held back initally, since his entire theme breaks down if he gets into the Challenger's Box)
Alias_RaiderOverboss.GetActorRef().SetLinkedRef(DLC04ColaCars_HoldPosition_Full, DMP_Combat_HoldPosition_128)

;Allow the Overboss to attack.
SetStage(1520)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1520_Item_00
Function Fragment_Stage_1520_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Set when the player enters the arena (1510),
;OR if they shoot the Overboss before entering (any weapon).

;Start the fight timer.
kMyQuest.StartOverbossBattle()

;Start the Music Override.
DLC04MUSzCombatArena.Add()

;Make the Overboss aggressive and push him into combat.
Actor boss = Alias_RaiderOverboss.GetActorRef()
boss.SetValue(Aggression, 1)
boss.StartCombat(Game.GetPlayer())
boss.EvaluatePackage()

;Trigger RedEye's scene on MQ01.
DLC04MQ01.SetStage(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Set when the Raider Overboss dies.

;Stop the battle timers.
kMyQuest.EndOverbossBattle()

;Stop the music override.
DLC04MUSzCombatArena.Remove()

;Crowd Manager:
; - Stop the fight audio.
DLC04_NUK001_CrowdManager.SetStage(300)
DLC04_NUK001_CrowdManager.EVPCrowd()

;DLC04MQ01: Start Porter Gage's Post-Fight Scene
DLC04MQ01.SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
;Set by DLC04MQ01 stage 810, when Gage has finished his Post-Fight Speech.

;Crowd Manager:
; - Raiders begin to file out.
; - The Crowd Manager handles its own cleanup and shuts down automatically when it can.
DLC04_NUK001_CrowdManager.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2020_Item_00
Function Fragment_Stage_2020_Item_00()
;BEGIN CODE
;Set by DLC04MQ01 stage 820, when Gage has finished his Post-Fight dialogue with the player.

;Remove Ghosting from Gage.
Alias_Gage.GetActorRef().SetGhost(False)

;Open all of the doors in the Cola-Cars Arena
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()

DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()

DLC04_NUK001_ApproachDoor.SetOpenNoWait(True)
DLC04_NUK001_ApproachDoorCollision.DisableNoWait()

DLC04_NUK001_OverlookDoor.SetOpenNoWait(True)
DLC04_NUK001_OverlookDoorCollision.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2499_Item_00
Function Fragment_Stage_2499_Item_00()
;BEGIN CODE
Alias_RaiderOverboss.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by DLC04MQ01 stage 820, once MQ01 is finished with the Arena.

;Make absolutely sure to shut off the fire alarms.
SetStage(1130)

;Flag the quest as completed.
CompleteQuest()

;Flag Nuka-Station, The Gauntlet, and Cola-Cars as cleared.
DLC04NukaStationLocation.SetCleared(True)
DLC04GauntletLocation.SetCleared(True)
DLC04ColaCarsLocation.SetCleared(True)

;Reactivate the Monorail and Transit Station elevator. This also re-enables fast-travel.
DLC04_MonorailNukaWorld.PowerUpMonorail()
DLC04_NukaStationElevator.MakeElevatorFunctional()

;Unlock the chained door in Nuka Station so dismissed Companions can make it back to the Monorail.
DLC04NukaStationStairwellDoorChain.Activate(Game.GetPlayer())

;Enable and unlock the fast-travel markers to and from the Commonwealth.
DLC04CommonwealthMapMarker.Enable()
DLC04CommonwealthMapMarker.AddToMap(True)
DLC04NukaWorldMapMarker.Enable()
DLC04NukaWorldMapMarker.AddToMap(True)

;Clean up the Turret Trap room door, which may be closed if the player didn't destroy all the turrets.
kMyQuest.CleanupTurretTrap()

;Disable the bugs in the Gauntlet warehouse.
int i = 0
While (i < Alias_WarehouseBugs.GetCount())
     Alias_WarehouseBugs.GetAt(i).Disable()
     i = i + 1
EndWhile

;Go through and disable the Potshot Raiders again, just to be safe.
i = 0
While (i < Alias_RaiderPotshotRunners.GetCount())
     Alias_RaiderPotshotRunners.GetAt(i).DisableNoWait()
     Alias_RaiderPotshotRunners.GetAt(i).Delete()
     i = i + 1
EndWhile

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Default2StateActivator Property DLC04ColaCars_ChallengerDoor Auto Const Mandatory

ObjectReference Property DLC04MQ01_OverbossFight_CompanionWarpMarker Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker Auto Const Mandatory

Keyword Property DMP_Combat_HoldPosition_128 Auto Const Mandatory

ObjectReference Property DLC04ColaCars_HoldPosition_Full Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ReferenceAlias Property Alias_RaiderOverboss Auto Const Mandatory

ObjectReference Property DLC04ColaCars_ChallengerDoorCollision Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

MusicType Property DLC04MUSzCombatArena Auto Const Mandatory

CombatStyle Property DLC04RaiderOverboss_csMeleeFocus Auto Const Mandatory

CombatStyle Property DLC04RaiderOverboss_csRangedFocus Auto Const Mandatory

Weapon Property DLC04_ThirstZapper Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartOverbossBattle Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartLockerRoomEntrance Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartColaCarsEntrance Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartArenaEntrance Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartPostfight Auto Const Mandatory

ReferenceAlias Property Alias_ThirstZapper Auto Const Mandatory

DLC04:DLC04_NUK001_CrowdManagerQuestScript Property DLC04_NUK001_CrowdManager Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ApproachDoor Auto Const Mandatory

ObjectReference Property DLC04_NUK001_ApproachDoorCollision Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_OverbossPreFightStartMarker Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ArenaChampionDoor Auto Const Mandatory

ObjectReference Property DLC04_NUK001_ArenaChampionDoorCollision Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ArenaChallengerDoor Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_OverlookDoor Auto Const Mandatory

ObjectReference Property DLC04_NUK001_OverlookDoorCollision Auto Const Mandatory

RefCollectionAlias Property Alias_FireAlarms Auto Const Mandatory

ReferenceAlias Property Alias_Gage Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_GageWatchFightMarker02 Auto Const Mandatory

ObjectReference Property DLC04_NUK001_ArenaChallengerDoorCollision Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_OverbossFightStartMarker Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_Overlook_OverbossPlayerSceneTrigger Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_OverbossStartMarker Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_GageStartMarker Auto Const Mandatory

DLC04:DLC04_MonorailScript Property DLC04_MonorailNukaWorld Auto Const Mandatory

Location Property DLC04ColaCarsLocation Auto Const Mandatory

RefCollectionAlias Property Alias_TurretTrapTurrets Auto Const Mandatory

RefCollectionAlias Property Alias_MonkeyTrapTurrets Auto Const Mandatory

elevatormasterscript Property DLC04_NukaStationElevator Auto Const Mandatory

RefCollectionAlias Property Alias_MazeTrapRats Auto Const Mandatory

Armor Property DLC04_Armor_Power_T51_Helm_RaiderOverboss Auto Const Mandatory

Quest Property DLC04MQ01Gauntlet Auto Const Mandatory

RefCollectionAlias Property Alias_RaiderPotshotRunners Auto Const Mandatory

Location Property DLC04NukaStationLocation Auto Const Mandatory

Location Property DLC04GauntletLocation Auto Const Mandatory

ObjectReference Property DLC04_GauntletGasTrapEnableMarker01 Auto Const Mandatory

ObjectReference Property DLC04_GauntletGasTrapEnableMarker02 Auto Const Mandatory

ObjectReference Property DLC04_GauntletGasTrapEnableMarker03 Auto Const Mandatory

ObjectReference Property DLC04_GauntletGasTrapEnableMarker04 Auto Const Mandatory

Ammo Property DLC04_Ammo_ThirstZapper_Water Auto Const Mandatory

ObjectReference Property DLC04CommonwealthMapMarker Auto Const Mandatory

ObjectReference Property DLC04NukaWorldMapMarker Auto Const Mandatory

MusicType Property MUSStinger Auto Const Mandatory

ObjectReference Property DLC04NukaStationStairwellDoorChain Auto Const Mandatory

RefCollectionAlias Property Alias_WarehouseBugs Auto Const Mandatory
