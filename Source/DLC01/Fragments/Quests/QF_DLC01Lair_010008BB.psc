;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01Lair_010008BB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair01_QuickstartEntranceMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Handles any general setup required by the other quickstarts (setting or
;completing prior DLC01MQ stages, etc.).
DLC01MQ01.SetStage(1000)
DLC01MQ01.SetStage(3000)
DLC01MQ02.SetStage(700)
DLC01MQ02.SetStage(1000)
DLC01MQ02.SetStage(3000)
DLC01MQ04.SetStage(220)
DLC01MQ04.SetStage(255)
DLC01MQ05.SetStage(10)
DLC01MQ05.SetStage(500)
DLC01MQ05.SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;SPECIAL DEBUG: Allow the player to open Mechanist Doors directly.
Game.GetPlayer().AddKeyword(DLC01CanOpenMechanistDoorsKeyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Set any relevant prior stages.
DLC01MQ05.SetStage(700)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair01_QuickstartFacilityEntranceMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Set any relevant prior stages.
DLC01MQ05.SetStage(700)
DLC01LairENT_EyebotConfrontation1TriggerRef.Disable()
DLC01LairENT_OverlookAccessPort.ForceBlinking = False

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair01_QuickstartProductionEntranceMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Give the player the voiceprint bypass holotapes.
Game.GetPlayer().AddItem(Alias_DLC01Lair_VoiceprintHolotape_Production.GetReference())
Game.GetPlayer().AddItem(Alias_DLC01Lair_VoiceprintHolotape_Facilities.GetReference())
Game.GetPlayer().AddItem(Alias_DLC01Lair_VoiceprintHolotape_Research.GetReference())

;Set any relevant prior stages.
DLC01MQ05.SetStage(700)
;SetStage(910)
;SetStage(920)
;SetStage(921)
;SetStage(922)
;SetStage(930)
DLC01Lair_ENT_DeconElevatorTerminalRef.Unlock()

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair01_QuickstartBypassMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair_QuickstartMechanistBattle)

;Set any relevant prior stages.
DLC01MQ05.SetStage(700)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Set any relevant prior stages.
kMyQuest.QuickstartBypassActive = True
DLC01MQ05.SetStage(700)
SetStage(1000)
SetStage(1100)
kMyQuest.QuickstartBypassActive = False
SetStage(1199)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair_QuickstartMechanistBattle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Generic quickstart.
SetStage(1)

;Set any relevant prior stages.
kMyQuest.QuickstartBypassActive = True
DLC01MQ05.SetStage(700)
SetStage(1000)
SetStage(1100)
SetStage(1199)
SetStage(1200)
SetStage(1201)
SetStage(1202)
SetStage(1299)
SetStage(1300)
;SetStage(1320)
SetStage(1330)
SetStage(1350)
kMyQuest.QuickstartBypassActive = False

