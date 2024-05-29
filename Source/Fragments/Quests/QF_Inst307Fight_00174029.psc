;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst307Fight_00174029 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)
Utility.Wait(2)

;Warp to the relay point.
Game.GetPlayer().MoveTo(Inst307PlayerAirportMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Stage 10 should be set automatically on startup, but make sure it finishes first.
SetStage(10)

;Adjust factions to match the questline.
Game.GetPlayer().AddToFaction(InstituteFaction)
Game.GetPlayer().RemoveFromFaction(BrotherhoodOfSteelFaction)
InstituteFaction.SetEnemy(BrotherhoodOfSteelFaction)
BoSKickout.SetStage(20)

;Set prior stages on Inst307
Inst307.SetStage(10)
Inst307.SetStage(15)
Inst307.SetStage(30)
Inst307.SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

;Warp to the terminal entrance.
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartTerminalEntrance)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

;Warp to the first jammer (Helipad).
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartJammer1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

;Warp to the second jammer (Tower)
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartJammer2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

;Warp to the third jammer (Fortification)
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartJammer3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(200)

;Phase 2 Started
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartPhase2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Standard setup.
SetStage(1)

SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(200)
SetStage(250)

;Phase 2 running, ready for Phase 3
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartPhase3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Standard setup.
SetStage(1)

;Warp to the front entrance
Game.GetPlayer().MoveTo(Inst307Fight_QuickstartFrontEntrance)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;---Set up the Airport---
;Enable the BoS, Prydwen, and Prime. This should have happened during normal progression,
;but setting them here for debug reliability.
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)

;Update Enable State Markers
BoSAirportGuards.Disable()
BoSAirportSupplyDepotSoldiers.Disable()
BoSDScribeEnablerRef.Disable()
BoSAirport_PostKickoutDefenses_Disable.Disable()
BoSAirport_PostKickoutDefenses_Enable.Enable()
BoSAirport_PostKickoutDefenses_EnableTemp.Enable()
BoSAirport_BaseSpotlights.Disable()
BoSAirport_RadarDish.Disable()
BoSAirport_TeleportJammersState01Enable.Disable()
BoSAirport_TeleportJammersState02Enable.Disable()
BoSAirport_ExteriorDoorsMain.Disable()
BoSAirportScene.Disable()
BoSAirportSceneTrigger.Disable()
Waterfront_LongWharfSupermutants.Disable()
Inst307Fight_Phase1_Enable.Enable()
Inst307Fight_Phase1_Disable.Disable()
Inst307Fight_Phase1_EnableZoneTriggers.Enable()
;Debug.Trace("INST307 Before: " + Alias_BoSLibertyPrimeAlias.GetActorRef() + ": "+ Alias_BoSLibertyPrimeAlias.GetActorRef().IsDisabled() + ", " + BoSLibertyPrimeStaticREF + ":" + BoSLibertyPrimeStaticREF.IsDisabled())
Alias_BoSLibertyPrimeAlias.GetActorRef().Disable()
BoSLibertyPrimeStaticREF.Enable()
Inst307PrimeRefHackingLightRef.Enable()
BoSLibertyPrimeStaticREFlights.Enable()
;Debug.Trace("INST307 After: " + Alias_BoSLibertyPrimeAlias.GetActorRef() + ": "+ Alias_BoSLibertyPrimeAlias.GetActorRef().IsDisabled() + ", " + BoSLibertyPrimeStaticREF + ":" + BoSLibertyPrimeStaticREF.IsDisabled())

;Disable the cables from the Prydwen, if they were enabled.
BoSPrydwenCable.Disable()

;Make sure the Agitator furniture and normal Hatch are disabled.
LibertyPrimeAgitatorInsertFurnitureRef.Disable()
BoSHatch.Disable()

;Enable the signal jammers.
Alias_Jammer01.TryToEnable()
Alias_Jammer02.TryToEnable()
Alias_Jammer03.TryToEnable()

;Disable any REs that may have sent Vertibirds to the airport to prevent them from interfering.
REScene_VertibirdKMK01.Stop()
REScene_VertibirdKMK02.Stop()
REScene_VertibirdKMK03.Stop()
RETravel_VertibirdKMK01.Stop()
RETravel_VertibirdKMK02.Stop()
REObject_VertibirdKMK01.Stop()
REObject_VertibirdKMK02.Stop()
REAssault_VertibirdKMK01.Stop()

;---Start Subquests---
;Start the BoS Marshalling quest with the Inst307 stage to prep the faction leaders for the battle.
BoSMarshal.SetStage(20)

;Start the Inst307Fight Vertibird subquest to manage the Vertibirds.
Inst307FightVertibirds.Start()

