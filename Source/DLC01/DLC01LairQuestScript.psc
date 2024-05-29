Scriptname DLC01:DLC01LairQuestScript extends Quest Hidden Conditional
{Quest Script for DLC01Lair, the quest that manages the Mechanist's Lair dungeon and boss battle.}
;
;This quest starts OnLocationChanged or when by a stage on DLC01MQ05. It does not shut down, since
;it has to handle some ongoing scenes and events (such as the player attacking the Mechanist
;post-quest).


;------------------------
;Quest Startup & Cleanup
;------------------------

Group Startup_Properties
	ReferenceAlias property Alias_Mechanist Auto Const Mandatory
	{The Mechanist}

	ReferenceAlias property Alias_Sparks Auto Const Mandatory
	{Sparks}

	RefCollectionAlias property Alias_DLC01Lair_DungeonRobots Auto Const Mandatory
	{All robots in the dungeon, excluding those used in the Mechanist Fight.}

	RefCollectionAlias property Alias_DLC01Lair_DungeonTracks Auto Const Mandatory
	{All tracks in the dungeon, excluding those used in the Mechanist Fight.}

	bool property QuickstartBypassActive Auto Hidden
	{Used by the quest fragment's quickstart stages, to signal we're running a quickstart.}
EndGroup

;Local refs. These get cleaned up, if possible, at the end of the Mechanist fight.
Actor player 									;The Player
Actor Mechanist 								;The Mechanist.
Actor Sparks 									;Sparks, the Mechanist's eyebot.


;Called by DLC01Lair Stage 10 (the quest's startup stage).
Function Startup()
	;Store local refs.
	player = Game.GetPlayer()
	Mechanist = Alias_Mechanist.GetActorRef()
	Sparks = Alias_Sparks.GetActorRef()

	;Initialize the Decon Hall event.
	InitializeDeconHall()

	;Register for events this script is responsible for handling.
	Self.RegisterForRemoteEvent(DLC01LairENT_EyebotConfrontation1TriggerRef, "OnTriggerEnter")
	Self.RegisterForRemoteEvent(Mechanist, "OnCombatStateChanged")
EndFunction


;Called by DLC01Lair Stage 950 or 1050, when the player has committed to the Mechanist Fight
;(normal or bypass), to clean up the rest of the dungeon before the fight occurs.
Function CleanupDungeonNoWait()
	StartTimer(0, CONST_CleanupDungeonTimerID)
EndFunction

Function CleanupDungeon()
	;Kill all of the robots in the dungeon (other than those in the Mechanist Fight).
	;
	;We start with the end of the collection and work backwards, because robots
	;are removed from these RefCollectionAliases as they die. If we started at 0,
	;depending on timing, these removals can cause some robots to be missed.
	int i = Alias_DLC01Lair_DungeonRobots.GetCount()
	While (i >= 0)
	     Actor a = Alias_DLC01Lair_DungeonRobots.GetAt(i) as Actor
	     if (a != None)
	          a.Kill()
	     EndIf
	     i = i - 1
	EndWhile
	Alias_DLC01Lair_DungeonRobots.RemoveAll()

	;Stop all tracks in the dungeon (other than those in the Facility Chamber).
	i = 0
	While (i < Alias_DLC01Lair_DungeonTracks.GetCount())
	     DLC01:DLC01_TrackSystemTrack t = Alias_DLC01Lair_DungeonTracks.GetAt(i) as DLC01:DLC01_TrackSystemTrack
	     if (t != None)
	          t.StopTrackNoWait()
	     EndIf
	     i = i + 1
	EndWhile
	Alias_DLC01Lair_DungeonTracks.RemoveAll()
EndFunction

;For cleanup done after the Mechanist Fight, see MBattle_Phase3_End().


;---------------------------------
;Dungeon Systems: Mechanist Doors
;---------------------------------
;
;All Mechanist Door Controls (DLC01_MechanistDoorControlScript) in the dungeon register for
;the SetMechanistDoorControlState event, allowing this function to open or close all the doors
;in the dungeon simultaneously on demand.
CustomEvent SetMechanistDoorControlState

Function SetAllMechanistDoorStates(String newState)
	Var[] args = new Var[1]
	args[0] = newState
	SendCustomEvent("SetMechanistDoorControlState", args)
EndFunction


;----------------------------
;Event Scripting: Decon Hall
;----------------------------
;Scripting for the Decontamination Hall and its laser grid trap.

Group DeconHall_Properties
	RefCollectionAlias property DLC01Lair_DeconHallLaserTripwires Auto Const Mandatory
	{RefCollectionAlias of Decon Hall tripwires.}

	Default2StateActivator property DLC01LairENT_DeconArch01 Auto Const Mandatory
	{First arch in the chain of Decon Hall arches.}

	ObjectReference property DLC01LairENT_DeconHallTriggerRef Auto Const Mandatory
	{Trigger volume that fills the hall. If the player is in the trigger, the doors can be shut on them.}

	ObjectReference property DLC01LairENT_DeconArchHazard01 Auto Const Mandatory
	{First hazard in the chain of Decon Hall hazards.}

	ObjectReference property DLC01LairENT_DeconHallEntryDoor Auto Const Mandatory
	{First door in the chain of Decon Hall doors.}

	bool property DeconHallArchesActive Auto Hidden Conditional
	{Conditional property: Are the arches active?}

	bool property DeconHallLaserGridActive = True Auto Hidden Conditional
	{Conditional property: Is the laser grid active?}
EndGroup

;All of the Decon Hall Tripwires register for the DisableTripwiresEvent, allowing
;DisableDeconHallLasers, below, to disable them all quickly on demand.
CustomEvent DLC01LairENT_DisableTripwiresEvent


;On startup, initialize the tripwires in the Decontamination Hall.
Function InitializeDeconHall()
	int i = 0
	int count = DLC01Lair_DeconHallLaserTripwires.GetCount()
	While (i < count)
		(DLC01Lair_DeconHallLaserTripwires.GetAt(i) as DLC01Lair_LaserTripwireScript).InitializeTripwire()
		i = i + 1
	EndWhile
EndFunction

;When requested by the quest or terminal scripts, enable or disable the decon arches.
Function SetDeconHallArchState(bool shouldEnable)
	DeconHallArchesActive = shouldEnable
	Default2StateActivator[] arches = DLC01LairENT_DeconArch01.GetLinkedRefChain() as Default2StateActivator[]
	arches.Insert(DLC01LairENT_DeconArch01, 0)
	int i = 0
	While (i < arches.Length)
	     arches[i].SetOpenNoWait(shouldEnable)
	     arches[i].isAnimating = True
	     i = i + 1
	EndWhile
	ObjectReference[] hazards = DLC01LairENT_DeconArchHazard01.GetLinkedRefChain()
	hazards.Insert(DLC01LairENT_DeconArchHazard01, 0)
	i = 0
	While (i < hazards.Length)
		if (shouldEnable)
	     	hazards[i].EnableNoWait()
	     Else
	     	hazards[i].DisableNoWait()
	     EndIf
	     i = i + 1
	EndWhile	
	if ((shouldEnable) && (!Self.GetStageDone(230)))
		Self.SetStage(230)
		DisableDeconHallLasers(2)
	EndIf
EndFunction

;When requested by the quest or terminal scripts, enable or disable the decon hall lasers.
Function DisableDeconHallLasers(float additionalDelay)
	DeconHallLaserGridActive = False
	Var[] args = new Var[1]
	args[0] = additionalDelay
	SendCustomEvent("DLC01LairENT_DisableTripwiresEvent", args)
EndFunction

;Timer event for the Decontamination Hall. This is a failsafe; if the player
;somehow manages to leave the hall while the event is ongoing (uses Jet to slip through
;the doors before they close, etc.), reopen the doors to avoid creating a progression blocker.
Function MonitorDeconHallTrigger()
	if (DLC01LairENT_DeconHallTriggerRef.GetTriggerObjectCount() == 0)
		if (DLC01LairENT_DeconHallEntryDoor.GetState() != "Busy")
			SetStage(222)
		EndIf
	EndIf
	if (!GetStageDone(222) && !GetStageDone(223) && !GetStageDone(229))
		StartTimer(1, CONST_ENT_DeconHallDoorMonitorTimerID)
	EndIf
EndFunction


;----------------------------------------
;Event Scripting: Eyebot Confrontation 1
;----------------------------------------
;Scripting for the first Eyebot Confrontation, just beyond the Decon Hall.
;
;When the player enters the trigger for this event, make sure they're not in combat (they
;often are, with the robots or turrets from the Decon Hall). If they are, start a timer
;and wait until combat ends before continuing.

Group EyebotConfrontation_Properties
	ObjectReference property DLC01LairENT_EyebotConfrontation1TriggerRef Auto Const Mandatory
	{Trigger for the Eyebot Confrontation.}

	ObjectReference property DLC01LairENT_EyebotConfrontation1LOSRef Auto Const Mandatory
	{Marker ref used to check LoS before spawning the Eyebot.}

	ActorValue property Aggression Auto Const Mandatory
	{Aggression AV.}

	ActorValue property ProtectronPodStatus Auto Const Mandatory
	{Protectron Pod Status AV.}

	ObjectReference property DLC01_ActivationDummy Auto Const Mandatory
	{Dummy marker used with Activate events in the dungeon.}

	Keyword property PerkRoboticsExpertImmune Auto Const Mandatory
	{Keyword that makes actors immune to the Robotics Expert Perk.}
EndGroup

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
	StartEyebotConfrontation1()
EndEvent

Function StartEyebotConfrontation1()
	if ((!player.IsInCombat()) && (DLC01LairENT_EyebotConfrontation1TriggerRef.GetTriggerObjectCount() > 0) && \
		(!player.HasDetectionLOS(DLC01LairENT_EyebotConfrontation1LOSRef)))
		Self.SetStage(280)
	Else
		StartTimer(2, CONST_ENT_EyebotConfrontation1TimerID)
	EndIf
EndFunction

Function PlayerEnteredEyebotTrigger1()
	StartTimer(0, CONST_ENT_EyebotConfrontation1TimerID)
EndFunction


;Activate a Protectron, forcing it to exit its pod if it was in one.
Function ActivateProtectron(ObjectReference obj, int newAggression=2)
	ProtectronScript p = (obj as ProtectronScript)
	if (p != None)
		p.Busy = True
		p.SetValue(ProtectronPodStatus, 1)
		p.SetValue(Aggression, newAggression)
		p.RemoveKeyword(PerkRoboticsExpertImmune)
		p.Activate(DLC01_ActivationDummy)
		p.SetGhost(False)
		p.EvaluatePackage()
	EndIf
EndFunction


;-----------------------------------
;Event Scripting: Voiceprint Bypass
;-----------------------------------
;Scripting for the Voiceprint Bypass system, where the player can use holotapes found
;in the dungeon to skip the Mechanist fight.

Group VoiceprintBypass_Properties
	ObjectReference property DLC01LairENT_VoiceprintTriggerRef Auto Const Mandatory
	{If the player is in this trigger, playing the holotapes on their PipBoy will register the voiceprint.}

	ObjectReference property DLC01LairENT_ElevatorAccessTerminalRef Auto Const Mandatory
	{If the holotape is in this terminal, playing it will register the voiceprint.}
EndGroup

;The holotape scenes call this function when played. If played while in the specified
;trigger or while in the specified terminal, set the associated stage to register the voiceprint.
Function VoiceprintHolotapePlayed(ObjectReference myHolotape, int myStageToSet)
	if (GetStageDone(910) && !(GetStageDone(2000)) && \
		((myHolotape.GetContainer() == DLC01LairENT_ElevatorAccessTerminalRef) || \
		 ((myHolotape.GetContainer() == Game.GetPlayer()) && \
		 	(DLC01LairENT_VoiceprintTriggerRef.GetTriggerObjectCount() > 0))))
		Self.SetStage(myStageToSet)
	EndIf
EndFunction


;-------------------------------------------------------
;Event Scripting: Mechanist Confrontation 'Forcegreets'
;-------------------------------------------------------
;The Mechanist Confrontation scenes are 'Forcegreets', but don't work as package-based
;forcegreets. As a workaround, this script runs an OnDistanceLessThan check that
;force-starts the scene once the player is in range (and detection, etc., conditions are met).

Group MechanistConfrontation_Properties
	Quest property DLC01MQ05 Auto Const Mandatory
	{DLC01's MQ05}

	Scene property DLC01MQ05_850_MechanistMainConfrontation Auto Const Mandatory
	{Main Confrontation scene.}

	Scene property DLC01MQ05_850_MechanistSideConfrontation Auto Const Mandatory
	{Bypass Confrontation scene.}
EndGroup

;On request, register for the OnDistanceLessThan event.
Function StartMechanistDistanceCheck(float distance)
	if (distance == 0)
		if (GetStageDone(950))
			distance = 768
		Else
			distance = 300
		EndIf
	EndIf
	Self.RegisterForDistanceLessThanEvent(Mechanist, player, distance)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	if ((akObj1 == Mechanist) && (akObj2 == player) && (!DLC01MQ05.GetStageDone(205)))
		if (GetStageDone(950)) ;Bypass Scene
			if (player.IsDetectedBy(Mechanist) && Mechanist.HasDetectionLOS(player))
				DLC01MQ05_850_MechanistSideConfrontation.Start()
			ElseIf (Mechanist.Is3DLoaded())
				StartTimer(1, CONST_MechanistDistanceCheckTimerID)
			EndIf
		ElseIf (GetStageDone(1050) && Mechanist.HasDetectionLOS(player)) ;Standard Scene
			if (player.IsDetectedBy(Mechanist) && Mechanist.HasDetectionLOS(player))
				DLC01MQ05_850_MechanistMainConfrontation.Start()
			ElseIf (Mechanist.Is3DLoaded())
				StartTimer(1, CONST_MechanistDistanceCheckTimerID)
			EndIf
		EndIf
	EndIf
EndEvent


;------------------------------------------------------------------------
;Mechanist Battle: Overview
;------------------------------------------------------------------------
;The Mechanist Battle consists of several phases:
; Phase 1. Robots spawn via the Eyebot Pipes and Lifts.
; Phase 2. The track system is running. Robots use it as well as Pipes & Lifts.
; Emerge Phase. The scene in which the Mechanist emerges from the Control Room.
; Phase 3. The Mechanist and Sparks fight the player directly.
;
;Phases 1 & 2 consist of multiple waves. Each wave begins when a stage is set on
;the quest. The quest fragment script calls the corresponding function on this script,
;which uses the Dispatcher to send robots into the fight. This script also adds those
;robots to RefCollectionAliases with a MultiCounter script on them; when enough robots
;die off, a stage is set on the quest to begin the next wave.
;
;If the player used the Voiceprint Bypass and chooses to fight the Mechanist,
;the fight consists only of Phase 3.
;
;
;------------------------------------------
;Mechanist Battle Support & Test Functions
;------------------------------------------

Group MBattle_General_Properties
	;The Dispatcher object.
	DLC01:DLC01Lair_Dispatcher property Dispatcher Auto Const Mandatory

	;Robots spawned during the fight.
	ActorBase property DLC01LvlMechEyeBot Auto Const Mandatory
	ActorBase property DLC01LvlMechMrHandy Auto Const Mandatory
	ActorBase property DLC01LvlMechMrHandyMelee Auto Const Mandatory
	ActorBase property DLC01LvlMechProtectron Auto Const Mandatory
	ActorBase property DLC01LvlMechAssaultron Auto Const Mandatory

	ActorBase property DLC01MBattle_LvlMechSentryTurret Auto Const Mandatory
	ActorBase property DLC01MBattle_LvlMechSentryMelee Auto Const Mandatory

	ActorBase property DLC01MBattle_LvlMechTrashbot_Any Auto Const Mandatory
	ActorBase property DLC01MBattle_LvlMechTrashbot_Assaultron Auto Const Mandatory
	ActorBase property DLC01MBattle_LvlMechTrashbot_Handy01 Auto Const Mandatory
	ActorBase property DLC01MBattle_LvlMechTrashbot_Protectron Auto Const Mandatory

	;Standardized holding cell spawn points.
	ObjectReference property DLC01_EyebotPipeSpawnPoint Auto Const Mandatory
	ObjectReference property DLC01_LiftSpawnPoint Auto Const Mandatory
	ObjectReference property DLC01_TrackSystemSpawnPoint Auto Const Mandatory

	;Music Overrides.
	MusicType property MUSzDLC01CombatMechanistMinions Auto Const Mandatory
	MusicType property MUSzDLC01CombatMechanist Auto Const Mandatory

	;The dungeon's Encounter Zone.
	EncounterZone property DLC01LairZone Auto Const Mandatory

	;Conditional: The current phase of the fight (1-4, 4=Done)
	int property phase Auto Hidden Conditional
EndGroup

Group MBattle_Support_Properties
	;Properties for the Staged Interaction system.
	ActorValue property DLC01_StagedInteraction Auto Const

	;Properties used by the Intervention system.
	;Scenes played during Interventions.
	Scene property DLC01Lair_MBattle_DropTanks Auto Const
	Scene property DLC01Lair_MBattle_DropMines Auto Const
	Scene property DLC01Lair_MBattle_DropArcTraps Auto Const
	;Conditional: The number of times each Intervention has been used.
	int property TankInterventionCount Auto Hidden Conditional
	int property MineInterventionCount Auto Hidden Conditional
	int property ArcTrapInterventionCount Auto Hidden Conditional

	;Properties used by the TestTrack* test functions.
	Race property EyebotRace Auto Const
	Race property HandyRace Auto Const
	Race property ProtectronRace Auto Const
	Race property AssaultronRace Auto Const
	Activator property DLC01TrackSystem_TrapElectricArc Auto Const
	MovableStatic property DLC01TrackSystem_TrapMineMStatic Auto Const
	MovableStatic property DLC01TrackSystem_TrapTankMStatic Auto Const

	;Properties used for the Robotics Expert Response (handled via timer).
	Scene property DLC01Lair_MBattle_RoboticsExpertResponse Auto Const Mandatory
	ObjectReference property RobotSelfDestructerREF Auto Const Mandatory
	Keyword property perkRoboticsExpertLink Auto Const Mandatory
EndGroup

;Local variables.
Scene[] MBattleSceneQueue					;The Mechanist's scene queue. Initialized in Startup().
float CONST_MechanistInteractTime = 5.0 Const 	;Duration of the Mechanist's Staged Interactions.
float CONST_SparksInteractTime = 5.0 Const 		;Duration of Sporks' Staged Interactions.
int CONST_InterventionTimerDelay = 13 Const		;Delay between Mechanist Interventions.
bool hasPlayedRoboticsExpertResponseScene 		;Have we played DLC01Lair_MBattle_RoboticsExpertResponse?


;-Mechanist Scene Queue---------------------------------------------------
;During Phases 1 & 2, the Mechanist needs to play scenes in response to events,
;which sometimes trigger other events. We can't afford to miss anything, so
;rather than play scenes directly (and have a scene fail if the Mechanist is
;running a different scene), we queue them up and have a timer pull scenes
;whenever the Mechanist is free.

Function MBattle_EnqueueScene(Scene s)
	if (MBattleSceneQueue == None)
		MBattleSceneQueue = new Scene[0]
	EndIf
	MBattleSceneQueue.Add(s)
	StartTimer(0, CONST_MBattle_PlaySceneTimerID)
EndFunction

;Called by the OnTimer function. Tries to play the next scene in the queue, if any,
;if we're still in Phase 1 or 2 of the fight. Returns True if we want the timer to
;keep running, and False otherwise.
bool Function MBattle_PlayScene()
	if ((MBattleSceneQueue == None) || (MBattleSceneQueue.Length == 0) || GetStageDone(1291))
		return False
	EndIf

	if (!Mechanist.IsInScene() && !Sparks.IsInScene())
		Scene nextScene = MBattleSceneQueue[0]
		MBattleSceneQueue.Remove(0)
		nextScene.Start()
	EndIf
	return True
EndFunction


;-Mechanist Intevention System--------------------------------------------
;During Phase 2, on a timer, we periodically trigger Interventions.
;A scene plays, and then the tracks bring in Arc Traps, Mines, or Tanks.

Function StartInterventionTimer()
	StartTimer(CONST_InterventionTimerDelay, CONST_MBattle_InterventionTimerID)
EndFunction

;When the timer triggers, pick an intervention and queue up its scene.
Function SetupNextIntervention()
	int nextIntervention = Dispatcher.SetupIntervention()
	if (nextIntervention == 0)
		TankInterventionCount = TankInterventionCount + 1
		MBattle_EnqueueScene(DLC01Lair_MBattle_DropTanks)
	ElseIf (nextIntervention == 1)
		MineInterventionCount = MineInterventionCount + 1
		MBattle_EnqueueScene(DLC01Lair_MBattle_DropMines)
	Else
		ArcTrapInterventionCount = ArcTrapInterventionCount + 1
		MBattle_EnqueueScene(DLC01Lair_MBattle_DropArcTraps)
	EndIf
EndFunction

;When the scene finishes, trigger the preselected intervention.
;Once the Intervention has run its course, the Dispatcher resets the timer.
Function StartNextIntervention()
	Dispatcher.StartIntervention()
EndFunction


;-Mechanist Battle Interaction Settings-----------------------------------
;Functions to set and clear the StagedInteraction AV, which affects the Mechanist and Sparks' packages,
;causing them to interact with things in the Control Center.

Function StartMechanistInteract()
	Mechanist.SetValue(DLC01_StagedInteraction, 1)
	Mechanist.EvaluatePackage()
	StartTimer(CONST_MechanistInteractTime, CONST_MBattle_StopMechanistInteractionTimerID)
EndFunction

Function StopMechanistInteract()
	Mechanist.SetValue(DLC01_StagedInteraction, 0)
	Mechanist.EvaluatePackage()
EndFunction

Function StartSparksInteract()
	Sparks.SetValue(DLC01_StagedInteraction, 1)
	Sparks.EvaluatePackage()
	StartTimer(CONST_SparksInteractTime, CONST_MBattle_StopSparksInteractionTimerID)
EndFunction

Function StopSparksInteract()
	Sparks.SetValue(DLC01_StagedInteraction, 0)
	Sparks.EvaluatePackage()
EndFunction


;-Mechanist Battle Robot Spawner------------------------------------------
;Utility function for spawning robots during the fight and forcing them into
;one or more RefCollectionAliases.
Actor Function MBattle_SpawnRobot(ObjectReference mySpawnPoint, ActorBase myActorBase, \
	int myDifficulty, RefCollectionAlias myRefCollection1, RefCollectionAlias myRefCollection2=None)
	if ((mySpawnPoint != None) && (myActorBase != None) && (myRefCollection1 != None))
		Actor a = mySpawnPoint.PlaceActorAtMe(myActorBase, myDifficulty, DLC01LairZone)
		myRefCollection1.AddRef(a)
		if (myRefCollection2 != None)
			myRefCollection2.AddRef(a)
		EndIf
		return a
	Else
		Debug.Trace("MBattle_SpawnRobot received invalid arguments. " + mySpawnPoint + "," + myActorBase + "," + myRefCollection1)
		return None
	EndIf
EndFunction


;-Mechanist Battle Track System Test Functions----------------------------

;Track System Test Function - Spawns actors on Track 1.
Function TestTrack1Actors()
	Dispatcher.myObjectTracks[1].UpdateTrackSettingsNoWait(0, 7, 10, True, True)
	Dispatcher.DispatchActorToTrackIndex(1, DLC01LvlMechEyeBot, EyebotRace)
	Dispatcher.DispatchActorToTrackIndex(1, DLC01LvlMechMrHandyMelee, HandyRace)
	Dispatcher.DispatchActorToTrackIndex(1, DLC01LvlMechProtectron, ProtectronRace)
	Dispatcher.DispatchActorToTrackIndex(1, DLC01LvlMechAssaultron, AssaultronRace)
EndFunction

;Track System Test Function - Spawns traps on Track 1.
Function TestTrack1Traps()
	Dispatcher.myObjectTracks[1].UpdateTrackSettingsNoWait(0, 7, 10, True, True)
	Dispatcher.myObjectTracks[1].AddMachineConstructor(DLC01TrackSystem_TrapElectricArc)
	Dispatcher.myObjectTracks[1].AddMachineConstrutorIndex(DLC01TrackSystem_TrapMineMStatic, None)
	Dispatcher.myObjectTracks[1].AddMachineConstrutorIndex(DLC01TrackSystem_TrapTankMStatic, None)
EndFunction



;----------------------------------
;Mechanist Battle, Phase 1
;----------------------------------

Group MBattle_Phase1_Properties
	;Phase 1: Robot RefCollectionAliases.
	RefCollectionAlias property MBattle_P1_RobotsAll Auto Const Mandatory
	RefCollectionAlias property MBattle_P1_Protectrons_Group1 Auto Const Mandatory
	RefCollectionAlias property MBattle_P1_Protectrons_Group2 Auto Const Mandatory
	RefCollectionAlias property MBattle_P1_Sentry Auto Const
	RefCollectionAlias property MBattle_P1_Eyebots Auto Const

	;Phase 1: Preset array of Eyebot Spawn Points.
	int[] property MBattle_P1_EyebotSpawnPoints Auto Const
EndGroup

;Local properties.
int currentEyebotIndex		;Current index into MBattle_P1_EyebotSpawnPoints


;Start Phase 1.
Function MBattle_Phase1_Start()
	phase = 1

	;Add music override.
	MUSzDLC01CombatMechanistMinions.Add()

	;Start the Robotics Expert perk check timer. (Hacked robots self-destruct during the fight.)
	StartTimer(0, CONST_MBattle_CheckRoboticsExpertTimer)
EndFunction


;Phase 1, Wave 1:
; - 2 Protectrons in Pods
; - 2 Eyebots from Pipes
Function MBattle_Phase1_Dispatch1110()
	int i = 0
	While (i < MBattle_P1_Protectrons_Group1.GetCount())		
		ProtectronScript current = MBattle_P1_Protectrons_Group1.GetAt(i) as ProtectronScript
		if (current != None)
			MBattle_P1_RobotsAll.AddRef(current)
			ActivateProtectron(current)
			current.StartCombat(player)
		EndIf
		i = i + 1
	EndWhile

	Dispatcher.DispatchToPipe(1, MBattle_SpawnRobot(DLC01_EyebotPipeSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P1_RobotsAll))
	Utility.Wait(0.5)
	Dispatcher.DispatchToPipe(2, MBattle_SpawnRobot(DLC01_EyebotPipeSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P1_RobotsAll))
EndFunction


;Phase 1, Wave 2:
; - 2 Handys from Lifts
; - 2 Protectrons in Pods
Function MBattle_Phase1_Dispatch1120()
	Dispatcher.DispatchToLift(1, MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01LvlMechMrHandyMelee, 1, MBattle_P1_RobotsAll))
	Dispatcher.DispatchToLift(2, MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01LvlMechMrHandyMelee, 1, MBattle_P1_RobotsAll))
	Utility.Wait(2)

	int i = 0
	While (i < MBattle_P1_Protectrons_Group2.GetCount())		
		ProtectronScript current = MBattle_P1_Protectrons_Group2.GetAt(i) as ProtectronScript
		if (current != None)
			MBattle_P1_RobotsAll.AddRef(current)
			ActivateProtectron(current)
			current.StartCombat(player)
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Phase 1, Wave 3:
; - Unique Mechanist 'Turret' SentryBot
; - Eyebots from Pipes based on MBattle_P1_EyebotSpawnPoints.
Function MBattle_Phase1_Dispatch1130()
	Dispatcher.DispatchToLift(3, MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01MBattle_LvlMechSentryTurret, 2, MBattle_P1_RobotsAll, MBattle_P1_Sentry))

	;Spawn all of the Eyebots we're going to need now.
	int i = 0
	While (i < MBattle_P1_EyebotSpawnPoints.Length)
		Actor newEyebot = MBattle_SpawnRobot(DLC01_EyebotPipeSpawnPoint, DLC01LvlMechEyebot, 1, MBattle_P1_RobotsAll, MBattle_P1_Eyebots)
		Self.RegisterForRemoteEvent(newEyebot, "OnDeath")
		i = i + 1
	EndWhile

	;Then call the Activate function to send (some of) them into the space.
	MBattle_Phase1_Activate1130Eyebots(4)