;Move the Mechanist and Sparks into position.
Alias_Mechanist.GetActorRef().MoveTo(DLC01Lair_MBattle_MechanistConfrontationMarker)
Alias_Sparks.GetActorRef().MoveTo(DLC01Lair_MBattle_SparksConfrontationMarker)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(DLC01Lair_QuickstartMechanistBattle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC01Lair_MBattle_SparkRestorePowerPoint)
Game.GetPlayer().AddItem(DLC01LairCC_MasterControlPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;---Dungeon Setup---
;Quest Script - Initialize
kMyQuest.Startup()

;Overlook - The Access Port on the Overlook is initially locked down.
DLC01LairENT_OverlookAccessPort.ForceBlinking = True

;---Mechanist Boss Battle Setup---
;Store local refs.
Actor Mechanist = Alias_Mechanist.GetActorRef()
Actor Sparks = Alias_Sparks.GetActorRef()

;The Mechanist and Sparks are initially Ghosted to prevent the player from damaging them in any way
;prior to the confrontation. This is cleared when the player commits to the Bypass (Stage 950),
;or just before Phase 3 of the fight, when the ladder comes down (Stage 1350).
Mechanist.SetGhost(True)
Sparks.SetGhost(True)

;Additionally, Sparks needs to be immune to Robotics Expert until Stage 1350.
Sparks.AddKeyword(PerkRoboticsExpertImmune)

;Spawn the Mechanist's custom items.
DLC01MasterQuest.SetStage(100)

;Ghost the four Protectrons in Pods, and make them immune to Robotics Expert as well.
int i = 0
Actor current
While (i < Alias_MBattle_P1_Protectrons_Group1.GetCount())
     current = Alias_MBattle_P1_Protectrons_Group1.GetAt(i) as Actor
     if (current != None)
          current.SetGhost(True)
          current.AddKeyword(PerkRoboticsExpertImmune)
     EndIf
     i = i + 1
EndWhile
i = 0
While (i < Alias_MBattle_P1_Protectrons_Group2.GetCount())
     current = Alias_MBattle_P1_Protectrons_Group2.GetAt(i) as Actor
     if (current != None)
          current.SetGhost(True)
          current.AddKeyword(PerkRoboticsExpertImmune)
     EndIf
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Clear the name override on the first Access Port.
Alias_DLC01Lair_EntranceAccessPort.Clear()

;Remove the layer of Blackplanes hiding the rest of the dungeon from the local map.
DLC01Lair_LairBlackplaneEnableMarker.DisableNoWait()

;Play the Reveal music.
Utility.Wait(1.25)
MUSReveal.Add()

;Deeper in, turn off the Generator connected to the spotlights, which turns them off as well.
DLC01Lair_SpotlightGenerator.DamageObject(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;Update DLC01MQ05.
DLC01MQ05.SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the player's robot approaches the Security Doors:

;Play the Security Door scene.
DLC01Lair_ENT_SecurityDoorScene.Start()

;Switch the Security Door lights from Red to Green.
DLC01:DLC01Lair_SecurityDoorLightScript[] lights = DLC01LairENT_SecurityDoorLight01.GetLinkedRefChain() as DLC01:DLC01Lair_SecurityDoorLightScript[]
lights.Insert(DLC01LairENT_SecurityDoorLight01, 0)
lights[0].SetGreen()
DLC01OBJLightSwitchActivate.Play(lights[0])
Utility.Wait(0.5)
lights[1].SetGreen()
DLC01OBJLightSwitchActivate.Play(lights[1])
lights[2].SetGreen()
lights[3].SetGreen()
lights[4].SetGreen()
lights[5].SetGreen()
Utility.Wait(0.5)

;Then proceed to open the doors.
ObjectReference[] doors = DLC01LairENT_SecurityDoor01.GetLinkedRefChain()
doors.Insert(DLC01LairENT_SecurityDoor01, 0)
;Door 1
doors[0].SetOpen()
Utility.Wait(4)
;Door 2
doors[1].SetOpen()
Utility.Wait(2)
;Door 3
doors[2].SetOpen()

;Enable the Decon Hall Protectrons.
int i = 0
While (i < Alias_DLC01Lair_DeconHallProtectrons.GetCount())
     Actor p = Alias_DLC01Lair_DeconHallProtectrons.GetAt(i) as Actor
     if (p != None)
          p.EnableNoWait()
     EndIf
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;This fallback stage is set by DLC01Lair_SecurityDoorLightScript, in case Stage 200
;failed to open all of the doors because the player left the dungeon before the script got to them.
ObjectReference[] doors = DLC01LairENT_SecurityDoor01.GetLinkedRefChain()
doors.Insert(DLC01LairENT_SecurityDoor01, 0)
int i = 0
While (i < doors.Length)
     doors[i].SetOpen()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Enable and start the Decon Hall Protectrons.
int i = 0
While (i < Alias_DLC01Lair_DeconHallProtectrons.GetCount())
     Actor p = Alias_DLC01Lair_DeconHallProtectrons.GetAt(i) as Actor
     if (p != None)
          p.EnableNoWait()
          p.MoveToMyEditorLocation()
          p.EvaluatePackage()
     EndIf
     i = i + 1
EndWhile

;Wait a bit.
Utility.Wait(2)

;Play the Decon Hall scene if the player hasn't done anything to interrupt it.
if (GetStage() == 210)
     DLC01Lair_ENT_DeconHall_Initial.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
;Open the Decon Hall Exit Door for the Protectrons
DLC01LairENT_DeconHallExitDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;When the player trips a tripwire.
;- Disable all of the tripwires.
kMyQuest.DisableDeconHallLasers(0)

;- If the player is in the Decon Hall, close the doors to lock them in.
if (!GetStageDone(223) && (DLC01LairENT_DeconHallTriggerRef.GetTriggerObjectCount() > 0))
     DLC01LairENT_DeconHallExitDoor.SetOpenNoWait(False)
     DLC01LairENT_DeconHallEntryDoor.SetOpenNoWait(False)
     kMyQuest.MonitorDeconHallTrigger()
EndIf

;If the Decon Hall Protectrons aren't in their pods yet, set them hostile.
int i = 0
While (i < Alias_DLC01Lair_DeconHallProtectrons.GetCount())
     Actor p = Alias_DLC01Lair_DeconHallProtectrons.GetAt(i) as Actor
     if ((p != None) && (p.GetValue(ProtectronPodStatus) != 0))
          kMyQuest.ActivateProtectron(p)
     EndIf
     i = i + 1
EndWhile

;Play the 'Intruder Detected' scene. This ends by activating the turrets (Stage 221).
DLC01Lair_ENT_DeconHall_IntruderDetected.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
;Once the 'Intruder Detected' scene has finished, activate the turrets.
int i = 0
While (i < Alias_DLC01Lair_DeconHallTurrets.GetCount())
     (Alias_DLC01Lair_DeconHallTurrets.GetAt(i) as Actor).SetUnconscious(False)
     Utility.Wait(Utility.RandomFloat(0.25, 1))
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
;Failsafe: If the player somehow manages to slip out before the Decon Hall doors close (or
;gets out in some other way... bug, etc.), reopen the entry door so they can kill the turrets.
;Otherwise, this event becomes a progression blocker.
;
;Stage set by DLC01LairQuestScript's MonitorDeconHallTrigger.
DLC01LairENT_DeconHallEntryDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0223_Item_00
Function Fragment_Stage_0223_Item_00()
;BEGIN CODE
;Failsafe: If the player bypasses the turret hall, its doors won't close if the trap is subsequently
;triggered, and they reopen if they were closed. This avoids some confusion with the Overlook
;Access Point, which only allows the player to proceed if they're not in combat.
DLC01LairENT_DeconHallExitDoor.SetOpenNoWait(True)
DLC01LairENT_DeconHallEntryDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0229_Item_00
Function Fragment_Stage_0229_Item_00()
;BEGIN CODE
;Once the player defeats all of the turrets in the Decon Hall:
if (!GetStageDone(230) && !GetStageDone(2000))
     ;- Play the Security Failure scene.
     DLC01Lair_ENT_DeconHall_IntruderDefeatedSecurity.Start()

     ;-Open the doors, if they weren't already open.
     DLC01LairENT_DeconHallExitDoor.SetOpenNoWait(True)
     DLC01LairENT_DeconHallEntryDoor.SetOpenNoWait(True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
DLC01Lair_ENT_DeconHall_DeactivateViaArches.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Set by DLC01LairQuestScript's StartEyebotConfrontation1, when the confontation is clear to start.
;Spawn the Mechanist Eyebot at the overlook.
Actor MEyebot01 = DLC01_EyebotPipeSpawnPoint.PlaceActorAtMe(DLC01LvlMechEyeBot_NonHostileNoRadio, 1, DLC01LairZone)
Alias_DLC01Lair_MechanistEyebot01.ForceRefTo(MEyebot01)
Alias_DLC01Lair_DungeonRobots.AddRef(MEyebot01)
DLC01LairEntrance_EyebotPipe01.PlaceEyebot(MEyebot01)

;Set a stage on DLC01MQ05 to start the eyebot scene.
DLC01MQ05.SetStage(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;The Mechanist Eyebot becomes hostile.
Actor a = Alias_DLC01Lair_MechanistEyebot01.GetActorRef()
a.SetValue(Aggression, 2)
a.StartCombat(Game.GetPlayer())
a.EvaluatePackage()

;Activate the Protectrons at the overlook, including the Decon Protectrons if they're still alive.
kMyQuest.ActivateProtectron(Alias_DLC01Lair_OverlookProtectrons.GetAt(0))
Utility.Wait(0.25)
kMyQuest.ActivateProtectron(Alias_DLC01Lair_OverlookProtectrons.GetAt(1))
Utility.Wait(1)
kMyQuest.ActivateProtectron(Alias_DLC01Lair_DeconHallProtectrons.GetAt(0))
Utility.Wait(0.25)
kMyQuest.ActivateProtectron(Alias_DLC01Lair_DeconHallProtectrons.GetAt(1))

;In Stage 10, we used ForceBlinking to lock down the Overlook Access Port.
;The player should now be able to use it (well, once they finish the combat).
DLC01LairENT_OverlookAccessPort.ForceBlinking = False
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Spawn the Mechanist Eyebot in the Utility Wing Entry Hall.
Actor MEyebot02 = DLC01_EyebotPipeSpawnPoint.PlaceActorAtMe(DLC01LvlMechEyeBot_NonHostileNoRadio, 1, DLC01LairZone)
Alias_DLC01Lair_MechanistEyebot02.ForceRefTo(MEyebot02)
Alias_DLC01Lair_DungeonRobots.AddRef(MEyebot02)
DLC01LairUtility_EyebotPipe02.PlaceEyebot(MEyebot02)

;Set a stage on DLC01MQ05 to start the eyebot scene.
DLC01MQ05.SetStage(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;The Mechanist Eyebot becomes hostile.
Actor a = Alias_DLC01Lair_MechanistEyebot02.GetActorRef()
a.SetValue(Aggression, 2)
a.StartCombat(Game.GetPlayer())
a.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
;Small delay.
Utility.Wait(1)

;Spawn the Mechanist Eyebot in the Utility Wing Facilities Room.
Actor MEyebot03 = DLC01_EyebotPipeSpawnPoint.PlaceActorAtMe(DLC01LvlMechEyeBot_NonHostileNoRadio, 1, DLC01LairZone)
Alias_DLC01Lair_MechanistEyebot03.ForceRefTo(MEyebot03)
Alias_DLC01Lair_DungeonRobots.AddRef(MEyebot03)
DLC01LairUtility_EyebotPipe03.PlaceEyebot(MEyebot03)

;Set a stage on DLC01MQ05 to start the eyebot scene.
DLC01MQ05.SetStage(670)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
;The Mechanist Eyebot becomes hostile.
Actor a = Alias_DLC01Lair_MechanistEyebot03.GetActorRef()
a.SetValue(Aggression, 2)
a.StartCombat(Game.GetPlayer())
a.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
;Adknowledge the voiceprint.
DLC01Lair_Bypass_VoiceprintAcknowledged.Stop()
DLC01Lair_Bypass_VoiceprintAcknowledged.Start()

;Increment the count.
DLC01Lair_VoiceprintCount.Mod(1)
DLC01Lair_ENT_DeconElevatorTerminalRef.AddTextReplacementData("VoiceprintCount", DLC01Lair_VoiceprintCount)

;If all three voiceprints have been entered, advance to the next stage.
if (GetStageDone(920) && GetStageDone(921) && GetStageDone(922))
     SetStage(930)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0921_Item_00
Function Fragment_Stage_0921_Item_00()
;BEGIN CODE
;Adknowledge the voiceprint.
DLC01Lair_Bypass_VoiceprintAcknowledged.Stop()
DLC01Lair_Bypass_VoiceprintAcknowledged.Start()

;Increment the count.
DLC01Lair_VoiceprintCount.Mod(1)
DLC01Lair_ENT_DeconElevatorTerminalRef.AddTextReplacementData("VoiceprintCount", DLC01Lair_VoiceprintCount)

;If all three voiceprints have been entered, advance to the next stage.
if (GetStageDone(920) && GetStageDone(921) && GetStageDone(922))
     SetStage(930)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0922_Item_00
Function Fragment_Stage_0922_Item_00()
;BEGIN CODE
;Adknowledge the voiceprint.
DLC01Lair_Bypass_VoiceprintAcknowledged.Stop()
DLC01Lair_Bypass_VoiceprintAcknowledged.Start()

;Increment the count.
DLC01Lair_VoiceprintCount.Mod(1)
DLC01Lair_ENT_DeconElevatorTerminalRef.AddTextReplacementData("VoiceprintCount", DLC01Lair_VoiceprintCount)

;If all three voiceprints have been entered, advance to the next stage.
if (GetStageDone(920) && GetStageDone(921) && GetStageDone(922))
     SetStage(930)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
;Release the lockdown on the elevator.
DLC01LairCC_Elevator.MakeElevatorFunctional()
DLC01LairCC_Elevator_UpperCallButton.Activate(Game.GetPlayer())

DLC01Lair_Bypass_VoiceprintAcknowledged.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Voiceprint Route
;The player is committed to the Mechanist Encounter.
kMyQuest.CleanupDungeonNoWait()

;Reinstate the lockdown on the elevator.
DLC01LairCC_Elevator.MakeElevatorNonfunctional()

;Open the Control Center door on the elevator's side.
DLC01LairCC_RightDoor.SetOpenNoWait(True)

;Remove Ghosting on the Mechanist and Sparks. Attacking them will trigger combat.
Alias_Mechanist.GetActorRef().SetGhost(False)
Alias_Sparks.GetActorRef().SetGhost(False)

;Update the Mechanist and Sparks' packages. Briefly disable the Mechanist to snap
;her into her new furniture for this route.
Alias_Mechanist.TryToDisable()
Alias_Mechanist.TryToEvaluatePackage()
Alias_Mechanist.TryToEnableNoWait()
Alias_Sparks.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
DLC01MQ05.SetStage(840)
kMyQuest.StartMechanistDistanceCheck(768)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Play the Dread music.
MUSDread.Add()

;When the player enters the Facility Chamber, turn on the staggered lights.
QSTArcJetLightsOnB.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsNormal01.EnableNoWait()
Utility.Wait(1.5)
QSTArcJetLightsOnB.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsNormal02.EnableNoWait()
Utility.Wait(1.5)
QSTArcJetLightsOnB.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsNormal03.EnableNoWait()
DLC01FC_MechanistDialogueLighting_White.EnableNoWait(True)
Utility.Wait(1.5)
QSTArcJetLightsOnB.Play(DLC01LairFC_AudioSource)
DLC01Lair_SpotlightGenerator.ClearDestruction()

;For safety, stop combat on the Mechanist and/or Sparks if needed.
Actor Mechanist = Alias_Mechanist.GetActorRef()
Actor Sparks = Alias_Sparks.GetActorRef()
if ((Mechanist != None) && (Sparks != None) && (Mechanist.IsInCombat() || Sparks.IsInCombat()))
     Mechanist.StopCombat()
     Sparks.StopCombat()
     Mechanist.EvaluatePackage()
     Sparks.EvaluatePackage()
EndIf

DLC01FC_SpotlightTrigger.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Normal Route
;When the player enters the Spotlight Trigger, trigger the Mechanist's forcegreet.

if (GetStage() <= 1050)
     ;Enable a collision prim on the entrance to make sure the player can't slip out before the doors shut.
     DLC01LairFC_MechDoorSupplementalCollision.EnableNoWait()

     ;Seal the doors. The player has committed to the fight, and is trapped in the room until
     ;they've finished the Mechanist encounter.
     kMyQuest.SetAllMechanistDoorStates("RedOn")
     DLC01LairCC_MechDoor07Control.ForceBlinking = True

     ;Enable Complex Scene Mode to improve performance.
     DLC01LairFC_MechanistBattleComplexSceneMarker.EnableNoWait()

     ;The player is committed to the Mechanist Encounter.
     kMyQuest.CleanupDungeonNoWait()

     ;Give the MechBots ownership of the Generator and Spotlights, to prevent them from attacking.
     DLC01Lair_SpotlightGenerator.SetFactionOwner(DLC01MechBotFaction)
     int i = 0
     While (i < Alias_DLC01Lair_Spotlights.GetCount())
          Actor spotlight = Alias_DLC01Lair_Spotlights.GetAt(i) as Actor
          if (spotlight != None)
               spotlight.SetFactionOwner(DLC01MechBotFaction)
               spotlight.RemoveFromFaction(PlayerFaction)
               spotlight.AddToFaction(DLC01MechBotFaction)
          EndIf
          i = i + 1
     EndWhile

     ;For safety, stop combat on the Mechanist and/or Sparks if needed.
     Actor Mechanist = Alias_Mechanist.GetActorRef()
     Actor Sparks = Alias_Sparks.GetActorRef()
     if ((Mechanist != None) && (Sparks != None) && (Mechanist.IsInCombat() || Sparks.IsInCombat()))
          Mechanist.StopCombat()
          Sparks.StopCombat()
          Mechanist.EvaluatePackage()
          Sparks.EvaluatePackage()
     EndIf

     ;Trigger the forcegreet.
     DLC01MQ05.SetStage(800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1060_Item_00
Function Fragment_Stage_1060_Item_00()
;BEGIN CODE
;Turn on the lights in the Control Center
MUSStingerShort.Add()
DLC01LairCC_ControlCenterLightingEnableMarker.EnableNoWait(True)
DLC01LairCC_BlastShield.SetOpen(True)

;Let DLC01MQ05 know the Blast Shields are open so its scene can continue.
DLC01MQ05.SetStage(802)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;--Mechanist Battle, Phase 1--
;After the Mechanist's Initial dialogue, DLC01MQ05 sets this stage to begin the fight.

;Make sure DLC01MQ05's Initial Confrontation scene has stopped.
DLC01MQ05.SetStage(810)

;Set up the lighting for the first phase of the fight.
DLC01AMBMechanistLairPowerUp.Play(DLC01LairFC_AudioSource)
DLC01LairFC_DarkLightingEnableMarker.EnableNoWait(True)

;Let the quest script know the fight is about to start.
kMyQuest.MBattle_Phase1_Start()

;Activate the first wave.
if (!kMyQuest.QuickstartBypassActive)
     SetStage(1110)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1110 - Activate Group 1 (+4)")

;Dispatch the robots.
kMyQuest.MBattle_Phase1_Dispatch1110()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1119_Item_00
Function Fragment_Stage_1119_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1119 - Group 1 Dead (-3)")

;Play the scene to activate the next wave.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1120_P1_Group2Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1110 - Activate Group 2 (+4)")

;Dispatch the robots.
kMyQuest.MBattle_Phase1_Dispatch1120()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1129_Item_00
Function Fragment_Stage_1129_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1129 - Group 2 Dead (-7)")

;Play the scene to activate the next wave.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1130_P1_Group3Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1130 - Activate Sentry (+1) & Eyebots (+10 staggered)")

;Dispatch the robots.
kMyQuest.MBattle_Phase1_Dispatch1130()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1139_Item_00
Function Fragment_Stage_1139_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1139 - Sentry Dead")

;Are all of the Phase 1 robots dead?
; - If not, proceed to the Self Destruct scene.
; - If so, Stage 1199 has already begun Phase 2.
if (!GetStageDone(1149))
     kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1150_SelfDestructStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1149_Item_00
Function Fragment_Stage_1149_Item_00()
;BEGIN CODE
;Debug.Trace("STAGE 1149 - Eyebots Dead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
;All of the remaining Phase 1 robots self-destruct on command.

;Temporarily stop removing dead actors from the collection while we issue the self-destruct order.
;Otherwise, if an actor is removed while we're in this loop, our count can be off, breaking the fight.
(Alias_MBattle_P1_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(False)

int i = 0
While (i < Alias_MBattle_P1_RobotsAll.GetCount())
     ;Delay slightly between each self-destruct trigger, to spread out the sound effects.
     if (i > 0)
          Utility.Wait(Utility.RandomFloat(0.05, 0.2))
     EndIf
     Actor current = Alias_MBattle_P1_RobotsAll.GetAt(i) as Actor
     if (current.IsDead())
          ;Nothing to do.
     ElseIf (current.GetParentCell() != DLC01Lair01)
          ;Any Eyebots still in the holding cell are just killed.
          current.Kill()
     Else
          ;Otherwise, trigger the self-destruct.
          current.Activate(RobotSelfDestructerREF)
     EndIf
     i = i + 1
EndWhile

;Resume removing dead actors from the collection.
(Alias_MBattle_P1_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(True)

;If the Mechanist said Eyebots were expendable, we have a follow-up scene with Sparks.
Utility.Wait(2)
if (GetStageDone(1151) && !GetStageDone(1199) && !GetStageDone(1200))
     SetStage(1152)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1152_Item_00
Function Fragment_Stage_1152_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;If the Mechanist said Eyebots were expendable, there's a follow-up scene with Sparks.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1150_SelfDestructStart2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1199_Item_00
Function Fragment_Stage_1199_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1199 - Phase 1 Ends")

;Phase 1 has ended.
kMyQuest.MBattle_Phase1_End()

;Cut off any scenes from Phase 1 that are still playing.
DLC01Lair_MBattle_1120_P1_Group2Start.Stop()
DLC01Lair_MBattle_1130_P1_Group3Start.Stop()
DLC01Lair_MBattle_1150_SelfDestructStart.Stop()
DLC01Lair_MBattle_1150_SelfDestructStart2.Stop()

;Start the Phase 2 intro.
if (!kMyQuest.QuickstartBypassActive)
     kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1200_Intro)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;--Mechanist Battle, Phase 2--

;Notify the quest script that Phase 2 is about to start.
kMyQuest.MBattle_Phase2_Start()

;Start up the track system. Here we go...
kMyQuest.MBattle_Phase2_StartSceneTracks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1202_Item_00
Function Fragment_Stage_1202_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.MBattle_Phase2_StopSceneTracks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1210 - Phase 2, Group 1")

;Dispatch the robots.
kMyQuest.MBattle_Phase2_Dispatch1210()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1219_Item_00
Function Fragment_Stage_1219_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1219 - Phase 2, Group 1, 2 Dead")

;Play the next warning scene.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_Mbattle_1220_Warning)

;But go ahead and spawn the next wave without waiting for it.
SetStage(1220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1220 - Phase 2, Group 2")

;Dispatch the robots.
kMyQuest.MBattle_Phase2_Dispatch1220()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1229_Item_00
Function Fragment_Stage_1229_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1229 - Phase 2, Group 2, 5 Dead")

;Play the next warning scene.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1230_Warning)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1230 - Phase 2, Group 3")

;Dispatch the robots.
kMyQuest.MBattle_Phase2_Dispatch1230()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1239_Item_00
Function Fragment_Stage_1239_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1239 - Phase 2, Group 3, Sentry Dead")

;Play the next warning scene.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1240_Warning)

;But go ahead and spawn the next wave without waiting for it.
SetStage(1240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1240 - Phase 2, Group 4")

;Dispatch the robots.
kMyQuest.MBattle_Phase2_Dispatch1240()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1249_Item_00
Function Fragment_Stage_1249_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1249 - Phase 2, Group 4, 13 Dead")

;Play the Junkbot startup scene.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1280_JunkbotStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1280_Item_00
Function Fragment_Stage_1280_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1280 - Phase 2, Junkbots")

;Unleash the Junkbots!
kMyQuest.StartTrashbotAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1289 - Phase 2, Junkbots Done")

;Stop the Phase 2 Interventions at this point.
kMyQuest.StopPhase2Interventions()

;Queue up the final countdown scene.
kMyQuest.MBattle_EnqueueScene(DLC01Lair_MBattle_1290_JunkbotFinalCountdown)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1299_Item_00
Function Fragment_Stage_1299_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("STAGE 1299 - Phase 2 Ends")

;Phase 2 has ended.
kMyQuest.MBattle_Phase2_End()

;Continue to the Emerge scene.
SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;--Mechanist Battle, Emerge Phase--
;The Mechanist has exhausted the facility's power reserves. Begin the Emerge sequence.
;Debug.Trace("Mechanist Battle, Emerge Phase")

;The power goes out.
DLC01AMBMechanistLairPowerDown.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsPerimeter.DisableNoWait()
DLC01FC_LightsNormal01.DisableNoWait()
DLC01FC_LightsNormal02.DisableNoWait()
DLC01FC_LightsNormal03.DisableNoWait()
DLC01FC_MechanistDialogueLighting_White.DisableNoWait()
DLC01FC_MechanistDialogueLighting_Red.DisableNoWait()
int i = 0
While (i < Alias_DLC01Lair_Spotlights.GetCount())
     Actor spotlight = Alias_DLC01Lair_Spotlights.GetAt(i) as Actor
     if (spotlight != None)
          spotlight.Disable()
     EndIf
     i = i + 1
EndWhile
DLC01Lair_SpotlightGenerator.DamageObject(1000)
i = 0
While (i < Alias_DLC01Lair_Spotlights.GetCount())
     Actor spotlight = Alias_DLC01Lair_Spotlights.GetAt(i) as Actor
     if (spotlight != None)
          spotlight.EnableNoWait()
     EndIf
     i = i + 1
EndWhile

;The Console Panels turn off.
DLC01CC_LitConsolePanels.DisableNoWait()

;The Robobrain Typists stop typing.
i = 0
While (i < Alias_DLC01Lair_RoboTypists.GetCount())
     Alias_DLC01Lair_RoboTypists.GetAt(i).PlayAnimation("StopAnim")
     i = i + 1
EndWhile

;The tracks pause.
DLC01FC_Dispatcher.PauseAllTracks()

;The Mechanist doors become completely unresponsive.
kMyQuest.SetAllMechanistDoorStates("RedOff")

;Any and all surviving robots from Phases 1 & 2 die when the power fails. Fork off a timer to go through
;and kill them all with slight delays.
kMyQuest.KillPhase12Robots()

;Open the Control Center Door so the Mechanist can come out (eventually).
DLC01LairCC_ExitDoor.SetOpenNoWait(True)

;Trigger the Mechanist's Emerge scene.
if (!kMyQuest.QuickstartBypassActive)
     DLC01Lair_MBattle_1300_MechanistEmerges_Part1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
;Restore emergency power.
DLC01AMBMechanistLairPowerUp.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsEmergency.EnableNoWait()
DLC01FC_MechanistDialogueLighting_Red.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
;Open the Control Center Switch Door.
SetStage(1340)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Lower the ladder to the floor of the Facility Chamber.

;The Mechanist presumably pushed a button or something.
OBJSwitchButton.Play(Alias_Mechanist.GetActorRef())

;Remove Ghosting on the Mechanist and Sparks. After this point, attacking them triggers Phase 3.
Alias_Mechanist.GetActorRef().SetGhost(False)
Alias_Sparks.GetActorRef().SetGhost(False)

;Remove the Robotics Expert immunity from Sparks.
Alias_Sparks.GetActorRef().RemoveKeyword(PerkRoboticsExpertImmune)

;Extend the ladder.
OBJSwitchButton.Play(DLC01LairCC_Ramp)
DLC01LairCC_Ramp.SetOpenNoWait()
DLC01LairCC_RampCollisionEnableMarker.EnableNoWait()

;Dialogue or Combat?
if (GetStageDone(1330)) ;Dialogue
     ;Wait for the ramp to come down.
     Utility.Wait(2)
     ;Enable the greeting for the Mechanist Confrontation in DLC01MQ05.
     DLC01MQ05.SetStage(850)
Else ;Combat
     ;Open the catwalk-level door, too.
     DLC01LairFC_ControlCenterCatwalkSecurityDoor.SetOpenNoWait(True)
     ;Then proceed directly to combat.
     SetStage(1400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1360_Item_00
Function Fragment_Stage_1360_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the distance check for the Mechanist's forcegreet.
kMyQuest.StartMechanistDistanceCheck(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;--Mechanist Battle, Phase 3-
;Debug.Trace("Mechanist Battle, Phase 3")

;Store off local refs.
Actor Mechanist = Alias_Mechanist.GetActorRef()
Actor Sparks = Alias_Sparks.GetActorRef()
Actor Player = Game.GetPlayer()

;Make sure DLC01MQ05's Main Confrontation scene has stopped.
DLC01MQ05.SetStage(890)

;Make sure the catwalk-level door is open so the Mechanist can't get pinned inside.
DLC01LairFC_ControlCenterCatwalkSecurityDoor.SetOpenNoWait(True)

;As a safety check, make sure that if the Mechanist or Sparks are already dead
;when this stage is set, their death stages get set correctly.
if (Sparks.IsDead())
     SetStage(1498)
EndIf
if (Mechanist.IsDead())
     SetStage(1499)
EndIf

;Give the Mechanist ownership of the Generator and Spotlights.
if (!GetStageDone(2000))
     DLC01Lair_SpotlightGenerator.SetFactionOwner(DLC01MechanistFaction)
     int i = 0
     While (i < Alias_DLC01Lair_Spotlights.GetCount())
          Actor spotlight = Alias_DLC01Lair_Spotlights.GetAt(i) as Actor
          if (spotlight != None)
               spotlight.SetFactionOwner(DLC01MechanistFaction)
               spotlight.RemoveFromFaction(PlayerFaction)
               spotlight.RemoveFromFaction(DLC01MechBotFaction)
               spotlight.AddToFaction(DLC01MechanistFaction)
          EndIf
          i = i + 1
     EndWhile
EndIf

;Start the combat.
DLC01MechanistFaction.SetEnemy(PlayerFaction)
Mechanist.StartCombat(Player)
Mechanist.EvaluatePackage()
Sparks.StartCombat(Player)
Sparks.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1498_Item_00
Function Fragment_Stage_1498_Item_00()
;BEGIN CODE
;If both the Mechanist and Sparks are dead, the fight is over.
if (GetStageDone(1498) && GetStageDone(1499))
     SetStage(1502)
Else
     ;Trigger the Mechanist's dialogue if Sparks is killed.
     DLC01MQ05.SetStage(750)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1499_Item_00
Function Fragment_Stage_1499_Item_00()
;BEGIN CODE
;If the player didn't receive the Master Control Password from the Mechanist
;during the post-Emerge dialogue, place it on her corpse.
if (!GetStageDone(1501))
     Alias_Mechanist.GetActorRef().AddItem(DLC01LairCC_MasterControlPassword)
EndIf

;Wait briefly for the Mechanist's corpse to settle.
Utility.Wait(2)

;When the Mechanist is killed (at any point, even post-quest), Sparks rushes
;the player and self-destructs (or just dies, if he isn't loaded).
Actor Sparks = Alias_Sparks.GetActorRef()
if (Sparks.Is3DLoaded())
     Sparks.Activate(RobotSelfDestructerRef)
     Sparks.EvaluatePackage()
Else
     Sparks.Kill()
EndIf

;If both the Mechanist and Sparks are dead, the fight is over.
if (GetStageDone(1498) && GetStageDone(1499))
     SetStage(1502)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by stage 1501 or 1502 to perform general post-battle cleanup. Should not be set directly.

;Disable Complex Scene mode.
DLC01LairFC_MechanistBattleComplexSceneMarker.DisableNoWait()

;Stop the music override and clean up after the fight.
kMyQuest.MBattle_Phase3_End()

;DLC01MQ05 should display its post-battle objective to take control of the facility.
if (!GetStageDone(2000))
     DLC01MQ05.SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1501_Item_00
Function Fragment_Stage_1501_Item_00()
;BEGIN CODE
;Let DLC01MQ05 know the Mechanist survived the quest.
DLC01MQ05.SetStage(685)

;Remove the Mechanist's name override.
SetStage(1510)

;Give the player the Master Control Password.
Game.GetPlayer().AddItem(DLC01LairCC_MasterControlPassword)

;Make Sparks immune to Robotics Expert again.
Alias_Sparks.GetActorRef().AddKeyword(PerkRoboticsExpertImmune)

;The Mechanist Battle has ended. Do any general cleanup.
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1502_Item_00
Function Fragment_Stage_1502_Item_00()
;BEGIN CODE
;Let DLC01MQ05 know the Mechanist died.
DLC01MQ05.SetStage(680)

;The Mechanist Battle has ended. Do any general cleanup.
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
;No longer renaming the Mechanist at this point. Moved to Stage 2000.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
Quest __temp = self as Quest
DLC01:DLC01LairQuestScript kmyQuest = __temp as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
;---Final Postquest Cleanup---
;Set when the player uses the Master Control Terminal to end the lockdown.
Actor player = Game.GetPlayer()
Actor MechanistRef = Alias_Mechanist.GetActorRef()

;---GENERAL---
;Reopen all the Mechanist Doors in the dungeon.
DLC01LairCC_MechDoor07Control.ForceBlinking = False
kMyQuest.SetAllMechanistDoorStates("GreenOn")

;Play the Reward music.
MUSReward.Add()

;---ENTRANCE---
;Decon Hall - Disable the laser grid.
kMyQuest.DisableDeconHallLasers(0)

;Decon Hall - Unlock the elevator terminal.
DLC01Lair_ENT_DeconElevatorTerminalRef.Unlock()


;---RESEARCH WING---
;Remove the Research Wing Robobrain from its alias so corpse cleanup can remove it.
DLC01LairJB_RoboMedAlias.Clear()


;---FACILITY CHAMBER---
;Restore the power.
DLC01AMBMechanistLairPowerUp.Play(DLC01LairFC_AudioSource)
DLC01FC_LightsEmergency.DisableNoWait()
DLC01FC_LightsPerimeter.EnableNoWait()
DLC01FC_LightsNormal01.DisableNoWait()
DLC01FC_LightsNormal02.DisableNoWait()
DLC01FC_LightsNormal03.EnableNoWait()
DLC01FC_WestConstructionLightOff.DisableNoWait()
DLC01FC_MechanistDialogueLighting_White.DisableNoWait()
DLC01FC_MechanistDialogueLighting_Red.DisableNoWait()

;Give the player ownership of the Generator and Spotlights.
DLC01Lair_SpotlightGenerator.SetActorOwner(player.GetActorBase())
int i = 0
While (i < Alias_DLC01Lair_Spotlights.GetCount())
     Actor spotlight = Alias_DLC01Lair_Spotlights.GetAt(i) as Actor
     if (spotlight != None)
          spotlight.SetEssential(True)
          spotlight.SetActorOwner(player.GetActorBase())
          spotlight.RemoveFromFaction(DLC01MechanistFaction)
          spotlight.RemoveFromFaction(DLC01MechBotFaction)
          spotlight.AddToFaction(PlayerFaction)
     EndIf
     i = i + 1
EndWhile

;Make sure Complex Scene mode is disabled.
DLC01LairFC_MechanistBattleComplexSceneMarker.DisableNoWait()

;Make sure the collision prim blocking the Facility Chamber's Mechanist Doors is disabled.
DLC01LairFC_MechDoorSupplementalCollision.DisableNoWait()

;Open the Control Center security doors.
DLC01LairCC_LeftDoor.SetOpenNoWait(True)
DLC01LairCC_RightDoor.SetOpenNoWait(True)

;Open the Facility Chamber's security doors.
DLC01LairFC_ExitDoor.SetOpenNoWait(True)
DLC01LairFC_RobobrainWingSecurityDoor.SetOpenNoWait(True)
DLC01LairFC_ProductionWingSecurityDoor.SetOpenNoWait(True)
DLC01LairFC_ControlCenterCatwalkSecurityDoor.SetOpenNoWait(True)

;Extend the ramp.
DLC01LairCC_Ramp.SetOpenNoWait()
DLC01LairCC_RampCollisionEnableMarker.EnableNoWait()

;Open the Blast Shield.
DLC01LairCC_BlastShield.SetOpenNoWait()

;Unlock the Exit garage door.
DLC01LairExit_GarageDoor.Unlock()

;De-Ghost and kill the Protectrons in Pods, in case they survived.
i = 0
While (i < Alias_MBattle_P1_Protectrons_Group1.GetCount())
     Actor a = Alias_MBattle_P1_Protectrons_Group1.GetAt(i) as Actor
     a.SetGhost(False)
     a.Kill()
     i = i + 1
EndWhile
i = 0
While (i < Alias_MBattle_P1_Protectrons_Group2.GetCount())
     Actor a = Alias_MBattle_P1_Protectrons_Group2.GetAt(i) as Actor
     a.SetGhost(False)
     a.Kill()
     i = i + 1
EndWhile

;Remove all of the Mechanist Battle Phase 1 Eyebots from their ref collection so corpse cleanup
;will clean them up normally.
Alias_MBattle_P1_Eyebots.RemoveAll()

;Stop all tracks.
DLC01FC_Dispatcher.StopAllTracks()

;Swap the moving lift platforms for static ones that can be built on.
DLC01FC_StaticLiftPlatformEnableMarker.EnableNoWait()

;---CONTROL CENTER---
;Swap the Mechanist into her postquest outfit.
if (!MechanistRef.IsDead())
     ;Remove the Mechanist's name override, changing her from 'The Mechanist' to 'Isabel Cruz'.
     Alias_Mechanist_NameOverride.Clear()

     if (MechanistRef.GetItemCount(DLC01_ClothesMechanistArmor) > 0)
          MechanistRef.AddItem(DLC01_ClothesMechanistArmor, 1)
     EndIf
     if (MechanistRef.GetItemCount(DLC01_ClothesMechanistHelmet) > 0)
          MechanistRef.AddItem(DLC01_ClothesMechanistHelmet, 1)
     EndIf
     MechanistRef.SetOutfit(DLC01MechanistOutfitJumpsuit)
EndIf

;Make Sparks immune to Robotics Expert again.
Alias_Sparks.GetActorRef().AddKeyword(PerkRoboticsExpertImmune)

;Restart the Robobrain Typists
i = 0
While (i < Alias_DLC01Lair_RoboTypists.GetCount())
     Alias_DLC01Lair_RoboTypists.GetAt(i).PlayAnimation("StartAnim")
     i = i + 1
EndWhile

;Restart the Console Panels.
DLC01CC_LitConsolePanels.EnableNoWait()

;Release the lockdown on the elevator.
DLC01LairCC_Elevator.MakeElevatorFunctional()


;---GENERAL, Part 2---
;Give the player ownership of the workbench.
;This has to be done before Clearing the location, since SetOwnedByPlayer calls SetCleared(False),
;which bashes our SetCleared(True) call.
DLC01LairWorkshop_Workbench.SetOwnedByPlayer(True)

;Flag the Mechanist's Lair and RobCo Store as cleared.
Alias_DLC01LairLocation.GetLocation().SetCleared(True)
Alias_DLC01LairRobcoStoreLocation.GetLocation().SetCleared(True)

;Give the player the Map Marker to the Mechanist's Lair, and allow them to fast-travel to and from it.
DLC01LairMapMarkerRef02.Enable()
DLC01LairMapMarkerRef02.AddToMap(True)
DLC01Lair01.EnableFastTravel()

;Clear the Mechanist and Sparks aliases, so if they're dead, their corpses can be cleaned up.
Alias_Mechanist.Clear()
Alias_Mechanist_NameOverride.Clear()
Alias_Sparks.Clear()

;Update DLC01MQ05; the quest can now complete.
DLC01MQ05.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC01MechanistFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ObjectReference Property DLC01LairFC_DarkLightingEnableMarker Auto Const Mandatory

Sound Property DLC01AMBMechanistLairPowerDown Auto Const Mandatory

ObjectReference Property DLC01LairFC_AudioSource Auto Const Mandatory

Default2StateActivator Property DLC01LairCC_ExitDoor Auto Const Mandatory

Sound Property DLC01AMBMechanistLairPowerUp Auto Const Mandatory

ReferenceAlias Property Alias_Mechanist_NameOverride Auto Const Mandatory

ReferenceAlias Property Alias_Mechanist Auto Const Mandatory

ReferenceAlias Property Alias_Sparks Auto Const Mandatory

Quest Property DLC01MQ05 Auto Const Mandatory

ObjectReference Property DLC01LairCC_ControlCenterLightingEnableMarker Auto Const Mandatory

ObjectReference Property DLC01LairCC_AudioSource Auto Const Mandatory

Sound Property QSTArcJetLightsOnA Auto Const Mandatory

Default2StateActivator Property DLC01LairCC_RightDoor Auto Const Mandatory

Default2StateActivator Property DLC01LairCC_LeftDoor Auto Const Mandatory

ElevatorMasterScript Property DLC01LairCC_Elevator Auto Const Mandatory

LocationAlias Property Alias_DLC01LairLocation Auto Const Mandatory

ObjectReference Property DLC01Lair_MBattle_MechanistConfrontationMarker Auto Const Mandatory

ObjectReference Property DLC01Lair_MBattle_SparksConfrontationMarker Auto Const Mandatory

Quest Property DLC01MasterQuest Auto Const Mandatory

ObjectReference Property RobotSelfDestructerREF Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1280_JunkbotStart Auto Const Mandatory

RefCollectionAlias Property Alias_MBattle_P1_Protectrons Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1150_SelfDestructStart Auto Const Mandatory

Cell Property DLC01Lair01 Auto Const Mandatory

RefCollectionAlias Property Alias_MBattle_P1_RobotsAll Auto Const

Scene Property DLC01Lair_MBattle_1200_Intro Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1230_Warning Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1120_P1_Group2Start Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1130_P1_Group3Start Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1150_SelfDestructStart2 Auto Const Mandatory

Scene Property DLC01Lair_Mbattle_1220_Warning Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1240_Warning Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1290_JunkbotFinalCountdown Auto Const Mandatory

Default2StateActivator Property DLC01LairFC_ExitDoor Auto Const Mandatory

ObjectReference Property DLC01_EyebotPipeSpawnPoint Auto Const Mandatory

EncounterZone Property DLC01LairZone Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_MechanistEyebot01 Auto Const Mandatory

ObjectReference Property DLC01LairMapMarkerRef02 Auto Const Mandatory

Keyword Property DLC01CanOpenMechanistDoorsKeyword Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_EntranceAccessPort Auto Const Mandatory

DLC01:DLC01Lair_SecurityDoorLightScript Property DLC01LairENT_SecurityDoorLight01 Auto Const Mandatory

ObjectReference Property DLC01LairENT_SecurityDoor01 Auto Const Mandatory

DLC01:DLC01_MechanistDoorControlScript Property DLC01LairENT_OverlookAccessPort Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_DeconHallProtectrons Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_OverlookProtectrons Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ActorValue Property ProtectronPodStatus Auto Const Mandatory

Scene Property DLC01Lair_ENT_SecurityDoorScene Auto Const Mandatory

Default2StateActivator Property DLC01LairENT_DeconHallExitDoor Auto Const Mandatory

Scene Property DLC01Lair_ENT_DeconHall_Initial Auto Const Mandatory

Scene Property DLC01Lair_ENT_DeconHall_IntruderDetected Auto Const Mandatory

Scene Property DLC01Lair_ENT_DeconHall_IntruderDefeatedSecurity Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_DeconHallTurrets Auto Const Mandatory

ObjectReference Property DLC01LairCC_Elevator_UpperCallButton Auto Const Mandatory

ObjectReference Property DLC01LairExit_GarageDoor Auto Const Mandatory

Default2StateActivator Property DLC01LairFC_RobobrainWingSecurityDoor Auto Const Mandatory

Default2StateActivator Property DLC01LairFC_ControlCenterCatwalkSecurityDoor Auto Const Mandatory

Default2StateActivator Property DLC01LairFC_ProductionWingSecurityDoor Auto Const Mandatory

DLC01:DLC01_MechanistDoorControlScript Property DLC01LairCC_MechDoor07Control Auto Const Mandatory

Scene Property DLC01Lair_Bypass_VoiceprintAcknowledged Auto Const Mandatory

ObjectReference Property DLC01LairENT_DeconHallTriggerRef Auto Const Mandatory

Quest Property DLC01MQ01 Auto Const Mandatory

Quest Property DLC01MQ02 Auto Const Mandatory

Quest Property DLC01MQ04 Auto Const Mandatory

ObjectReference Property DLC01Lair01_QuickstartEntranceMarker Auto Const Mandatory

ObjectReference Property DLC01Lair01_QuickstartFacilityEntranceMarker Auto Const Mandatory

ObjectReference Property DLC01Lair01_QuickstartProductionEntranceMarker Auto Const Mandatory

ObjectReference Property DLC01LairENT_EyebotConfrontation1TriggerRef Auto Const Mandatory

ObjectReference Property DLC01Lair01_QuickstartBypassMarker Auto Const Mandatory

ObjectReference Property DLC01Lair_QuickstartMechanistBattle Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_VoiceprintHolotape_Research Auto Const Mandatory

ObjectReference Property DLC01Lair_ENT_DeconElevatorTerminalRef Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_VoiceprintHolotape_Facilities Auto Const Mandatory

Armor Property ClothesGenericJumpsuit Auto Const

GlobalVariable Property DLC01Lair_VoiceprintCount Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_VoiceprintHolotape_Production Auto Const Mandatory

ObjectReference Property DLC01Lair_MBattle_SparkRestorePowerPoint Auto Const Mandatory

Key Property DLC01LairCC_MasterControlPassword Auto Const Mandatory

Armor Property DLC01_ClothesMechanistArmor Auto Const Mandatory

Armor Property DLC01_ClothesMechanistHelmet Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_MechanistEyebot02 Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Lair_MechanistEyebot03 Auto Const Mandatory

DLC01:DLC01_EyebotPipeScript Property DLC01LairUtility_EyebotPipe02 Auto Const Mandatory

DLC01:DLC01_EyebotPipeScript Property DLC01LairUtility_EyebotPipe03 Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_DungeonRobots Auto Const Mandatory

WorkshopScript Property DLC01LairWorkshop_Workbench Auto Const Mandatory

Default2StateActivator Property DLC01LairCC_Ramp Auto Const Mandatory

Default2StateActivator Property DLC01LairCC_BlastShield Auto Const Mandatory

ObjectReference Property DLC01LairCC_RampCollision Auto Const Mandatory

ObjectReference Property DLC01LairCC_RampCollisionEnableMarker Auto Const

RefCollectionAlias Property Alias_MBattle_P1_Protectrons_Group1 Auto Const Mandatory

RefCollectionAlias Property Alias_MBattle_P1_Protectrons_Group2 Auto Const Mandatory

ActorBase Property DLC01LvlMechEyeBot_NonHostileNoRadio Auto Const Mandatory

Sound Property DLC01OBJLightSwitchActivate Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_RoboTypists Auto Const Mandatory

ObjectReference Property DLC01CC_LitConsolePanels Auto Const Mandatory

DLC01:DLC01Lair_Dispatcher Property DLC01FC_Dispatcher Auto Const Mandatory

ObjectReference Property DLC01FC_LightsPerimeter Auto Const Mandatory

ObjectReference Property DLC01FC_LightsNormal01 Auto Const Mandatory

ObjectReference Property DLC01FC_LightsNormal02 Auto Const Mandatory

ObjectReference Property DLC01FC_LightsNormal03 Auto Const Mandatory

ObjectReference Property DLC01FC_LightsEmergency Auto Const Mandatory

Sound Property QSTArcJetLightsOnB Auto Const Mandatory

ObjectReference Property DLC01FC_SpotlightTrigger Auto Const Mandatory

Sound Property OBJSwitchButton Auto Const Mandatory

Outfit Property DLC01MechanistOutfitJumpsuit Auto Const Mandatory

ObjectReference Property DLC01Lair_LairBlackplaneEnableMarker Auto Const Mandatory

MusicType Property MUSReveal Auto Const Mandatory

MusicType Property MUSReward Auto Const Mandatory

MusicType Property MUSDread Auto Const Mandatory

ObjectReference Property DLC01LairFC_MechanistBattleComplexSceneMarker Auto Const Mandatory

Keyword Property PerkRoboticsExpertImmune Auto Const Mandatory

ObjectReference Property DLC01FC_StaticLiftPlatformEnableMarker Auto Const Mandatory

ObjectReference Property DLC01LairFC_MechDoorSupplementalCollision Auto Const Mandatory

LocationAlias Property Alias_DLC01LairRobcoStoreLocation Auto Const Mandatory

Scene Property DLC01Lair_MBattle_1300_MechanistEmerges_Part1 Auto Const Mandatory

Default2StateActivator Property DLC01LairENT_DeconHallEntryDoor Auto Const Mandatory

DLC01:DLC01_EyebotPipeScript Property DLC01LairEntrance_EyebotPipe01 Auto Const Mandatory

MusicType Property MUSStingerShort Auto Const Mandatory

WorkshopObjectScript Property DLC01Lair_SpotlightGenerator Auto Const Mandatory

RefCollectionAlias Property Alias_DLC01Lair_Spotlights Auto Const Mandatory

ObjectReference Property DLC01FC_WestConstructionLightOff Auto Const Mandatory

ObjectReference Property DLC01FC_MechanistDialogueLighting_White Auto Const Mandatory

ObjectReference Property DLC01FC_MechanistDialogueLighting_Red Auto Const Mandatory

Faction Property DLC01MechBotFaction Auto Const Mandatory

Scene Property DLC01Lair_ENT_DeconHall_DeactivateViaArches Auto Const Mandatory

ReferenceAlias Property DLC01LairJB_RoboMedAlias Auto Const Mandatory

RefCollectionAlias Property Alias_MBattle_P1_Eyebots Auto Const Mandatory