;Start the Inst307FightCompanionOverrides subquest to manage Companions.
Inst307FightCompanionOverrides.Start()


;---Start the Fight Script---
;Start up the fight script.
kMyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Player has hit the Helipad Jammer.

;Destroy it.
Alias_Jammer01.GetReference().DamageObject(100)

;Spawn Reinforcement Synths
kMyQuest.GeneratorDestroyed(1)

;Update other Jammer stages. Be careful to do this after reinforcement spawning
;so the final reinforcements get a chance to spawn.
SetStage(100)
if (GetStageDone(110) && GetStageDone(120) && GetStageDone(130))
     SetStage(200)
EndIf

;Update Inst307.
Inst307.SetStage(36)
Inst307.SetStage(37)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Player has destroyed the Control Tower Jammer.

;Destroy it.
Alias_Jammer02.GetReference().DamageObject(100)

;Spawn Reinforcement Synths
kMyQuest.GeneratorDestroyed(2)

;Update other Jammer stages. Be careful to do this after reinforcement spawning
;so the final reinforcements get a chance to spawn.
SetStage(100)
if (GetStageDone(110) && GetStageDone(120) && GetStageDone(130))
     SetStage(200)
EndIf

;Update Inst307.
Inst307.SetStage(36)
Inst307.SetStage(38)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Player has destroyed the Barricades Jammer.

;Destroy it.
Alias_Jammer03.GetReference().DamageObject(100)

;Spawn Reinforcement Synths
kMyQuest.GeneratorDestroyed(3)

;Update other Jammer stages. Be careful to do this after reinforcement spawning
;so the final reinforcements get a chance to spawn.
SetStage(100)
if (GetStageDone(110) && GetStageDone(120) && GetStageDone(130))
     SetStage(200)
EndIf

;Update Inst307.
Inst307.SetStage(36)
Inst307.SetStage(39)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;All three Jammers have been destroyed.

;Dismiss the Phase 1 Vertibirds.
Inst307FightVertibirds.SetStage(50)

;Set up the Phase 2 Enable Markers.
Inst307Fight_Phase2_Disable.Disable()
Inst307Fight_Phase2_Enable.Enable()

;Start the first Distant Bolts timer.
kMyQuest.StartDistantBolts01()

;The player's Beacons should work now.
kMyQuest.TryToActivateBeacons()

;Swap out the walls in the main base.
Inst307_BoSWallEnableMarker01.Disable()
Inst307_BoSWallEnableMarker02.Enable()

;Enable Maxson's Vertibird.
Inst307FightVertibirds.SetStage(70)

;Advance the combat to Phase 2.
kMyQuest.StartPhase2()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Player has entered the Main Base during Phase 2; Actors locked and moved into Phase 3 roles.

;Switch out the zone triggers.
Inst307Fight_Phase1_EnableZoneTriggers.Disable()
Inst307Fight_Phase2_EnableZoneTriggers.Enable()

;Start the second Distant Bolts timer.
kMyQuest.StartDistantBolts02()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Player reached the top of the Gantry. Virus Synth has spawned and is moving to position.

;Update Inst307 objectives to direct the player to defend the Virus Synth.
Inst307.SetStage(65)

;Allow spawining of extra synths as slots open up.
kMyQuest.StartSpawningExtraSynths()

;Start the third Distant Bolts timer.
kMyQuest.StartDistantBolts02()

;Begin the combat.
SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Advance the combat to Phase 3.
kMyQuest.StartPhase3()

;Enable the Gantry Targeting Control Trigger.
Inst307Fight_GantryTargetTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Start the Dropship Vertibird.
Inst307FightVertibirds.SetStage(60)