EndFunction

;As Eyebots die, call the Activate function to send more into the space.
Event Actor.OnDeath(Actor akSource, Actor akKiller)
	if (MBattle_P1_Eyebots.Find(akSource) >= 0)
		MBattle_Phase1_Activate1130Eyebots()
	EndIf
EndEvent

;Dispatch the specified number of Eyebots into the room, to Eyebot Pipes in a predetermined order.
Function MBattle_Phase1_Activate1130Eyebots(int numToActivate = 1)
	int i = 0
	While ((i < numToActivate) && (currentEyebotIndex < MBattle_P1_EyebotSpawnPoints.Length) && (GetStage() < 1150))
		Dispatcher.DispatchToPipe(MBattle_P1_EyebotSpawnPoints[currentEyebotIndex], MBattle_P1_Eyebots.GetAt(currentEyebotIndex))
		currentEyebotIndex = currentEyebotIndex + 1
		i = i + 1
	EndWhile
EndFunction

;Stop the music override at the end of the phase.
Function MBattle_Phase1_End()
	MUSzDLC01CombatMechanistMinions.Remove()
EndFunction



;----------------------------------
;Mechanist Battle, Phase 2
;----------------------------------

Group MBattle_Phase2_Properties
	;Phase 2: Robot RefCollectionAliases.
	RefCollectionAlias property MBattle_P2_RobotsAll Auto Const Mandatory
	RefCollectionAlias property MBattle_P2_Sentry Auto Const Mandatory
	RefCollectionAlias property MBattle_Trashbots Auto Const Mandatory
EndGroup

;Local properties.
int MBattle_Trashbot_SpawnLimit = 6			;The maximum number of simultaneous Trashbots allowed.
int MBattle_Trashbot_SpawnCount				;Count of Trashbots that have spawned.
bool MBattle_P2_InterventionsActive = False 		;Are the Phase 2 Interventions active?


Function MBattle_Phase2_Start()
	phase = 2
	MUSzDLC01CombatMechanistMinions.Add()
EndFunction


;Start the tracks for the Phase 2 Intro Scene.
;Spawns an infinite number of No-Drop robots for the (strictly time-limited) scene. 
Function MBattle_Phase2_StartSceneTracks()
	;Push robots onto the track queues to create the spawn pattern we want.
	Dispatcher.DispatchActorToTrackNoDrop(1, None)
	Dispatcher.DispatchActorToTrackNoDrop(1, DLC01LvlMechAssaultron, AssaultronRace)
	Dispatcher.DispatchActorToTrackNoDrop(1, None)
	Dispatcher.DispatchActorToTrackNoDrop(1, DLC01LvlMechProtectron, ProtectronRace)

	Dispatcher.DispatchActorToTrackNoDrop(2, DLC01LvlMechProtectron, ProtectronRace)
	Dispatcher.DispatchActorToTrackNoDrop(2, None)

	Dispatcher.DispatchActorToTrackNoDrop(3, None)
	Dispatcher.DispatchActorToTrackNoDrop(3, DLC01LvlMechMrHandyMelee, HandyRace)

	Dispatcher.DispatchActorToTrackNoDrop(4, DLC01LvlMechProtectron, ProtectronRace)
	Dispatcher.DispatchActorToTrackNoDrop(4, DLC01LvlMechAssaultron, AssaultronRace)
	Dispatcher.DispatchActorToTrackNoDrop(4, None)	

	Dispatcher.DispatchActorToTrackNoDrop(5, DLC01LvlMechMrHandyMelee, HandyRace)
	Dispatcher.DispatchActorToTrackNoDrop(5, DLC01LvlMechProtectron, ProtectronRace)
	Dispatcher.DispatchActorToTrackNoDrop(5, None)
	Dispatcher.DispatchActorToTrackNoDrop(5, DLC01LvlMechProtectron, ProtectronRace)

	;Then fire up all of the tracks.
	Dispatcher.myObjectTracks[1].UpdateTrackSettingsNoWait(0, 9, 9, True, True)
	Dispatcher.myObjectTracks[2].UpdateTrackSettingsNoWait(1, 8, 10, True, True)
	Dispatcher.myObjectTracks[3].UpdateTrackSettingsNoWait(0, 9, 9, True, True)
	Dispatcher.myObjectTracks[4].UpdateTrackSettingsNoWait(1, 9, 9, True, True)
	Dispatcher.myObjectTracks[5].UpdateTrackSettingsNoWait(0, 8, 10, True, True)
	Dispatcher.myObjectTracks[6].UpdateTrackSettingsNoWait(0, 7, 11, True, True)
	Dispatcher.myObjectTracks[7].UpdateTrackSettingsNoWait(1, 7, 11, True, True)	