;Update the effects on Prime.
Prime.PlayAnimation("Hack0")
BoSLibertyPrimeStaticRefLights.PlayAnimation("Hack0")
Inst307PrimeRefHackingLightRef.PlayAnimation("Hack0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;As the Virus Synth scene progresses, send in Rhys and Haylen.
;Debug.Trace("Activating Rhys and Haylen")
(Alias_Phase3_BoSEnemy06 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
(Alias_Phase3_BoSEnemy07 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()

;Update the effects on Prime.
Prime.PlayAnimation("Hack25")
BoSLibertyPrimeStaticRefLights.PlayAnimation("Hack25")
Inst307PrimeRefHackingLightRef.PlayAnimation("Hack25")

;The Virus Synth is now 25% done.
Inst307.ModObjectiveGlobal(25, Inst307VirusPercent, 60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;As the Virus Synth scene progresses, dismiss the Dropship Vertibird to
;clear the way for Maxson's Vertibird.
Inst307FightVertibirds.SetStage(69)

;Launch Maxson's Vertibird
Inst307FightVertibirds.SetStage(71)

;Update the effects on Prime.
Prime.PlayAnimation("Hack50")
BoSLibertyPrimeStaticRefLights.PlayAnimation("Hack50")
Inst307PrimeRefHackingLightRef.PlayAnimation("Hack50")

;The Virus Synth is now 50% done.
Inst307.ModObjectiveGlobal(25, Inst307VirusPercent, 60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;Update the effects on Prime.
Prime.PlayAnimation("Hack75")
BoSLibertyPrimeStaticRefLights.PlayAnimation("Hack75")
Inst307PrimeRefHackingLightRef.PlayAnimation("Hack75")

;The Virus Synth is now 75% done.
Inst307.ModObjectiveGlobal(25, Inst307VirusPercent, 60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Stop Phase 3 Respawns (automatic, per their script)

;Dismiss Maxson's Vertibird.
Inst307FightVertibirds.SetStage(79)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;Set by Inst307's Prime scene.
;Force the Phase 3 Enemies to ignore combat and flee.
Alias_Phase3_BoSEnemy01.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy02.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy03.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy04.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy05.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy06.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy07.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy08.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy09.TryToEvaluatePackage()
Alias_Phase3_BoSEnemy10.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;Update the effects on Prime.
Prime.PlayAnimation("Hack100")
BoSLibertyPrimeStaticRefLights.PlayAnimation("Hack100")
Inst307PrimeRefHackingLightRef.PlayAnimation("Hack100")

;The Virus Synth is now 100% done.
Inst307.ModObjectiveGlobal(25, Inst307VirusPercent, 60)

;Notify Inst307 that the Virus Upload is complete. It takes over from here.
Inst307.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
;The Virus Synth shuts itself down after saying its final line.
Alias_Virus.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE inst307fightquestscript
Quest __temp = self as Quest
inst307fightquestscript kmyQuest = __temp as inst307fightquestscript
;END AUTOCAST
;BEGIN CODE
;---Shut down the Airport---
;Make absolutely sure the music override has been removed.
kMyQuest.RemoveMusicOverride()

;Disable all of the Airport Enable State Markers from this quest.
;Leave the rest to Airship Down and Inst307 (setting up the destroyed base, etc.).
BoSAirport_Gate_EnableMarker.Disable()
BoSAirport_GateVehicles_EnableMarker.Disable()
BoSAirport_PostKickoutDefenses_Disable.Disable()
BoSAirport_PostKickoutDefenses_Enable.Disable()
BoSAirport_PostKickoutDefenses_EnableTemp.Disable()
Waterfront_LongWharfSupermutants.Enable()
Inst307Fight_Phase1_Enable.Disable()
Inst307Fight_Phase1_Disable.Disable()
Inst307Fight_Phase1_EnableTemp.Disable()
Inst307Fight_Phase2_Enable.Disable()
Inst307Fight_Phase2_Disable.Disable()
Inst307Fight_BoSSideWallDisableMarker.Disable()
Inst307Fight_BoSSideWallEnableMarker.Disable()
Inst307Fight_GantryTargetTriggerRef.Disable()

;---Shut down Subquests---
;BoSMarshal should shut down and delete all of its actors.
BoSMarshal.SetStage(220)
;Inst307FightVertibirds should shut down and delete all of its actors.
Inst307FightVertibirds.SetStage(255)
;Inst307FightCompanionOverrides should just shut down.
Inst307FightCompanionOverrides.SetStage(255)

;---Shut down the Fight Script---
;Stop the fight script and clean up any surviving actors.
kMyQuest.Shutdown()

;---Clear the Airport---
Alias_BostonAirportLocation.GetLocation().SetCleared()

;Stop this quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSEnable Auto Const
Quest Property BoSKickOut Auto Const
Quest Property BoSMarshal Auto Const
Quest Property Inst307 Auto Const
Quest Property Inst307FightCompanionOverrides Auto Const
Quest Property Inst307FightVertibirds Auto Const
Quest Property REScene_VertibirdKMK01 Auto Const
Quest Property REScene_VertibirdKMK02 Auto Const 
Quest Property REScene_VertibirdKMK03 Auto Const
Quest Property RETravel_VertibirdKMK01 Auto Const
Quest Property RETravel_VertibirdKMK02 Auto Const
Quest Property REObject_VertibirdKMK01 Auto Const
Quest Property REObject_VertibirdKMK02 Auto Const
Quest Property REAssault_VertibirdKMK01 Auto Const

ReferenceAlias Property Alias_Jammer01 Auto Const
ReferenceAlias Property Alias_Jammer02 Auto Const
ReferenceAlias Property Alias_Jammer03 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy01 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy02 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy03 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy04 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy05 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy06 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy07 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy08 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy09 Auto Const
ReferenceAlias Property Alias_Phase3_BoSEnemy10 Auto Const
ReferenceAlias Property Alias_Virus Auto Const

LocationAlias Property Alias_BostonAirportLocation Auto Const

ObjectReference Property Airport_SupplyDepotActorsEnableMarker Auto Const
ObjectReference Property BoSAirport_BaseSpotlights Auto Const
ObjectReference Property BoSAirport_ExteriorDoorsMain Auto Const
ObjectReference Property BoSAirport_Gate_EnableMarker Auto Const
ObjectReference Property BoSAirport_GateVehicles_EnableMarker Auto Const
ObjectReference Property BoSAirport_PostKickoutDefenses_Disable Auto Const
ObjectReference Property BoSAirport_PostKickoutDefenses_Enable Auto Const
ObjectReference Property BoSAirport_PostKickoutDefenses_EnableTemp Auto Const
ObjectReference Property BoSAirport_TeleportJammersState01Enable Auto Const
ObjectReference Property BoSAirport_TeleportJammersState02Enable Auto Const
ObjectReference Property BoSAirportGuards Auto Const
ObjectReference Property BoSAirportSupplyDepotSoldiers Auto Const
ObjectReference Property BoSHatch Auto Const
ObjectReference Property BoSWallDisabler Auto Const
ObjectReference Property Inst307_BoSWallEnableMarker01 Auto Const
ObjectReference Property Inst307_BoSWallEnableMarker02 Auto Const
ObjectReference Property Inst307Fight_BoSSideWallDisableMarker Auto Const
ObjectReference Property Inst307Fight_BoSSideWallEnableMarker Auto Const
ObjectReference Property Inst307Fight_Disable Auto Const
ObjectReference Property Inst307Fight_Enable Auto Const
ObjectReference Property Inst307Fight_GantryTargetTriggerRef Auto Const
ObjectReference Property Inst307Fight_Phase1_Disable Auto Const
ObjectReference Property Inst307Fight_Phase1_Enable Auto Const
ObjectReference Property Inst307Fight_Phase1_EnableTemp Auto Const
ObjectReference Property Inst307Fight_Phase1_EnableZoneTriggers Auto Const
ObjectReference Property Inst307Fight_Phase2_Disable Auto Const
ObjectReference Property Inst307Fight_Phase2_Enable Auto Const
ObjectReference Property Inst307Fight_Phase2_EnableZoneTriggers Auto Const
ObjectReference Property Inst307Fight_Phase3Quickstart Auto Const
ObjectReference Property Inst307Fight_QuickstartFrontEntrance Auto Const
ObjectReference Property Inst307Fight_QuickstartJammer1 Auto Const
ObjectReference Property Inst307Fight_QuickstartJammer2 Auto Const
ObjectReference Property Inst307Fight_QuickstartJammer3 Auto Const
ObjectReference Property Inst307Fight_QuickstartPhase2 Auto Const
ObjectReference Property Inst307Fight_QuickstartPhase3 Auto Const
ObjectReference Property Inst307Fight_QuickstartTerminalEntrance Auto Const
ObjectReference Property Inst307Fight_SupplyDepotSecurityDoor Auto Const
ObjectReference Property Inst307PlayerAirportMarkerRef Auto Const
ObjectReference Property Inst307RelayPoint Auto Const
ObjectReference Property LibertyPrimeAgitatorInsertFurnitureRef Auto Const
ObjectReference Property LibertyPrimeHangarDoor Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const
Faction Property InstituteFaction Auto Const
Faction Property PlayerFaction Auto Const

Weapon Property InstituteBeaconGrenade Auto Const

ObjectReference Property BoSDScribeEnablerRef Auto Const

ObjectReference Property Waterfront_LongWharfSupermutants Auto Const

GlobalVariable Property Inst307VirusPercent Auto Const

ObjectReference Property BoSAirport_RadarDish Auto Const

ObjectReference Property Prime Auto Const

ObjectReference Property BoSLibertyPrimeStaticREFlights Auto Const

ObjectReference Property inst307PrimeRefHackingLightRef Auto Const

ObjectReference Property BoSPrydwenCable Auto Const Mandatory

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const Mandatory

ReferenceAlias Property Alias_BoSLibertyPrimeAlias Auto Const Mandatory

ObjectReference Property BoSAirportScene Auto Const Mandatory

ObjectReference Property BoSAirportSceneTrigger Auto Const Mandatory