EndFunction

;Cut off the infinite spawning. The track queues now exhaust their contents and go
;back to spawning empty machines. (They continue to run.)
Function MBattle_Phase2_StopSceneTracks()
	Dispatcher.myObjectTracks[1].UpdateTrackSettingsNoWait(0, 9, 9, False, 1)
	Dispatcher.myObjectTracks[2].UpdateTrackSettingsNoWait(1, 8, 10, False, 1)
	Dispatcher.myObjectTracks[3].UpdateTrackSettingsNoWait(0, 9, 9, False, 1)
	Dispatcher.myObjectTracks[4].UpdateTrackSettingsNoWait(1, 9, 9, False, 1)
	Dispatcher.myObjectTracks[5].UpdateTrackSettingsNoWait(0, 8, 10, False, 1)
	Dispatcher.myObjectTracks[6].UpdateTrackSettingsNoWait(0, 7, 11, False, 0)
	Dispatcher.myObjectTracks[7].UpdateTrackSettingsNoWait(1, 7, 11, False, 0)	
EndFunction


;Phase 2, Wave 1:
; - 1 Assaultron, 2 Protectrons from Tracks.
Function MBattle_Phase2_Dispatch1210()
	Actor Assaultron1 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechAssaultron, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(1, Assaultron1, None, 1)

	Actor Protectron1 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechProtectron, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(3, Protectron1, None, 2)

	Actor Protectron2 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechProtectron, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(4, Protectron2, None, 2)

	;Start Phase 2's Interventions (see Support Functions, above).
	MBattle_P2_InterventionsActive = True
	StartInterventionTimer()
EndFunction

;Phase 2, Wave 2:
; - 2 Handys from Lifts
; - 2 Eyebots from Pipes
Function MBattle_Phase2_Dispatch1220()
	Actor Handy1 = MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01LvlMechMrHandyMelee, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchToLift(1, Handy1)

	Actor Handy2 = MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01LvlMechMrHandy, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchToLift(2, Handy2)

	Actor Eyebot1 = MBattle_SpawnRobot(DLC01_EyebotPipeSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchToPipe(3, Eyebot1)

	Actor Eyebot2 = MBattle_SpawnRobot(DLC01_EyebotPipeSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchToPipe(6, Eyebot2)
EndFunction

;Phase 2, Wave 3:
; - Unique Mechanist 'Melee' SentryBot
; - 4 Eyebots from Tracks
Function MBattle_Phase2_Dispatch1230()
	Actor SentryMelee = MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01MBattle_LvlMechSentryMelee, 1, MBattle_P2_RobotsAll, MBattle_P2_Sentry)
	Dispatcher.DispatchToLift(3, SentryMelee)

	Actor Eyebot1 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(3, Eyebot1, None, 4)

	Actor Eyebot2 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(4, Eyebot2, None, 4)

	Actor Eyebot3 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(1, Eyebot3, None, 3)

	Actor Eyebot4 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechEyeBot, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(1, Eyebot4, None, 1)
EndFunction

;Phase 2, Wave 4:
; - 1 Assaultron from Lift
; - 1 Protectron from Tracks
; - 2 Handys from Tracks
Function MBattle_Phase2_Dispatch1240()
	Actor Assaultron1 = MBattle_SpawnRobot(DLC01_LiftSpawnPoint, DLC01LvlMechAssaultron, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchToLift(2, Assaultron1)

	Actor Protectron1 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechProtectron, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToTrackIndex(5, Protectron1, None, 2)

	Actor Handy1 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechMrHandyMelee, 1, MBattle_P2_RobotsAll)
	Dispatcher.DispatchActorToNearestDropoffPoint(Handy1)

	Actor Handy2 = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01LvlMechMrHandyMelee, 1, MBattle_P2_RobotsAll) 
	Dispatcher.DispatchActorToNearestDropoffPoint(Handy2)
EndFunction


;Phase 2 Trashbots:
;An unlimited number of 1-2 hit kill robots. The Trashbot RefCollectionAlias is set to respawn
;using its own script (which dispatches the newly-respawned robot back out onto the tracks), so
;this script is responsible only for the initial spawn.
;
;After a fixed number of Trashbots are killed, the final countdown for the fight starts.
;When the countdown ends, the spawning stops and any remaining Trashbots are killed.

Function StartTrashbotAssault()
	;Speed up all of the tracks.
	Dispatcher.myObjectTracks[1].UpdateTrackSettingsNoWait(0, 7, 7, False, 1)
	Dispatcher.myObjectTracks[2].UpdateTrackSettingsNoWait(1, 6, 8, False, 1)
	Dispatcher.myObjectTracks[3].UpdateTrackSettingsNoWait(0, 7, 7, False, 1)
	Dispatcher.myObjectTracks[4].UpdateTrackSettingsNoWait(1, 7, 7, False, 1)
	Dispatcher.myObjectTracks[5].UpdateTrackSettingsNoWait(0, 6, 8, False, 1)
	Dispatcher.myObjectTracks[6].UpdateTrackSettingsNoWait(0, 6, 9, False, 0)
	Dispatcher.myObjectTracks[7].UpdateTrackSettingsNoWait(1, 6, 9, False, 0)	

	;Start the Trashbot Spawn timer.
	StartTimer(0, CONST_MBattle_TrashbotSpawnTimer)
EndFunction

;On timer, spawn another Trashbot until we've spawned MBattle_Trashbot_SpawnLimit.
;After that, stop; they take care of their own spawning.
bool Function SpawnNextTrashbot()
	if (MBattle_Trashbot_SpawnCount < MBattle_Trashbot_SpawnLimit)
		;Debug.Trace("Spawn Next Trashbot.")
		Actor a
		MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01MBattle_LvlMechTrashbot_Protectron, 0, MBattle_Trashbots) 

		if (MBattle_Trashbot_SpawnCount == 0)
			a = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01MBattle_LvlMechTrashbot_Protectron, 0, MBattle_Trashbots)
			Dispatcher.DispatchToLift(1, a)
		ElseIf (MBattle_Trashbot_SpawnCount == 1)
			a = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01MBattle_LvlMechTrashbot_Assaultron, 0, MBattle_Trashbots) 
			Dispatcher.DispatchActorToNearestDropoffPoint(a)
		ElseIf (MBattle_Trashbot_SpawnCount == 2)
			a = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01MBattle_LvlMechTrashbot_Handy01, 0, MBattle_Trashbots) 
			Dispatcher.DispatchToLift(3, a)
		Else
			a = MBattle_SpawnRobot(DLC01_TrackSystemSpawnPoint, DLC01MBattle_LvlMechTrashbot_Any, 0, MBattle_Trashbots) 
			Dispatcher.DispatchActorToNearestSpawner(a)
		EndIf
		MBattle_Trashbot_SpawnCount = MBattle_Trashbot_SpawnCount + 1
		;Debug.Trace("Incrementing spawn count. Now: " + MBattle_Trashbot_SpawnCount + ", Trashbots: " + MBattle_Trashbots.GetCount())
		return (MBattle_Trashbot_SpawnCount >= MBattle_Trashbot_SpawnLimit)
	Else
		return True
	EndIf
EndFunction


;Stop the Phase 2 Interventions when the Final Countdown begins.
Function StopPhase2Interventions()
	MBattle_P2_InterventionsActive = False
EndFunction


;When the power goes out, the fight stops.
Function MBattle_Phase2_End()
	;Stop the music override.
	MUSzDLC01CombatMechanistMinions.Remove()

	;Pause all tracks.
	Dispatcher.myObjectTracks[1].PauseTrack()
	Dispatcher.myObjectTracks[2].PauseTrack()
	Dispatcher.myObjectTracks[3].PauseTrack()
	Dispatcher.myObjectTracks[4].PauseTrack()
	Dispatcher.myObjectTracks[5].PauseTrack()
	Dispatcher.myObjectTracks[6].PauseTrack()
	Dispatcher.myObjectTracks[7].PauseTrack()
EndFunction



;----------------------------------
;Mechanist Battle, Emerge Phase
;----------------------------------
;
;A mid-battle scene in which the Mechanist emerges to face the player.

;Start a timer to kill any remaining robots from Phase 1 or 2, with a small delay between each kill.
Function KillPhase12RobotsNoWait()
	StartTimer(0, CONST_MBattle_KillRobotsTimerID)
EndFunction

Function KillPhase12Robots()
	;Temporarily stop removing dead actors from these collections.
	(MBattle_P1_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(False)
	(MBattle_P2_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(False)
	(MBattle_Trashbots as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(False)
	
	int i = 0
	int currentBatch = 0
	While (i < MBattle_P1_RobotsAll.GetCount())
		Actor next = MBattle_P1_RobotsAll.GetAt(i) as Actor
		if ((next != None) && (!next.IsDead()))
			currentBatch = EliminateRobot(next, currentBatch)
	     EndIf
	     i = i + 1
	EndWhile
	i = 0
	While (i < MBattle_P2_RobotsAll.GetCount())
		Actor next = MBattle_P2_RobotsAll.GetAt(i) as Actor
		if ((next != None) && (!next.IsDead()))
			currentBatch = EliminateRobot(next, currentBatch)
	     EndIf
	     i = i + 1
	EndWhile
	i = 0
	While (i < MBattle_Trashbots.GetCount())
		Actor next = MBattle_Trashbots.GetAt(i) as Actor
		if ((next != None) && (!next.IsDead()))
			currentBatch = EliminateRobot(next, currentBatch)
	     EndIf
	     i = i + 1
	EndWhile		
	
	;Resume removing dead actors from these collections.
	(MBattle_P1_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(True)
	(MBattle_P2_RobotsAll as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(True)
	(MBattle_Trashbots as DLC01:DLC01_MultiCounterAliasColIncOnDeath).SetRemoveWhenDead(True)

	Utility.Wait(2)
	SetStage(1305)
EndFunction

int Function EliminateRobot(Actor robot, int currentBatch)
	if ((!player.HasDetectionLOS(robot)) && (player.GetDistance(robot) > 512))
		robot.Disable()
		robot.Kill()
		return currentBatch
	Else
		robot.Kill()
		Utility.Wait(Utility.RandomFloat(0.1, 0.3))
		if (currentBatch >= 2)
			Utility.Wait(1.5)
			return 0
		Else
			return currentBatch + 1
		EndIf
	EndIf
EndFunction




;----------------------------------
;Mechanist Battle, Phase 3
;----------------------------------
;
;Phase 3 is the fight against the Mechanist and Sparks (her eyebot). Special systems here include:
; - The Mechanist is constantly in motion. This script sets and periodically changes her hold position
;   package target, keeping her on the move.
; - The Mechanist uses Stealth Boys. She'll use the one in her starting inventory almost immediately.
;   After she comes out of stealth, she remains visible for a few seconds, then this script gives her
;   another Stealth Boy to use. (Up to a max number of Stealth Boy uses.)
; - The Mechanist throws Pulse Grenades. No script involvement.
; - The Mechanist lays Pulse Mines. Since the Combat AI can't do this, this script takes care of
;   spawning them-- there's a time delay between mines, a minimum distance between mines (so they
;   don't become unmanageable for the player), and distance checks to make sure she's moving away
;   and the player isn't right on top of them when they drop.
; - Sparks has a shock cloak and an electric gun weapon. No script involvement.
; - Sparks becomes a suicider if the Mechanist dies before he does-- he switches to a hyper-aggressive
;   combat style with a Hold Position - Run package on the player (if the player is detected), and I
;   trigger the robot self destruct on him.
; - The Mechanist and Sparks are immune or highly resistant to each other's area of effect attacks
;   (mines, grenades, electric hazards, electric cloak, etc.).
;
;There's a variant version of this fight. If the player solves the Voiceprint Bypass puzzle in the dungeon
;and confronts the Mechanist in the Control Chamber, I omit the Hold Position movement behavior, since she
;can't run out into the main room. This makes the fight significantly easier.

Group  MBattle_Phase3_Properties
	ReferenceAlias property MBattle_MechanistHoldPositionCurrentTarget Auto Const Mandatory
	{The Mechanist's current Hold Position Target marker. Used as a package target.}

	RefCollectionAlias property Alias_MBattle_MechanistHoldPositionTargets Auto Const Mandatory
	{Collection of potential Hold Position Target markers.}

	Faction property DLC01MechanistFaction Auto Const Mandatory
	{The Mechanist's faction.}

	ActorValue property Health Auto Const Mandatory
	{Health AV}

	ActorValue property Invisibility Auto Const Mandatory
	{Invisibility AV}

	Potion property StealthBoy Auto Const Mandatory
	{Stealth Boy}

	Projectile property PulseMineProjectile Auto Const Mandatory
	{Mechanist's Pulse Mines}

	ObjectReference property DLC01_MechanistMineSpawnPoint Auto Const Mandatory
	{Initial spawn point for the Mechanist's Pulse Mines.}
EndGroup


;Local properties for this phase.
int CONST_MBattle_Mechanist_TimerDuration = 2 Const			;Length of the timer used to poll the Mechanist's Position, Stealth, and Mine abilities.

float CONST_MBattle_Mechanist_HoldPositionDelay = 16.0	Const;Delay between choosing new Hold Position targets.
float MBattle_Mechanist_HoldPositionTimestamp			;Time the Mechanist last changed her Hold Position target.
ObjectReference MechanistHoldPositionCurrentTarget 		;The Mechanist's current Hold Position Target (if any).

float CONST_MBattle_Mechanist_StealthDelay = 8.0	Const	;After a Stealth Boy expires, the time to remain visible before using another.
int CONST_MBattle_Mechanist_StealthBoyUsesMax = 3	Const	;Max number of Stealth Boys the Mechanist can use (counts the one in her inventory).
float MBattle_Mechanist_EndedStealthTimestamp			;Time the Mechanist last dropped out of stealth.
int MBattle_Mechanist_StealthBoysUsed 					;Number of stealth boys that have been used.
int MBattle_Mechanist_InvisibilityState = 1 				;O=Waiting to be given Stealth Boy, 1=Waiting for Use, 2=Used and Invisible. [The Mechanist starts with one.]

float CONST_MBattle_Mechanist_LayMineDelay = 12.0	Const	;Minimum delay between laying mines.
float MBattle_Mechanist_LayMineTimestamp				;Time the Mechanist last laid a mine.
float CONST_MBattle_Mechanist_LayMineDistance = 550.0 Const	;Minimum distance between a potential new mine and the player, the Mechanist's hold position target, and all previously-laid undetonated mines.
int CONST_MBattle_Mechanist_MinesLaidMax = 6	Const		;Max number of mines the Mechanist will lay.
int MBattle_Mechanist_MinesLaid 						;Current number of mines the Mechanist has laid.
ObjectReference[] MechanistLaidMines 					;Array of mines previously laid by the Mechanist.


;Phase 3 begins when one of the combat stages are set, or if the Mechanist enters combat with the player.
Event Actor.OnCombatStateChanged(Actor akSource, Actor akTarget, int aeCombatState)
	;Debug.Trace("OnCombatStateChanged " + Mechanist.IsHostileToActor(player))
	if ((akSource == Mechanist) && (aeCombatState == 1) && (Mechanist.IsHostileToActor(player)))
		StartCombatWithMechanist()
	EndIf
EndEvent

Function StartCombatWithMechanist()
	;We're now in Phase 3, for any scripts that care.
	phase = 3

	;Apply the combat music override. (We don't do this if the postquest has triggered because the player can
	;get away, and if they do, the music will be stuck on.)
	if (!GetStageDone(2000))
		MUSzDLC01CombatMechanist.Add()
	EndIf

	;Select a Hold Position target. (We don't do this during the Voiceprint Bypass version of the battle.)
	if (GetStageDone(1050) || GetStageDone(2000))
		MechanistSetHoldPositionTarget()
		MBattle_Mechanist_HoldPositionTimestamp = Utility.GetCurrentRealTime()
	EndIf

	;Start the timer that updates the Mechanist's behaviors.
	StartTimer(0, CONST_MBattle_MechanistTimerID)
EndFunction


;Called by the script's OnTimer event. Handles timed events related to the Mechanist's behavior.
Function OnTimerMechanist()
	;Edge Case: If the Mechanist has unloaded (the player finished the quest, attacked her, and then left the cell)
	;we don't want this to run indefinitely. Just kill her. Otherwise, the edge case handling becomes excessive.
	if (!Mechanist.Is3DLoaded())
		Mechanist.Kill()
		;The music override shouldn't be active in this case, but remove it anyway, just to be safe.
		MUSzDLC01CombatMechanist.Remove()
		return
	EndIf

	;If the Mechanist is dead, just bail.
	if (Mechanist.IsDead())
		return
	EndIf

	float currentTime = Utility.GetCurrentRealTime()

	;Debug.Trace("TIME: " + currentTime + "/" + (MBattle_Mechanist_HoldPositionTimestamp + CONST_MBattle_Mechanist_HoldPositionDelay))
	
	;HOLD POSITION behavior.
	; - We select the first Hold Position target in StartCombatWithMechanist, above (or leave the timestamp at 0
	;   if we aren't doing this, for the Voiceprint Bypass case).
	; - Thereafter, we try to update it every CONST_MBattle_Mechanist_HoldPositionDelay.
	if ((MBattle_Mechanist_HoldPositionTimestamp != 0) && (currentTime > (MBattle_Mechanist_HoldPositionTimestamp + CONST_MBattle_Mechanist_HoldPositionDelay)))
		bool setHoldPos = MechanistSetHoldPositionTarget()
		;Debug.Trace("Changed? " + setHoldPos)
		if (setHoldPos)
			MBattle_Mechanist_HoldPositionTimestamp = currentTime
		EndIf
	EndIf

	;STEALTH BOY behavior.
	if ((MBattle_Mechanist_InvisibilityState == 0) && \
		(MBattle_Mechanist_StealthBoysUsed < CONST_MBattle_Mechanist_StealthBoyUsesMax) && \
		(currentTime > MBattle_Mechanist_EndedStealthTimestamp + CONST_MBattle_Mechanist_StealthDelay))
		;The Mechanist is ready to use another Stealth Boy (she's not invisible, hasn't used her max count of
		;Stealth Boys, and she's been visible long enough).
		Mechanist.AddItem(StealthBoy)
		MBattle_Mechanist_InvisibilityState = 1
	ElseIf ((MBattle_Mechanist_InvisibilityState == 1) && (Mechanist.GetValue(Invisibility) > 0))
		;The Mechanist has just used a Stealth Boy. Increment our use count.
		MBattle_Mechanist_StealthBoysUsed = MBattle_Mechanist_StealthBoysUsed + 1
		MBattle_Mechanist_InvisibilityState = 2
	ElseIf ((MBattle_Mechanist_InvisibilityState == 2) && (Mechanist.GetValue(Invisibility) == 0))
		;The Mechanist has become visible after using a Stealth Boy. Record the timestamp so we know when
		;to use another one.
		MBattle_Mechanist_EndedStealthTimestamp = currentTime
		MBattle_Mechanist_InvisibilityState = 0
	EndIf

	;LAY MINES behavior.
	if (currentTime > (MBattle_Mechanist_LayMineTimestamp + CONST_MBattle_Mechanist_LayMineDelay))
		bool laidMine = MechanistLayMine()
		if (laidMine)
			MBattle_Mechanist_LayMineTimestamp = currentTime
		EndIf
	EndIf

	;Always EVP her to keep her moving to her next Hold Position target.
	Mechanist.EvaluatePackage()

	;Then restart the timer.
	StartTimer(CONST_MBattle_Mechanist_TimerDuration, CONST_MBattle_MechanistTimerID)
EndFunction


;Select a new Hold Position target for the Mechanist.
;Returns true if we were able to select one, false otherwise.
bool Function MechanistSetHoldPositionTarget()
	ObjectReference currentTarget = MBattle_MechanistHoldPositionCurrentTarget.GetReference()
	int maxIndex = Alias_MBattle_MechanistHoldPositionTargets.GetCount() - 1

	;Try to find a new target.
	int i = 0
	While (i < 10)
		ObjectReference newTarget = Alias_MBattle_MechanistHoldPositionTargets.GetAt(Utility.RandomInt(0, maxIndex))
		if ((currentTarget != None) && (currentTarget.GetDistance(newTarget) < 1024))
			;Reject targets that are too close to the current target.
			i = i + 1
		Else
			MechanistHoldPositionCurrentTarget = newTarget
			MBattle_MechanistHoldPositionCurrentTarget.ForceRefTo(newTarget)
			return True
		EndIf
	EndWhile
	return False
EndFunction


;Check whether the Mechanist should lay a mine here.
;OnTimerMechanist checks the time delay ("Has it been long enough since we laid the last mine?")
;before even calling this function. Returns true if we laid a mine, false otherwise.
bool Function MechanistLayMine()
	float distanceToPlayer = Mechanist.GetDistance(Game.GetPlayer())

	float distanceToTarget = 10000
	if (MechanistHoldPositionCurrentTarget != None)
		Mechanist.GetDistance(MechanistHoldPositionCurrentTarget)
	EndIf

	if (MechanistLaidMines == None)
		MechanistLaidMines = new ObjectReference[0]
	EndIf

	;Make sure:
	; - We don't exceed the cap on the max number of mines we can lay (potential caps exploit).
	; - The player is far enough away.
	; - The Mechanist's hold position target is far enough away (and thus, she's likely to keep moving after dropping the mine).
	if ((MBattle_Mechanist_MinesLaid < CONST_MBattle_Mechanist_MinesLaidMax) && \
		(distanceToPlayer > CONST_MBattle_Mechanist_LayMineDistance) && \
		(distanceToTarget > CONST_MBattle_Mechanist_LayMineDistance))
		;Make sure: This mine isn't too close to any other mine we've previously laid.
		;(Nothing worse than two mines right on top of one another...)
		int i = 0
		While ((i < MechanistLaidMines.Length))
			ObjectReference oldMine = MechanistLaidMines[i]
			if ((oldMine != None) && (Mechanist.GetDistance(oldMine) < CONST_MBattle_Mechanist_LayMineDistance))
				return False
			EndIf
			i = i + 1
		EndWhile
		;Debug.Trace("LAID MINE")
		;If we get this far, we can place the mine.
		;We have to spawn it in a holding cell so we have a chance to set the Faction Owner, or the Mechanist
		;herself will trigger it the moment it spawns in.
		ObjectReference newMine = DLC01_MechanistMineSpawnPoint.PlaceAtMe(PulseMineProjectile)
		MechanistLaidMines.Add(newMine)
		newMine.SetFactionOwner(DLC01MechanistFaction)
		newMine.MoveTo(Mechanist, 0, 0, 20)
		MBattle_Mechanist_MinesLaid = MBattle_Mechanist_MinesLaid + 1
		return True
	EndIf
	return False
EndFunction


Function MBattle_Phase3_End()
	;Remove the combat music override.
	MUSzDLC01CombatMechanist.Remove()

	;Clean up our local refs to the Mechanist and Sparks.
	Mechanist = None
	Sparks = None

	;The fight is now done.
	phase = 4
EndFunction


;-----------------------
;OnTimer Function
;-----------------



;Timer ID Constants.
int CONST_ENT_DeconHallDoorMonitorTimerID = 1 Const
int CONST_ENT_EyebotConfrontation1TimerID = 2 Const
int CONST_CleanupDungeonTimerID = 5 Const
int CONST_MechanistDistanceCheckTimerID = 6 Const
int CONST_MBattle_PlaySceneTimerID = 10 Const
int CONST_MBattle_InterventionTimerID = 11 Const
int CONST_MBattle_CheckRoboticsExpertTimer = 12 Const
int CONST_MBattle_TrashbotSpawnTimer = 13 Const
int CONST_MBattle_KillRobotsTimerID = 14 Const
int CONST_MBattle_MechanistTimerID = 15 Const
int CONST_MBattle_StopMechanistInteractionTimerID = 16 Const
int CONST_MBattle_StopSparksInteractionTimerID = 17 Const


Event OnTimer(int timerID)
	if (timerID == CONST_ENT_DeconHallDoorMonitorTimerID)
		MonitorDeconHallTrigger()
	ElseIf (timerID == CONST_ENT_EyebotConfrontation1TimerID)
		StartEyebotConfrontation1()
	ElseIf (timerID == CONST_CleanupDungeonTimerID)
		CleanupDungeon()
	ElseIf (timerID == CONST_MechanistDistanceCheckTimerID)
		StartMechanistDistanceCheck(0)
	ElseIf (timerID == CONST_MBattle_PlaySceneTimerID)
		bool restart = MBattle_PlayScene()
		if (restart)
			StartTimer(2, CONST_MBattle_PlaySceneTimerID)
		EndIf
	ElseIf (timerID == CONST_MBattle_InterventionTimerID)
		if (MBattle_P2_InterventionsActive)
			SetupNextIntervention()
		EndIf
	ElseIf (timerID == CONST_MBattle_CheckRoboticsExpertTimer)
		if (phase < 3)
			ObjectReference roboticsExpertLink = player.GetLinkedRef(perkRoboticsExpertLink)
			if (roboticsExpertLink != None)
				Utility.Wait(1)
				roboticsExpertLink.Activate(RobotSelfDestructerREF)
				if (!hasPlayedRoboticsExpertResponseScene)
					hasPlayedRoboticsExpertResponseScene = True
					MBattle_EnqueueScene(DLC01Lair_MBattle_RoboticsExpertResponse)
				EndIf
			EndIf
			StartTimer(1, CONST_MBattle_CheckRoboticsExpertTimer)
		EndIf
	ElseIf (timerID == CONST_MBattle_TrashbotSpawnTimer)
		bool doneSpawning = SpawnNextTrashbot()
		if (!doneSpawning)
			StartTimer(Utility.RandomFloat(0.25,1), CONST_MBattle_TrashbotSpawnTimer)
		EndIf
	ElseIf (timerID == CONST_MBattle_KillRobotsTimerID)
		KillPhase12Robots()
	ElseIf (timerID == CONST_MBattle_MechanistTimerID)
		OnTimerMechanist()
	ElseIf (timerID == CONST_MBattle_StopSparksInteractionTimerID)
		StopSparksInteract()
	ElseIf (timerID == CONST_MBattle_StopMechanistInteractionTimerID)
		StopMechanistInteract()
	EndIf
EndEvent