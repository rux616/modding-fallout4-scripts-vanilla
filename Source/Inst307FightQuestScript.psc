ScriptName Inst307FightQuestScript extends Quest Conditional Hidden
{The main control script for the Inst307 Institute attack on the airport.}
;
;Inst307's attack on the airport consists of three main phases:
; - During Phase 1, the player is trying to destroy the BoS Generators (aka Teleport Jammers). During this
;   phase, the Airport is broken into 15 zones (triggers that track player entry/exit counts); the script
;   maintains an adjacency graph of zones, and enables the enemies in the player's current zone and all of
;   the adjacent zones. This allows the fight to have a lot of enemies in total, without having too many
;   active simultaneously. Each zone also supports respawning (though only a few actually use it).
; - During Phase 2, the player is trying to reach the top of Prime's Gantry. The script collapses down
;   the list of active enemies and enables only those around the Gantry.
; - During Phase 3, the player is trying to defend the Virus Synth on the Gantry as it reprograms Prime.
;   In this phase, the Airport is broken into just 3 zones (Gantry Top, Gantry, Base; 20-23), and enemies
;   are supplied by the Phase3_BoSEnemy* aliases, which just respawn in the usual way.
;
;
;This script interacts with three other quests:
; - BoSMarshal, the quest responsible for collecting and managing the named Brotherhood NPCs for the endgame battles.
; - Inst307FightVertibirds, a subquest to handle the Vertibirds used during the battle.
; - Inst307FightCompanionOverrides, a subquest to pull the player's Companions out of the way if the player aggros the BoS base.

;----------------------------------------------
;Zone Properties
;---------------

Group Zone_Properties
	int property activeZone Auto Hidden Conditional
	{Which zone is the player currently in?}

	AdjacentZones[] property zoneAdjacencyGraph Auto Const Mandatory
	{Adjacency graph of Phase 1 zones.}

	RefCollectionAlias[] property allZoneActorCollections Auto Const Mandatory
	{For each Phase 1 zone (0-15), the ref collection of actors associated with that zone.}
EndGroup

int notInBaseZoneCount	;If the player is not currently at the airport (not in any zone; zone=-1), counter used to stall before we start disabling enemies.

int[] zoneTracker			;Tracks player entry and exit events for each zone.
bool[] hasEnteredZone		;Has the player been in this zone before?
bool[] hasCurrentActiveActors	;Does this zone currently have any active actors?
bool[] hasPendingActiveActors ;Is this a zone that should have enabled actors? (That is, they may not be enabled yet, but we want them to be.)
ObjectReference[] zoneTriggers;Array of all triggers that have reported entry events.

;Struct used to create the adjacency graph of Phase 1 zones.
Struct AdjacentZones
	int zone1
	int zone2
EndStruct


;----------------------------------------------
;Phase 1 Properties
;------------------

Group Phase_1_Properties
	RefCollectionAlias property Phase1_ActiveActors Auto Const Mandatory
	{RefCollection of the current active (enabled) enemies.}

	RefCollectionAlias property Phase1_Reinforcements Auto Const Mandatory
	{RefCollection of the current synth reinforcements spawned in to help the player as Generators are destroyed.}

	;For each generator, a marker, the first in a LinkCustom01 chain, of spawn points for the Phase 1 Reinforcements.
	ObjectReference property RelayGenerator01_RespawnPointChain01 Auto Const Mandatory
	ObjectReference property RelayGenerator01_RespawnPointChain02 Auto Const Mandatory
	ObjectReference property RelayGenerator01_RespawnPointChain03 Auto Const Mandatory

	;BoSMarshal Handling: The BoS Unique Actors used in Phase 1.
	ReferenceAlias property Ingram Auto Const Mandatory
	ReferenceAlias property Teagan Auto Const Mandatory
	ReferenceAlias property Quinlan Auto Const Mandatory
	ReferenceAlias property Lucia Auto Const Mandatory
	ReferenceAlias property Clarke Auto Const Mandatory
	ReferenceAlias property Gavil Auto Const Mandatory

	;BoSMarshal Handling: The RefCollections, Patrol start points, and Hold Position triggers to use with each of the
	;BoSMarshal ReferenceAliases above, in that order. (So index 0 in each array is Ingram's, etc.)
	RefCollectionAlias[] property Phase1Uniques_Collections Auto Const Mandatory
	ObjectReference[] property Phase1Uniques_Patrols Auto Const Mandatory
	ObjectReference[] property Phase1Uniques_HPTriggers Auto Const Mandatory

	ReferenceAlias property VertibirdScout Auto Const Mandatory
	{The Vertibird 'Scout' used during the first part of Phase 1. Patrols the perimeter of the airport.}

	bool property shouldBreakoffCombat Auto Conditional Hidden
	{Conditional bool used to stop combat on the BoS Base NPCs; see the Combat Breakoff system below.}
EndGroup

;Number of Generators destroyed.
int generatorsDestroyed


;----------------------------------------------
;Phase 2 Properties
;------------------

;Internal bool: Have we finished setting up the combat for Phase 2?
bool hasTransitionedToPhase2


;----------------------------------------------
;Phase 3 Properties
;------------------

Group Phase_3_Properties
	;BoSMarshal Handling: The BoS Unique Actors used in Phase 3.
	ReferenceAlias property Rhys Auto Const Mandatory
	ReferenceAlias property Haylen Auto Const Mandatory
	ReferenceAlias property Brandis Auto Const Mandatory
	ReferenceAlias property Danse Auto Const Mandatory
	ReferenceAlias property Maxson Auto Const Mandatory

	;The respawning BoS enemies used in Phase 3.
	;Note that the BoSEnemy06-10 slots are initially filled by the BoSMarshal actors.
	ReferenceAlias property Phase3_BoSEnemy01 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy02 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy03 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy04 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy05 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy06 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy07 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy08 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy09 Auto Const Mandatory
	ReferenceAlias property Phase3_BoSEnemy10 Auto Const Mandatory

	RefCollectionAlias property Phase3_Turrets Auto Hidden Const
	{RefCollection of any Turrets that have survived to Phase 3.}

	RefCollectionAlias property Phase3_Spotlights Auto Hidden Const
	{RefCollection of any Spotlights that have survived to Phase 3.}

	bool property battlePaused Auto Hidden Conditional
	{Is the Phase 3 battle 'paused' because the player has left the base? Stops synth respawns.}
EndGroup

;The number of Phase 3 enemies that have been enabled.
int phase3EnemiesEnabled


;----------------------------------------------
;Phase 3 Properties - Virus Synth
;--------------------------------

Group Phase_3_Virus_Synth
	ReferenceAlias property Alias_Virus Auto Const Mandatory
	{The Virus Synth}

	ObjectReference property Inst307Fight_VirusRespawnMarker Auto Const Mandatory
	{Temporary spawn point in an alias cell for the Virus synth.}

	ObjectReference property Inst307Fight_VirusSpawnPoint01 Auto Const Mandatory
	ObjectReference property Inst307Fight_VirusSpawnPoint02 Auto Const Mandatory
	{The Virus Synth's potential spawn points on the Gantry.}

	Scene property Inst307Fight_VirusScene Auto Const Mandatory
	{The Virus Synth's scene. Updates virusUploadTime. When it completes, the player has won.}

	int property virusUploadTime Auto Hidden Conditional
	{How long has the virus synth scene been running? Essentially a loop counter on the scene; not a timer.}

	GlobalVariable property Inst307VirusSynthActive Auto Const Mandatory
	{Used by Inst307 to condition its quest objective. 0=No, 1=Yes.}

	ReferenceAlias property Inst307_VirusSynth Auto Const Mandatory
	{Used by Inst307 to condition its quest objective. Each Virus Synth is forced into this alias.}

	bool property isVirusSynthActive = False Auto Hidden Conditional
	{Is the virus synth currently alive and running his scene?}
EndGroup

;The previous (dead) virus synth, if any.
Actor oldVirusSynth


;----------------------------------------------
;Phase 3 Properties - Institute Beacons
;--------------------------------------
;The Teleport Beacons the player can throw to summon synths. See documentation in InstituteBeaconSpawnerMarkerScript.

Group Phase_3_Institute_Beacons
	;ReferenceAliases holding the markers we use for each beacon's spawn point.
	ReferenceAlias property RelayBeacon01_Marker Auto Const Mandatory
	ReferenceAlias property RelayBeacon02_Marker Auto Const Mandatory
	ReferenceAlias property RelayBeacon03_Marker Auto Const Mandatory

	;ReferenceAliases holding the synths to be spawned by each beacon.
	Inst307Fight_BeaconAliasRespawn01 property RelayBeacon01_Synth01 Auto Const Mandatory
	Inst307Fight_BeaconAliasRespawn01 property RelayBeacon01_Synth02 Auto Const Mandatory
	Inst307Fight_BeaconAliasRespawn02 property RelayBeacon02_Synth01 Auto Const Mandatory
	Inst307Fight_BeaconAliasRespawn02 property RelayBeacon02_Synth02 Auto Const Mandatory
	Inst307Fight_BeaconAliasRespawn03 property RelayBeacon03_Synth01 Auto Const Mandatory
	Inst307Fight_BeaconAliasRespawn03 property RelayBeacon03_Synth02 Auto Const Mandatory
EndGroup

;Local refs of the alias'd markers.
ObjectReference RelayBeacon01Marker
ObjectReference RelayBeacon02Marker
ObjectReference RelayBeacon03Marker


;----------------------------------------------
;Phase 3 Properties - Extra Synths
;---------------------------------
;Additional synths spawned in to help the player during Phase 3.

Group Phase_3_Extra_Synths
	ObjectReference property Inst307Fight_ExtraSynthTempSpawnPoint Auto Const Mandatory
	{Temporary spawn point in an alias cell for the Extra synths.}

	;ReferenceAliases holding the current set of extra synths. Only three are active simultaneously.
	ReferenceAlias property Phase3_ExtraSynth01 Auto Const Mandatory
	ReferenceAlias property Phase3_ExtraSynth02 Auto Const Mandatory
	ReferenceAlias property Phase3_ExtraSynth03 Auto Const Mandatory

	;When we need to spawn (or respawn) an Extra Synth, we spawn the next Base Actor in the arrays below,
	;at the next spawn point, with the next level, and link it to the next hold position trigger.
	ActorBase[] property Inst307Fight_ExtraSynthBaseActors Auto Const Mandatory
	int[] property Inst307Fight_ExtraSynthLevelMods Auto Const Mandatory
	ObjectReference[] property Inst307Fight_ExtraSynthSpawnPoints Auto Const Mandatory
	ObjectReference[] property Inst307Fight_ExtraSynthHoldPositionTriggers Auto Const Mandatory
EndGroup

;The index of the next Extra Synth to spawn (an index into the four arrays above).
int Inst307Fight_ExtraSynthIndex = 0


;----------------------------------------------
;Phase 2-3 Distant Bolts
;-----------------------
;During Phase 2 & 3, on a timer, we randomly play teleport effects on the Prydwen bridge and around the
;fringe of the airport to make the battle seem more impressive.

Group Phase_3_Distant_Bolts
	RefCollectionAlias property Phase3_DistantBoltTargets Auto Const Mandatory
	{RefCollection of target points to play the effects at.}

	;Teleport light and explosion FX.
	Light Property TeleportInFXLight Auto
	Explosion Property TeleportFXExplosion Auto
EndGroup

;Are the Distant Bolts currently running?
bool distantBoltsOn = False


;----------------------------------------------
;Autofill Properties
;-------------------

Group Inst307Fight_AutofillProperties
	Quest property Inst307 Auto Const Mandatory
	Quest property Inst307FightVertibirds Auto Const Mandatory
	Location property BostonAirportLocation Auto Const Mandatory
	ReferenceAlias property Companion Auto Const Mandatory
	ReferenceAlias property DogmeatCompanion Auto Const Mandatory
	Faction property Inst307_BrotherhoodofSteelScoutFaction Auto Const Mandatory
	Faction property PlayerFaction Auto Const Mandatory
	Race property TurretTripodRace Auto Const Mandatory
	Race property VertibirdRace Auto Const Mandatory
	ActorBase property LvlSynthCourser Auto Const Mandatory
	ActorBase property Inst307Fight_LvlSynth_Institute_Missile Auto Const Mandatory
	ActorBase property LvlSynth_Institute_Superbarrel Auto Const Mandatory
	ActorBase property LvlSynth_Institute_Auto Auto Const Mandatory
	ActorBase property LvlSynth_Institute Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LinkCustom10 Auto Const Mandatory
	Keyword property DMP_Combat_HoldPosition_128 Auto Const Mandatory
	Keyword property Inst307Fight_SynthTowerPostLink Auto Const Mandatory
	ObjectReference property Inst307Fight_LoSTestMarker Auto Const Mandatory
	ObjectReference property Inst307_GantryMainHoldPositionTrigger Auto Const Mandatory
	ObjectReference property Inst307_BaseHoldPositionTrigger2 Auto Const Mandatory
	MusicType property MUSzCombatInst307 Auto Const Mandatory
	MusicType property MUSzCombatInst307Boss Auto Const Mandatory
EndGroup

;Local ref to the player.
Actor player

;Is the music override currently active?
bool property isMusicOverrideActive Auto Hidden Conditional

;Timer IDs
int ZoneCheckTimerID = 1
int GarbageTimerID = 2
int VirusSynthTimerID = 3
int ExtraSynthTimerID = 4
int DistantBolts01TimerID = 5
int DistantBolts02TimerID = 6
int DistantBolts03TimerID = 7
int Phase3EnemyEnableTimerID = 8
int BreakoffCombatCheckTimerID = 9
int BreakoffCombatTimerID = 10

;Array of 'stragglers'-- Actors from zones that are no longer active, but that we can't get rid of yet.
Actor[] Phase1_StragglerActors

;Array of objects we'd like to delete, when it's safe to do so.
ObjectReference[] garbage

;Are the following timers running?
bool breakoffCombatTimerRunning
bool garbageTimerRunning
bool zoneCheckTimerRunning
bool activeActorTimerRunning


;------------------------------------
; Startup & Shutdown
;-------------------

Event OnInit()
	zoneTracker = new int[25]
	hasEnteredZone = new bool[25]
	hasCurrentActiveActors = new bool[allZoneActorCollections.Length]
	hasPendingActiveActors = new bool[allZoneActorCollections.Length]
	zoneTriggers = new ObjectReference[25]
	garbage = new ObjectReference[0]
	Phase1_StragglerActors = new Actor[0]
	player = Game.GetPlayer()
EndEvent

;Called by the quest startup stage to initialize the battle.
Function Startup()
	;--Fpr Phase 1
	;Set up all of the Phase 1 Unique Actors (move them to their patrol points, link them to their patrols and triggers, etc.)
	Startup_SetupPhase1UniqueActor(Ingram.GetActorRef(), 0)
	Startup_SetupPhase1UniqueActor(Teagan.GetActorRef(), 1)
	Startup_SetupPhase1UniqueActor(Quinlan.GetActorRef(), 2)
	Startup_SetupPhase1UniqueActor(Lucia.GetActorRef(), 3)
	Startup_SetupPhase1UniqueActor(Clarke.GetActorRef(), 4)
	Startup_SetupPhase1UniqueActor(Gavil.GetActorRef(), 5)

	;Register the actors in the perimeter zones for hit events. (Not all will register.)
	int i = 0
	int allZoneCollectionsLength = allZoneActorCollections.Length
	While (i < allZoneCollectionsLength)
		if (allZoneActorCollections[i] != None)
			(allZoneActorCollections[i] as Inst307_ZoneRefColRespawnScript).InitZoneRefCollection()
		EndIf
		i = i + 1
	EndWhile

	;--For Phase 3
	;Set up all of the Phase 3 Unique Actors (they just replace one of the usual enemy slots.)
	Phase3_BoSEnemy06.ForceRefTo(Rhys.GetActorRef())
	Phase3_BoSEnemy07.ForceRefTo(Haylen.GetActorRef())
	Phase3_BoSEnemy08.ForceRefTo(Brandis.GetActorRef())
	Phase3_BoSEnemy09.ForceRefTo(Danse.GetActorRef())
	Phase3_BoSEnemy10.ForceRefTo(Maxson.GetActorRef())

	;Disable the Phase 3 Unique Actors to prevent them from being killed early (or, in Maxson's case, jumping down off the Prydwen).
	Rhys.TryToDisable()
	Haylen.TryToDisable()
	Brandis.TryToDisable()
	Danse.TryToDisable()
	Maxson.TryToDisable()

	;Set Zone -1 ("Not at the Airport") as the initial default.
	SetActiveZone(-1)
EndFunction

;Helper function for Startup(). Handles setting up the BoSMarshal unique actors.
Function Startup_SetupPhase1UniqueActor(Actor uniqueActor, int index)
	uniqueActor.Disable()
	uniqueActor.SetLinkedRef(Phase1Uniques_HPTriggers[index], DMP_Combat_HoldPosition_128)
	uniqueActor.SetLinkedRef(Phase1Uniques_Patrols[index])
	uniqueActor.SetValue(Aggression, 1)
	uniqueActor.MoveTo(Phase1Uniques_Patrols[index])
	Phase1Uniques_Collections[index].AddRef(uniqueActor)
	;Debug.Trace("Setup Unique: " + uniqueActor + ", " + Phase1Uniques_Collections[index])
EndFunction


;Called by Inst307 to clean up the airport when the Prydwen crashes. 
Function Shutdown()
	;Debug.Trace("Shutdown Started")

	;Cancel all timers to prevent them from interfering with final cleanup.
	int i = 0
	While (i < 15)
		CancelTimer(i)
		i = i + 1
	EndWhile

	;Cleanup everything in the garbage array, using the cleanup function to make sure we safely remove vertibirds and their occupants.
	i = 0
	While (garbage.Length > 0)
		Cleanup(garbage[0], 0)
	EndWhile

	;Cleanup everything in all other arrays, collections, and aliases.
	i = 0
	While (i < allZoneActorCollections.Length)
		CleanupRefCollectionAlias(allZoneActorCollections[i])
		i = i + 1
	EndWhile
	CleanupRefCollectionAlias(Phase1_Reinforcements)
	CleanupRefCollectionAlias(Phase3_Turrets)
	CleanupReferenceAlias(Alias_Virus)
	CleanupReferenceAlias(Phase3_BoSEnemy01)
	CleanupReferenceAlias(Phase3_BoSEnemy02)	
	CleanupReferenceAlias(Phase3_BoSEnemy03)
	CleanupReferenceAlias(Phase3_BoSEnemy04)
	CleanupReferenceAlias(Phase3_BoSEnemy05)
	CleanupReferenceAlias(Phase3_BoSEnemy06)
	CleanupReferenceAlias(Phase3_BoSEnemy07)	
	CleanupReferenceAlias(Phase3_BoSEnemy08)
	CleanupReferenceAlias(Phase3_BoSEnemy09)
	CleanupReferenceAlias(Phase3_BoSEnemy10)
	CleanupReferenceAlias(Phase3_ExtraSynth01)
	CleanupReferenceAlias(Phase3_ExtraSynth02)
	CleanupReferenceAlias(Phase3_ExtraSynth03)
	CleanupReferenceAlias(RelayBeacon01_Synth01)	
	CleanupReferenceAlias(RelayBeacon01_Synth02)	
	CleanupReferenceAlias(RelayBeacon02_Synth01)	
	CleanupReferenceAlias(RelayBeacon02_Synth02)	
	CleanupReferenceAlias(RelayBeacon03_Synth01)	
	CleanupReferenceAlias(RelayBeacon03_Synth02)

	;No need to destroy the spotlights, since they simply disable.

	;Debug.Trace("Shutdown Done")
EndFunction


;------------------------------------
; Zone Tracking
;----------------

;AirportZoneTriggerScript verifies that it was the player who entered the trigger, then calls this function.
Function ZoneEntered(int zoneID, ObjectReference zoneTrigger)
	;Debug.Trace("ZoneEntered: " + zoneID)
	;Update entry/exit count.
	UpdateZoneCount(zoneId, 1)
	;Add the trigger to the array.
	zoneTriggers[zoneId] = zoneTrigger
	;I used to call 'SetActiveZone' directly, but that resulted in too much thrashing on trigger boundaries.
	;Since SetActiveZone is expensive when a change occurs, run it only on a timer, and then check if we need to run it again.
	if (!zoneCheckTimerRunning)
		zoneCheckTimerRunning = True
		StartTimer(0, ZoneCheckTimerID)
	EndIf
EndFunction

;AirportZoneTriggerScript verifies that it was the player who left, then calls this function.
Function ZoneLeft(int zoneID, ObjectReference zoneTrigger)
	;Debug.Trace("ZoneLeft: " + zoneID)
	;Update entry/exit count.
	UpdateZoneCount(zoneId, -1)
	;As above, SetActiveZone runs only on a timer.
	if (!zoneCheckTimerRunning)
		zoneCheckTimerRunning = True
		StartTimer(0, ZoneCheckTimerID)
	EndIf
EndFunction

;Update the entry/exit count for a given zone.
;I'm doing this in one fucntion because allowing ZoneEntered and ZoneLeft to each update the array independently resulted in counts that were out-of-sync.
Function UpdateZoneCount(int zoneID, int value)
	zoneTracker[zoneID] = zoneTracker[zoneID] + value
	;Debug.Trace("Update Zone Count: " + zoneID + "=" + value)
EndFunction

;Which zone is the player currently in?
;NOTE: Some Debug MessageBoxes are currently in this function for 43226.
int Function FindActiveZone()
	int i = 0
	int j = 0
	While (i < zoneTracker.Length)
		;Debug.Trace("zoneTracker for: " + i + "=" + zoneTracker[i] + ", length: " + zoneTracker.Length)

		;DEBUG ONLY
		;if (zoneTracker[i] > 1)
		;	Inst307Fight_BugWarning.Show()
		;	Debug.MessageBox("Inst307 TRIGGER BUG: FindActiveZone for zone " + i + " is " + zoneTracker[i] + " (overcount).")
		;ElseIf ((zoneTracker[i] < -1) && (zoneTracker[i] > -10))
		;	Inst307Fight_BugWarning.Show()
		;	Debug.MessageBox("Inst307 TRIGGER BUG: FindActiveZone for zone " + i + " is " + zoneTracker[i] + " (undercount).")
		;EndIf

		;Look for and return the first positive count for a zone (more entries than leaves)...
		if (zoneTriggers == None)
			Debug.Trace("zoneTriggers was NONE")
		EndIf
		if (zoneTracker[i] > 0)
			;Then verify that the player is actually in that trigger.
			int verifyPlayerInZone = zoneTriggers[i].GetTriggerObjectCount()
			;Debug.Trace("Testing Zone: " + i + ", Verification= " + verifyPlayerInZone)
			;Debug.Trace("Additional Info: Trigger=" + zoneTriggers[i] + ", recalc: " + zoneTriggers[i].GetTriggerObjectCount())
			if (verifyPlayerInZone > 0)
				;Debug.Trace("FindActiveZone returned: " + i)
				notInBaseZoneCount = 0
				return i
			EndIf
		EndIf
		i = i + 1
	EndWhile
	;If we don't find a positive entry count, the player may have left the base. Or maybe we just called this at a bad time,
	;before the next OnTriggerEnter has processed. We typically stall for five timer cycles. If we don't get a zone number by then,
	;do an exhaustive search before giving up.
	Location playersLocation = player.GetCurrentLocation()
	if ((playersLocation != None) && (playersLocation != BostonAirportLocation))
		;If the player isn't even in this location anymore, bail out immediately.
		;Debug.Trace("INST307: Player has left the airport. Repeat, player has left the airport.")
		return -1
	ElseIf (notInBaseZoneCount < 5)
		;Debug.Trace("FindActiveZone returned Interim: " + activeZone)
		notInBaseZoneCount = notInBaseZoneCount + 1
		return activeZone
	Else
		;Debug.Trace("FindActiveZone beginning exhaustive search.")
		i = 0
		While (i < zoneTriggers.Length)
			if (zoneTriggers[i] != None)
				int verifyPlayerInZone = zoneTriggers[i].GetTriggerObjectCount()
				;Debug.Trace("Searching Zone: " + i + ", Verification= " + verifyPlayerInZone)
				;Debug.Trace("Additional Info: Trigger=" + zoneTriggers[i] + ", recalc: " + zoneTriggers[i].GetTriggerObjectCount())
				if (verifyPlayerInZone > 0)
					;Debug.Trace("FindActiveZone returned: " + i)
					notInBaseZoneCount = 0
					return i
				EndIf
			EndIf
			i = i + 1
		EndWhile
		;Debug.Trace("FindActiveZone was unable to locate the player. Returning -1.")
		notInBaseZoneCount = 0
		return -1
	EndIf
EndFunction

;Called by the zoneCheck Timer. Determine which zone the player is in and update the quest and actors accordingly.
Function SetActiveZone(int newActiveZone)
	int oldActiveZone = activeZone

	;if (newActiveZone == -1)
		;Debug.Trace("Zone Entry: Zone -1")
	;Else
		;Debug.Trace("Zone Entry for " + newActiveZone + ": " + hasEnteredZone[newActiveZone])
	;EndIf

	;---Zone Entry Events---
	;Try the following when the player enters a zone for the first time.
	if ((newActiveZone >= 0) && !hasEnteredZone[newActiveZone])
		;Phase 1: Clean up the Vertibird Scout when the player enters the terminal for the first time.
		if (!Inst307FightVertibirds.GetStageDone(29) && (newActiveZone > 8) && (newActiveZone != 10))
			Inst307FightVertibirds.SetStage(29)
		EndIf
		;Phase 1: Enable the Helipad Vertibird whenever the player is at the airport.
		Inst307FightVertibirds.SetStage(30)
		;Phase 2: When the player is on the Gantry for the first time, activate the second set of distant bolts.
		if ((newActiveZone == 20) || (newActiveZone == 21))
			SetStage(290)
		EndIf
	EndIf

	if (GetStage() < 200)
		;--Phase 1--
		;Check to see if we should start the Breakoff Combat timer.
		if ((newActiveZone == -1) || (newActiveZone == 1) || (newActiveZone == 4) || (newActiveZone == 5) || (newActiveZone == 6))
			CancelTimer(BreakoffCombatCheckTimerID)
			StartTimer(0, BreakoffCombatCheckTimerID)
		EndIf
		;Check to see if we should start the music override.
		if (isMusicOverrideActive)
			if ((newActiveZone == 10) || (newActiveZone < 7))
				RemoveMusicOverride()
			EndIf
		Else
			if ((newActiveZone > 6) && (newActiveZone != 10))
				StartMusicOverride(1)
			EndIf
		EndIf
		;Check to see if we should complete the 'Infiltrate the Terminal' objective.
		if (newActiveZone >= 11)
			Inst307.SetStage(36)
		EndIf
		;When the player enters the control tower, station all of the synths at the bottom of the elevator. They don't follow the player up.
		if (newActiveZone == 10)
			int i = 0
			Actor current
			int reinforcementCount = Phase1_Reinforcements.GetCount()
			While (i < reinforcementCount)
				current = Phase1_Reinforcements.GetAt(i) as Actor
				current.SetLinkedRef(RelayGenerator01_RespawnPointChain02.GetNthLinkedRef(i, LinkCustom01), Inst307Fight_SynthTowerPostLink)
				current.EvaluatePackage()
				;Debug.Trace("Assigning " + current + " to " + RelayGenerator01_RespawnPointChain02.GetNthLinkedRef(i, LinkCustom01))
				i = i + 1
			EndWhile
			;Debug.Trace("Finished assignments.")
		EndIf
	ElseIf ((GetStage() >= 200) && (GetStage() < 300))
		;--Phase 2--
		if ((newActiveZone == 7) && !hasTransitionedToPhase2)
			;Transition to Phase 2 when the player enters the base.
			TransitionToPhase2()
		ElseIf (newActiveZone == 20)
			;When the player is at the top of the Gantry during Phase 2 or 3, we're ready for the Virus Synth to spawn.
			VirusSynthReady()
		EndIf
	ElseIf (GetStage() >= 300)
		;--Phase 3--
		;Check to see if we should start the music override.
		if (newActiveZone == -1)
			;Phase 3 - Player has left the base. Aww...
			;Remove the music override.
			RemoveMusicOverride()
			;Battle enters the 'paused' state. The BoS continues to respawn, but synths don't.
			battlePaused = True
			;Kill the Virus Synth, so he doesn't finish reprogramming Prime while you're away.
			Alias_Virus.GetActorRef().Kill()
			;Stop Beacon Respawns
			(RelayBeacon01_Marker as Inst307Fight_BeaconAliasScript).SetBeaconInactive()
			(RelayBeacon02_Marker as Inst307Fight_BeaconAliasScript).SetBeaconInactive()
			(RelayBeacon03_Marker as Inst307Fight_BeaconAliasScript).SetBeaconInactive()
			;Stop Extra Respawns
			StopSpawningExtraSynths()
			;Stop Distant Bolts
			StopDistantBolts()
			;Debug.Trace("Battle Paused")
		ElseIf ((newActiveZone != -1) && (battlePaused))
			;Synth Virus will respawn when the player reaches the top of the Gantry again.
			;Apply music override.
			StartMusicOverride(2)
			;Resume Beacon Respawns
			TryToActivateBeacons()
			;Resume Extra Respawns
			StartSpawningExtraSynths()
			;Resume Distant Bolts
			StartDistantBolts()
			;Battle is no longer paused.
			battlePaused = False
			;Debug.Trace("Battle Unpaused")
			if (newActiveZone == 20)
				;When the player is at the top of the Gantry during Phase 2 or 3, we're ready for the Virus Synth to spawn.
				VirusSynthReady()
			EndIf	
		ElseIf (newActiveZone == 20)
			;When the player is at the top of the Gantry during Phase 2 or 3, we're ready for the Virus Synth to spawn.
			VirusSynthReady()
		EndIf
	EndIf

	;Record that we've entered the zone at least once.
	if (newActiveZone >= 0)
		hasEnteredZone[newActiveZone] = True
	EndIf

	;Set the new active zone.
	activeZone = newActiveZone

	;---Phase 1 Zone Management---
	;During Phase 1, if the player changed zones, reassess which actors should be enabled and disabled.
	if (GetStage() < 250)
		UpdateActiveActors()
	EndIf
	;Debug.Trace("SetActiveZone. Active zone is now: " + activeZone)
EndFunction

;Called by SetActiveZone, above. During Phase 1, when the player changes zones, 
;update the list of enabled and disabled actors.
Function UpdateActiveActors()
	;Debug.Trace("Starting update")
	;Array to track which collections of actors need to be enabled.
	hasPendingActiveActors = new bool[allZoneActorCollections.Length]

	int i = 0
	Actor currentActor

	;We want to enable the collections for the player's current zones, and for the adjacent zones
	;as determined by the adjacency graph.
	if (activeZone >= 0)
		hasPendingActiveActors[activeZone] = True
	EndIf
	While (i < zoneAdjacencyGraph.Length)
		if (zoneAdjacencyGraph[i].zone1 == activeZone)
			if (zoneAdjacencyGraph[i].zone2 >= 0)
				hasPendingActiveActors[zoneAdjacencyGraph[i].zone2] = True
			EndIf
		ElseIf (zoneAdjacencyGraph[i].zone2 == activeZone)
			if (zoneAdjacencyGraph[i].zone1 >= 0)
				hasPendingActiveActors[zoneAdjacencyGraph[i].zone1] = True
			EndIf
		EndIf
		i = i + 1
	EndWhile

	;Clear the list of active actors.
	Phase1_ActiveActors.RemoveAll()

	;Rebuild the list of active actors, painfully checking every actor in every collection.
	i = 0
	While (i < allZoneActorCollections.Length)
		if (hasCurrentActiveActors[i] && hasPendingActiveActors[i])
			;If the actors are currently enabled, and should still be enabled, just add them to ActiveActors. We don't need to do anything else.
			int j = 0
			int collectionCount = allZoneActorCollections[i].GetCount()
			While (j < collectionCount)
				currentActor = allZoneActorCollections[i].GetAt(j) as Actor
				if (currentActor != None)
					Phase1_ActiveActors.AddRef(currentActor)
					;Debug.Trace("KEEPING ACTOR: " + i + " - " + currentActor)
				EndIf
				j = j + 1
			EndWhile
		ElseIf (!hasCurrentActiveActors[i] && hasPendingActiveActors[i])
			;If the actors are currently disabled, and should be enabled, enable them.
			int j = 0
			int collectionCount = allZoneActorCollections[i].GetCount()
			While (j < collectionCount)
				currentActor = allZoneActorCollections[i].GetAt(j) as Actor
				if (currentActor != None)
					Phase1_ActiveActors.AddRef(currentActor)
					if (currentActor.GetRace() == TurretTripodRace)
						;Just enable turrets.
						currentActor.EnableNoWait()
						;Debug.Trace("ACTIVATING TURRET: " + i + " - " + currentActor)
					Else
						;Test to see whether the player has LoS to the actor. The use of a test marker like this shouldn't
						;be necessary, but it seems to work much better than just testing against the disabled actor.
						Inst307Fight_LoSTestMarker.MoveTo(currentActor)
						if (!player.HasDetectionLoS(Inst307Fight_LoSTestMarker))
							;If the player doesn't have LoS to the new actor, enable them where they are.
							currentActor.EnableNoWait()
							;Debug.Trace("ACTIVATING ACTOR (N1): " + i + " - " + currentActor)
						ElseIf (!currentActor.GetActorBase().IsUnique())
							;Otherwise, use their GetRespawnMarker function to find an appropriate point the player doesn't
							;have LoS to, then enable them there.
							currentActor.MoveTo((allZoneActorCollections[i] as Inst307_ZoneRefColRespawnScript).GetRespawnMarker())
							currentActor.EnableNoWait()
							;Debug.Trace("ACTIVATING ACTOR (S): " + i + " - " + currentActor)	
						EndIf
					EndIf
				EndIf
				j = j + 1
			EndWhile
		ElseIf (hasCurrentActiveActors[i] && !hasPendingActiveActors[i])
			;If the actors are enabled, but should be disabled, disable them if they're out of the player's LoS.
			;Otherwise, they go into the stragglers array.
			int j = 0
			int collectionCount = allZoneActorCollections[i].GetCount()
			While (j < collectionCount)
				currentActor = allZoneActorCollections[i].GetAt(j) as Actor
				if (!currentActor.IsDisabled())
					if (currentActor != None)
						if (player.HasDetectionLoS(currentActor))
							;Debug.Trace("KEEPING ACTOR IN LOS: " + i + " - " + currentActor)
							;Add the actor to the Stragglers array if it isn't already there. We have to keep it active for now.
							if (Phase1_StragglerActors.Find(currentActor) < 0)
								Phase1_StragglerActors.Add(currentActor)
							EndIf
						Else
							currentActor.DisableNoWait()
							;Debug.Trace("DISABLING ACTOR: " + i + " - " + currentActor)
						EndIf
					EndIf
				EndIf
				j = j + 1
			EndWhile
		;ElseIf (!hasCurrentActiveActors[i] && !hasPendingActiveActors[i])
			;We can skip the array. The actors in the collection aren't all being enabled or disabled,
			;and any of them that are still active should be in the Stragglers array.
		EndIf
		i = i + 1
	EndWhile
	hasCurrentActiveActors = hasPendingActiveActors

	;Process the stragglers.
	;Debug.Trace("Processing Stragglers, Start: " + Phase1_StragglerActors.Length)
	i = 0
	While (i < Phase1_StragglerActors.Length)
		currentActor = Phase1_StragglerActors[i]
		if (currentActor.IsDisabled())
			;If the actor has been disabled for some other reason, just discard it from the stragglers array.
			Phase1_StragglerActors.Remove(i)
		ElseIf (Phase1_ActiveActors.Find(currentActor))
			;If the actor is in ActiveActors at this point, they're active 'for real' and not a straggler anymore.
			Phase1_StragglerActors.Remove(i)
		ElseIf (!player.HasDetectionLoS(currentActor))
			;If the player doesn't have LoS to the actor, we can finally disable them.
			currentActor.DisableNoWait()
			Phase1_StragglerActors.Remove(i)
		Else
			;The actor is still a straggler. Add them to ActiveActors and increment the loop count.
			Phase1_ActiveActors.AddRef(currentActor)
			i = i + 1
		EndIf
	EndWhile
	;Debug.Trace("Processing Stragglers, Done: " + Phase1_StragglerActors.Length)

	;Debug.Trace("UpdateActiveActors Finished update.")
EndFunction


;------------------------------------
; Cleanup Functions
;------------------
;There are a LOT of objects we want to disable and delete when the player loses LoS on them,
;most notably the vertibirds used in the fight. These functions provide a centralized 'cleanup timer'
;that periodically goes through and tries to delete anything it can.

;Register an object for cleanup (disabling & deletion), when the player loses LoS on it.
Function RegisterForCleanup(ObjectReference obj)
	;Debug.Trace("Registered for Cleanup of " + obj)
	garbage.Add(obj)
	if (!garbageTimerRunning)
		garbageTimerRunning = True
		StartTimer(0, GarbageTimerID)
	EndIf
EndFunction

;Called by garbageTimer Timer to check whether we can clean up any of the objects in our garbage array.
Function CheckForCleanup()
	;Debug.Trace("---Inst307Fight Garbage Collection.")
	int i = 0
	While (i < garbage.Length)
		if (garbage[i] == None)
			garbage.Remove(i)
			i = i - 1
		ElseIf (garbage[i].IsDisabled())
			Cleanup(garbage[i], i)
			i = i - 1
		Else
			Actor garbageActor = garbage[i] as Actor
			bool hasGarbageLoS = player.HasDetectionLoS(garbage[i])
			if (garbageActor == None)
				if (!hasGarbageLoS)
					Cleanup(garbage[i], i)
					i = i - 1
				;Else
					;Debug.Trace("Skipped " + garbage[i])
				EndIf
			ElseIf (garbageActor.GetRace() == VertibirdRace)
				if (!hasGarbageLoS && (garbageActor.GetDistance(player) > 5000))
					Cleanup(garbage[i], i)
					i = i - 1
				;Else
					;Debug.Trace("Skipped " + garbage[i])
				EndIf
			ElseIf (!hasGarbageLoS)
				Cleanup(garbage[i], i)
				i = i - 1
			;Else
				;Debug.Trace("Skipped " + garbage[i])
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Cleanup for object references, May be called by CheckForCleanup or independently (passing index -1).
Function Cleanup(ObjectReference obj, int garbageIndex)
	;Debug.Trace("Cleaning up " + obj + "...")

	;The Inst307Fight Vertibirds use LinkCustom10 chains to link their pilots, etc. If we find such a chain, clean up everything in it, too.
	ObjectReference[] chain = obj.GetLinkedRefChain(LinkCustom10)
	int chainLength = chain.Length
	if (chainLength > 0) 
		int i = 0
		While (i < chainLength)
			chain[i].DisableNoWait()
			chain[i].Delete()
			i = i + 1
		EndWhile
	EndIf

	;Then clean up the object.
	obj.DisableNoWait()
	obj.Delete()

	if (garbageIndex >= 0)
		garbage.Remove(garbageIndex)
	EndIf
	;Debug.Trace("...done.")
EndFunction

;Cleanup for a reference alias.
Function CleanupReferenceAlias(ReferenceAlias refAlias)
	ObjectReference item = refAlias.GetReference()
	if (item != None)
		item.DisableNoWait()
		item.Delete()
		refAlias.Clear()
	EndIf
EndFunction

;Cleanup for a ref collection alias.
Function CleanupRefCollectionAlias(RefCollectionAlias refCollect)
	int i = 0
	ObjectReference item
	int collectionCount = refCollect.GetCount()
	While (i < collectionCount)
		item = refCollect.GetAt(i)
		;Debug.Trace("- Cleaning up " + item)
		if (item != None)
			item.DisableNoWait()
			item.Delete()
		EndIf
		i = i + 1
	EndWhile
	refCollect.RemoveAll()
EndFunction


;------------------------------------
; Combat Breakoff
;----------------
;During Phase 1, if the player aggros the BoS base, then backs away (under massive, withering fire), we wait a few seconds,
;then forcibly break off combat with those actors to give the player another chance. (Otherwise, if they stay in combat, you just die.)

;If the breakoff combat timer is running, and the player shoots any of the enemies in the perimeter of the base, they
;relay a hit event to this function, causing us to restart the timer.
Function ReportPerimeterEnemyHit()
	if (breakoffCombatTimerRunning)
		;Debug.Trace("-----Reset Breakoff Timer.")
		StartTimer(5, BreakoffCombatTimerID)
	EndIf
EndFunction

Function BreakoffPerimeterCombat()
	;Debug.Trace("Breakoff!")
	;Store local refs.
	Actor companionActor = Companion.GetActorRef()
	Actor dogmeatActor = DogmeatCompanion.GetActorRef()

	;We are now trying to break off the combat.
	shouldBreakoffCombat = True

	;All actors in the perimeter of the base break combat.
	bool anyActorWasInCombat
	anyActorWasInCombat = BreakoffCombat(allZoneActorCollections[0]) || anyActorWasInCombat
	anyActorWasInCombat = BreakoffCombat(allZoneActorCollections[2]) || anyActorWasInCombat
	anyActorWasInCombat = BreakoffCombat(allZoneActorCollections[3]) || anyActorWasInCombat
	anyActorWasInCombat = BreakoffCombat(allZoneActorCollections[7]) || anyActorWasInCombat
	anyActorWasInCombat = BreakoffCombat(allZoneActorCollections[8]) || anyActorWasInCombat
	BreakoffCombatVertibird(VertibirdScout)


	;Try to get Dogmeat and the player's companion to stop attacking and fall back.
	;Debug.Trace("Breakoff Perimeter Combat: Anyone in combat? " + anyActorWasInCombat)
	if (anyActorWasInCombat)
		if (companionActor != None)
			BreakoffCombatCompanion(companionActor)
			FollowersScript.SetAutonomy(Self, False)
		EndIf
		if (dogmeatActor != None)
			BreakoffCombatCompanion(dogmeatActor)
			FollowersScript.SetAutonomy(Self, False)
		EndIf
	EndIf

	;Debug.Trace("--------------------------------")
	Utility.Wait(1)

	;Then resume normal behavior.
	shouldBreakoffCombat = False
	breakoffCombatTimerRunning = False

	FollowersScript.SetAutonomy(Self, True)
	if (companionActor != None)
		companionActor.EvaluatePackage()
	EndIf
	if (dogmeatActor != None)
		dogmeatActor.EvaluatePackage()
	EndIf

	;Debug.Trace("Breakoff Complete")
EndFunction

;Break off combat for a RefCollection.
; - Ignore anyone in BrotherhoodOfSteelScoutFaction; these enemies can continue to attack.
; - shouldBreakoffCombat is used as a combat override package condition, so it's what really matters here.
bool Function BreakoffCombat(RefCollectionAlias refCollect)
	int i = 0
	Actor current
	int collectionCount = refCollect.GetCount()
	bool anyActorWasInCombat = False
	While (i < collectionCount)
		current = refCollect.GetAt(i) as Actor
		if (!current.IsInFaction(Inst307_BrotherhoodofSteelScoutFaction))
			if (!anyActorWasInCombat && current.IsInCombat())
				anyActorWasInCombat = True
			EndIf
			current.StopCombat()
			current.EvaluatePackage()
			;Debug.Trace("Breakoff - " + current)
		EndIf
		i = i + 1
	EndWhile
	return anyActorWasInCombat
EndFunction

;Break off combat for a Vertibird, as above.
Function BreakoffCombatVertibird(ReferenceAlias vRef)
	Actor vertibird = vRef.GetActorRef()
	if (!vertibird.IsInFaction(Inst307_BrotherhoodofSteelScoutFaction))
		vertibird.StopCombat()
		vertibird.EvaluatePackage()
		ObjectReference[] chain = vertibird.GetLinkedRefChain(LinkCustom10)
		int i = 0
		While (i < chain.Length)
			Actor next = chain[i] as Actor
			if (next != None)
				next.StopCombat()
				next.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile
		;Debug.Trace("Breakoff - " + vRef)
	EndIf
EndFunction

;Break off combat on the player's companion (or Dogmeat).
Function BreakoffCombatCompanion(Actor a)
	;If necessary, give them some health so they can get away.
	Debug.Trace("BreakoffCombatCompanion")
	if (a.GetValue(Health) < 250)
		a.RestoreValue(Health, 250)
	EndIf
	a.StopCombat()
	a.EvaluatePackage()
EndFunction


;------------------------------------
; Reinforcement Synths (5)
;-------------------------
;During Phase 1, synths that spawn in at each Generator when the player destroys it.


Function GeneratorDestroyed(int generatorID)
	;Player has destroyed another generator.
	generatorsDestroyed = generatorsDestroyed + 1

	;Recast this quest and store it.
	Inst307Fight_ReinforceRespawnQScript selfAsReinforcementScript = ((Self as Quest) as Inst307Fight_ReinforceRespawnQScript)

	;Where are we spawning the new reinforcements? Identify and set the respawn points.
	ObjectReference RespawnSourceChain
	if (generatorID == 1)
		RespawnSourceChain = RelayGenerator01_RespawnPointChain01
	ElseIf (generatorID == 2)
		RespawnSourceChain = RelayGenerator01_RespawnPointChain02
	ElseIf (generatorID == 3)
		RespawnSourceChain = RelayGenerator01_RespawnPointChain03
	EndIf
	selfAsReinforcementScript.RespawnSourceChain = RespawnSourceChain

	;Save the number of reinforcements remaining for later use.
	int respawnPoolRemaining = selfAsReinforcementScript.RespawnPool

	;Kill off any synths that are too far from the player so they can be replaced.
	Actor current
	selfAsReinforcementScript.RespawnPool = 0 ;Infinite
	int i = 0
	While (i < Phase1_Reinforcements.GetCount())
		current = Phase1_Reinforcements.GetAt(i) as Actor
		if ((current == None) || (current.IsDead()))
			Phase1_Reinforcements.RemoveRef(current)
		ElseIf ((current.GetDistance(player) > 2048) && (!player.HasDetectionLoS(current)))
			Phase1_Reinforcements.RemoveRef(current)
			current.Kill()
			current.DisablenoWait()
			current.Delete()
		Else
			i = i + 1
		EndIf
	EndWhile

	;Check to see if we've got a Courser, a Big Gun, and an Auto synth. If not, we'll prioritize spawning those over generic Semi guys.
	ActorBase currentBase
	bool hasCourserSynth
	bool hasBigGunSynth
	bool hasAutoSynth
	i = 0
	int reinforcementCount = Phase1_Reinforcements.GetCount()
	While (i < reinforcementCount)
		currentBase = (Phase1_Reinforcements.GetAt(i) as Actor).GetActorBase()
		if (currentBase == LvlSynthCourser)
			hasCourserSynth = True
		ElseIf ((currentBase == Inst307Fight_LvlSynth_Institute_Missile) || (currentBase == LvlSynth_Institute_Superbarrel))
			hasBigGunSynth = True
		ElseIf (currentBase == LvlSynth_Institute_Auto)
			hasAutoSynth = True
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("GeneratorDestroyed found " + hasCourserSynth + ", " + hasBigGunSynth + ", " + hasAutoSynth)

	;Spawn the reinforcements.
	i = 0
	Actor newActor
	While (Phase1_Reinforcements.GetCount() < (generatorsDestroyed + 2))
		if (i != 0)
			Utility.Wait(Utility.RandomFloat(1.0, 1.5))
		EndIf

		if (!hasCourserSynth)
			newActor = selfAsReinforcementScript.SpawnReinforcement(Phase1_Reinforcements, LvlSynthCourser, 3, i)
			hasCourserSynth = True
		ElseIf (!hasBigGunSynth)
			if (generatorID == 1)
				newActor = selfAsReinforcementScript.SpawnReinforcement(Phase1_Reinforcements, Inst307Fight_LvlSynth_Institute_Missile, 2, i)
			Else
				newActor = selfAsReinforcementScript.SpawnReinforcement(Phase1_Reinforcements, LvlSynth_Institute_Superbarrel, 2, i)
			EndIf
			hasBigGunSynth = True
		ElseIf (!hasAutoSynth)
			newActor = selfAsReinforcementScript.SpawnReinforcement(Phase1_Reinforcements, LvlSynth_Institute_Auto, 2, i)
			hasAutoSynth = True
		Else
			newActor = selfAsReinforcementScript.SpawnReinforcement(Phase1_Reinforcements, LvlSynth_Institute, 2, i)
		EndIf
		;Debug.Trace("Spawned Reinforcement")

		;Depending on the generator, handle any special setup. Without the SetPosition calls, synths occasionally spawn on
		;the next floor down for no apparent reason.
		if (generatorID == 1)
			newActor.SetPosition(newActor.GetPositionX(), newActor.GetPositionY(), 1056)
		ElseIf (generatorID == 2)
			newActor.SetPosition(newActor.GetPositionX(), newActor.GetPositionY(), 960)
			;Additionally, If the player just destroyed Generator 2, they're in the control tower, so set the new synths
			;to their guard stations (see SetActiveZone for Zone 10, above).
			newActor.SetLinkedRef(RespawnSourceChain.GetNthLinkedRef(i, LinkCustom01), Inst307Fight_SynthTowerPostLink)
			newActor.EvaluatePackage()
			newActor.MoveToPackageLocation()
		ElseIf (generatorID == 2)
			newActor.SetPosition(newActor.GetPositionX(), newActor.GetPositionY(), 960)
		EndIf
		;Debug.Trace("Assigning " + newActor + " to " + RespawnSourceChain.GetNthLinkedRef(i, LinkCustom01))

		i = i + 1
	EndWhile
	;Debug.Trace("Done Spawning")

	;Add 6 to the respawn pool.
	selfAsReinforcementScript.RespawnPool = respawnPoolRemaining + 6

	;If all generators have been destroyed, we'll move on to Phase 2 in a moment. Switch the respawn source back to Generator 3.
	if (GetStageDone(200))
		selfAsReinforcementScript.RespawnSourceChain = RelayGenerator01_RespawnPointChain03
	EndIf
	;Debug.Trace("Finish handling Generator Destroyed " + generatorID)
EndFunction


;------------------------------------
; Phase 1->2 Transiton
;----------------------

;Called from the Inst307Fight Quest when the player destroys the third generator.
Function StartPhase2()
	;Debug.Trace("StartPhase2 received.")

	;Stop Phase 1 Actor Respawning in all zones.
	int i = 0
	While (i < allZoneActorCollections.Length)
		(allZoneActorCollections[i] as Inst307_ZoneRefColRespawnScript).myRespawnPool = 0
		i = i + 1
	EndWhile

	;Withdraw the turrets from the Zones 0, 2, and 8 actor collections.
	CleanupPhase1Turrets(0)
	CleanupPhase1Turrets(2)
	CleanupPhase1Turrets(8)

	;Clean up all actors in Zones 0, 2, 3, and 8 (the base perimeter).
	CleanupPhase1Zones(0)
	CleanupPhase1Zones(2)
	CleanupPhase1Zones(3)
	CleanupPhase1Zones(8)

	;The Reinforcement Synths, if still alive, are forced into the Extra Synth
	;and Relay Beacon synth aliases, so new synths will only spawn to fill those
	;slots as the Reinforcements are killed off. This limits the number of active synths.
	i = 0
	int found = 0
	int reinforcementCount = Phase1_Reinforcements.GetCount()
	While (i < reinforcementCount)
		Actor current = Phase1_Reinforcements.GetAt(i) as Actor
		if ((current != None) && (!current.IsDead()))
			if (found == 0)
				Phase3_ExtraSynth01.ForceRefTo(current)
			ElseIf (found == 1)
				Phase3_ExtraSynth02.ForceRefTo(current)		
			ElseIf (found == 2)
				Phase3_ExtraSynth03.ForceRefTo(current)
			ElseIf (found == 3)
				RelayBeacon03_Synth02.ForceRefTo(current)
			ElseIf (found == 4)
				RelayBeacon02_Synth02.ForceRefTo(current)
			EndIf
			current.SetLinkedRef(Inst307_GantryMainHoldPositionTrigger)
			current.SetLinkedRef(Inst307_GantryMainHoldPositionTrigger, DMP_Combat_HoldPosition_128)
			found = found + 1
		EndIf
		i = i + 1
	EndWhile
	Phase1_Reinforcements.RemoveAll()

	;Debug.Trace("StartPhase2 done.")

	;Switch to the Phase 2 & 3 Music Override.
	StartMusicOverride(2, 1)

	;Finish the transition to Phase 2 only once the player enters the main base.
	if ((activeZone == 7) && !hasTransitionedToPhase2)
		TransitionToPhase2()
	EndIf
EndFunction

;Helper function for StartPhase2. We need to pull the turrets from Zones 0, 2, and 8, enable them,
;and set them unconscious. Otherwise, players may notice they're missing during Phase 2 & 3.
Function CleanupPhase1Turrets(int index)
	int j = 0
	Actor currentActor
	While (j < allZoneActorCollections[index].GetCount())
		currentActor = allZoneActorCollections[index].GetAt(j) as Actor
		if (currentActor.GetRace() == TurretTripodRace)
			allZoneActorCollections[index].RemoveRef(currentActor)
			Phase3_Turrets.AddRef(currentActor)
			currentActor.EnableNoWait()
			currentActor.SetUnconscious(True)
		Else
			j = j + 1
		EndIf
	EndWhile
	;Debug.Trace("Processed " + index)
EndFunction

;Helper function for StartPhase2. When Phase 2 begins, we discard all of the actors in all of the
;base perimeter zones, leaving only those in Zone 7 (which no longer respawn). This makes the fight
;for the gantry much more manageable.
Function CleanupPhase1Zones(int index)
	int j = 0
	Actor currentActor
	While (j < allZoneActorCollections[index].GetCount())
		currentActor = allZoneActorCollections[index].GetAt(j) as Actor
		if ((currentActor != None) && (!currentActor.IsDead()))
			allZoneActorCollections[index].RemoveRef(currentActor)
			RegisterForCleanup(currentActor)
		Else
			j = j + 1
		EndIf
	EndWhile
EndFunction

;Complete the transition to Phase 2 only once the player has entered the area
;of the base around the Gantry (Phase 1's zone 7).
Function TransitionToPhase2()
	hasTransitionedToPhase2 = True

	;Process actors one final time.
	activeActorTimerRunning = False
	activeZone = 7
	UpdateActiveActors()

	;Clear the zone counts for all of the Phase 1 zones.
	int i = 0
	While (i < 15)
		UpdateZoneCount(i, -1000)
		i = i + 1
	EndWhile

	;Disable the Phase 1 zone triggers and enable the Phase 2 zone triggers.
	SetStage(250)
EndFunction



;------------------------------------
; Phase 2->3 Transiton
;----------------------

Function StartPhase3()
	;Debug.Trace("StartPhase3 received.")
	;Start a timer to poll for and enable the Phase 3 enemies as Phase 2 enemies die off.
	StartTimer(2, Phase3EnemyEnableTimerID)
EndFunction

;In response to the Start Phase 3 timer, count the number of active enemies, and only start
;enabling the Phase 3 enemies as the number of survivors declines.
Function TryToEnablePhase3Enemy()
	;Debug.Trace("Current Count is " + Phase1_ActiveActors.GetCount())
	int i = 0
	While (i < Phase1_ActiveActors.GetCount())
		Actor currentActor = Phase1_ActiveActors.GetAt(i) as Actor
		if (currentActor.IsDead() || currentActor.IsDisabled() || currentActor.IsUnconscious() || (currentActor.GetRace() == TurretTripodRace))
			Phase1_ActiveActors.RemoveRef(currentActor)
		Else
			;Debug.Trace("An active actor is: " + Phase1_ActiveActors.GetAt(i))
			i = i + 1
		EndIf
	EndWhile

	;Enable the first Phase 3 enemy at Count < 5, and the rest at Count < 4 (one per timer loop).
	int phase1ActiveActorsCount = Phase1_ActiveActors.GetCount()
	if ((phase3EnemiesEnabled == 0) && (phase1ActiveActorsCount < 5))
		phase3EnemiesEnabled = 1
		(Phase3_BoSEnemy01 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
	ElseIf ((phase3EnemiesEnabled == 1) && (phase1ActiveActorsCount < 4))
		phase3EnemiesEnabled = 2
		(Phase3_BoSEnemy02 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
	ElseIf ((phase3EnemiesEnabled == 2) && (phase1ActiveActorsCount < 4))
		phase3EnemiesEnabled = 3
		(Phase3_BoSEnemy03 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
	ElseIf ((phase3EnemiesEnabled == 3) && (phase1ActiveActorsCount < 4))
		phase3EnemiesEnabled = 4
		(Phase3_BoSEnemy04 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
	ElseIf ((phase3EnemiesEnabled == 4) && (phase1ActiveActorsCount < 4))
		phase3EnemiesEnabled = 5
		(Phase3_BoSEnemy05 as Inst307Fight_P3BoSAliasRespawnScript).ActivateEnemy()
	EndIf
	;Debug.Trace("TryToEnablePhase3Enemy: " + phase3EnemiesEnabled + " done.")
EndFunction


;------------------------------------
; Virus Synth (1)
;---------------------

;Called when the player enters Zone 20 (Phase 2 Gantry Top).
;If the Virus Synth isn't active, start a timer. When it expires, 'spawn' (move and enable) the Virus Synth.
Function VirusSynthReady()
	if (!isVirusSynthActive)
		isVirusSynthActive = True
		;Debug.Trace("Starting Virus Synth spawn timer. 1s.")
		StartTimer(1, VirusSynthTimerID)
	EndIf
EndFunction

;When the Virus Synth dies, respawn him after a delay.
Function VirusSynthKilled()
	;Is the battle still running? Only respawn the Virus if it is.
	if (GetStage() < 400)
		Inst307VirusSynthActive.SetValue(0)
		oldVirusSynth = Alias_Virus.GetActorRef()
		Actor newVirusSynth = Inst307Fight_VirusRespawnMarker.PlaceActorAtMe(oldVirusSynth.GetActorBase())
		newVirusSynth.DisableNoWait()
		Alias_Virus.ForceRefTo(newVirusSynth)
		RegisterForCleanup(oldVirusSynth)
		;Re-display the Upload the Virus objective to prompt the player to return to the Gantry.
		Inst307.SetObjectiveDisplayed(60, True, True)
		;Debug.Trace("Starting Virus Synth respawn timer. 8s.")
		StartTimer(8, VirusSynthTimerID)
	EndIf
EndFunction


;------------------------------------
; Relay Beacon Synths (0-6)
;---------------------------
;Handling for the Institute Beacons. See InstituteBeaconSpawnerMarkerScript for documentation.

;Called when the player throws their grenade and a beacon is created.
;Effectively assigns a beacon marker spawn point to that beacon.
Function PlaceBeacon(ObjectReference beacon)
	;Store local refs if needed.
	if (RelayBeacon01Marker == None)
		RelayBeacon01Marker = RelayBeacon01_Marker.GetReference()
		RelayBeacon02Marker = RelayBeacon02_Marker.GetReference()
		RelayBeacon03Marker = RelayBeacon03_Marker.GetReference()
	EndIf

	;Move the next available beacon marker to the newly-created beacon.
	if (RelayBeacon01Marker.IsDisabled())
		RelayBeacon01Marker.MoveTo(beacon)
		RelayBeacon01Marker.EnableNoWait()
	ElseIf (RelayBeacon02Marker.IsDisabled())
		RelayBeacon02Marker.MoveTo(beacon)
		RelayBeacon02Marker.EnableNoWait()
	ElseIf (RelayBeacon03Marker.IsDisabled())
		RelayBeacon03Marker.MoveTo(beacon)
		RelayBeacon03Marker.EnableNoWait()
	Else
		;Debug.Trace("ERROR: No free Relay Beacon Markers!")
	EndIf
EndFunction

;If the beacons were inactive (because Phase 1 was running, the player had left the base, etc.), try to set them
;active again so they can spawn their synths.
Function TryToActivateBeacons()
	(RelayBeacon01_Marker as Inst307Fight_BeaconAliasScript).SetBeaconActive()
	(RelayBeacon02_Marker as Inst307Fight_BeaconAliasScript).SetBeaconActive()
	(RelayBeacon03_Marker as Inst307Fight_BeaconAliasScript).SetBeaconActive()
EndFunction

;Begins spawning synths at a beacon.
;NOTE: This function is called by the beacons scripts, not TryToActivateBeacons above.
Function SetBeaconActive(ObjectReference beaconMarker, bool isFirstActivation)
	;Debug.Trace("Setting a Beacon Active: " + beaconMarker + ", " + isFirstActivation)
	if (beaconMarker == RelayBeacon01_Marker.GetReference())
		Inst307Fight_BeaconQuestRespawn01 selfAsBeaconQuest1 = (Self as Quest) as Inst307Fight_BeaconQuestRespawn01
		if (isFirstActivation)
			RelayBeacon01_Synth01.bRespawningOn = True
			Actor s1 = RelayBeacon01_Synth01.GetActorRef()
			if (s1.IsDead())
				selfAsBeaconQuest1.Respawn(RelayBeacon01_Synth01)
			ElseIf (!s1.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s1.Disable()
				s1.MoveTo(selfAsBeaconQuest1.GetRespawnMarker())
				s1.EnableNoWait()
			EndIf
			RelayBeacon01_Synth02.bRespawningOn = True
			Actor s2 = RelayBeacon01_Synth02.GetActorRef()
			if (s2.IsDead())
				selfAsBeaconQuest1.Respawn(RelayBeacon01_Synth02)
			ElseIf (!s2.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s2.Disable()
				s2.MoveTo(selfAsBeaconQuest1.GetRespawnMarker())
				s2.EnableNoWait()
			EndIf
		Else
			RelayBeacon01_Synth01.bRespawningOn = True
			selfAsBeaconQuest1.Respawn(RelayBeacon01_Synth01)
			RelayBeacon01_Synth02.bRespawningOn = True
			selfAsBeaconQuest1.Respawn(RelayBeacon01_Synth02)
		EndIf
	ElseIf (beaconMarker == RelayBeacon02_Marker.GetReference())
		Inst307Fight_BeaconQuestRespawn02 selfAsBeaconQuest2 = (Self as Quest) as Inst307Fight_BeaconQuestRespawn02
		if (isFirstActivation)
			RelayBeacon02_Synth01.bRespawningOn = True
			Actor s1 = RelayBeacon02_Synth01.GetActorRef()
			if (s1.IsDead())
				selfAsBeaconQuest2.Respawn(RelayBeacon02_Synth01)
			ElseIf (!s1.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s1.Disable()
				s1.MoveTo(selfAsBeaconQuest2.GetRespawnMarker())
				s1.EnableNoWait()
			EndIf
			RelayBeacon02_Synth02.bRespawningOn = True
			Actor s2 = RelayBeacon02_Synth02.GetActorRef()
			if (s2.IsDead())
				selfAsBeaconQuest2.Respawn(RelayBeacon02_Synth02)
			ElseIf (!s2.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s2.Disable()
				s2.MoveTo(selfAsBeaconQuest2.GetRespawnMarker())
				s2.EnableNoWait()
			EndIf
		Else
			RelayBeacon02_Synth01.bRespawningOn = True
			selfAsBeaconQuest2.Respawn(RelayBeacon02_Synth01)
			RelayBeacon02_Synth02.bRespawningOn = True
			selfAsBeaconQuest2.Respawn(RelayBeacon02_Synth02)
		EndIf
	ElseIf (beaconMarker == RelayBeacon03_Marker.GetReference())
		Inst307Fight_BeaconQuestRespawn03 selfAsBeaconQuest3 = (Self as Quest) as Inst307Fight_BeaconQuestRespawn03
		if (isFirstActivation)
			RelayBeacon03_Synth01.bRespawningOn = True
			Actor s1 = RelayBeacon03_Synth01.GetActorRef()
			if (s1.IsDead())
				selfAsBeaconQuest3.Respawn(RelayBeacon03_Synth01)
			ElseIf (!s1.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s1.Disable()
				s1.MoveTo(selfAsBeaconQuest3.GetRespawnMarker())
				s1.EnableNoWait()
			EndIf
			RelayBeacon03_Synth02.bRespawningOn = True
			Actor s2 = RelayBeacon03_Synth02.GetActorRef()
			if (s2.IsDead())
				selfAsBeaconQuest3.Respawn(RelayBeacon03_Synth02)
			ElseIf (!s2.IsDisabled())
				;Do nothing; existing Synth should proceed to Beacon.
			Else
				s2.Disable()
				s2.MoveTo(selfAsBeaconQuest3.GetRespawnMarker())
				s2.EnableNoWait()
			EndIf
		Else
			RelayBeacon03_Synth01.bRespawningOn = True
			selfAsBeaconQuest3.Respawn(RelayBeacon03_Synth01)
			RelayBeacon03_Synth02.bRespawningOn = True
			selfAsBeaconQuest3.Respawn(RelayBeacon03_Synth02)
		EndIf
	EndIf
EndFunction

;Stops the spawning of synths at the beacons. Typically called if the player leaves the airport mid-battle.
Function SetBeaconInactive(ObjectReference beacon)
	;Debug.Trace("Setting a Beacon Inactive: " + beacon)
	if (beacon == RelayBeacon01_Marker.GetReference())
		RelayBeacon01_Synth01.bRespawningOn = False
		RelayBeacon01_Synth02.bRespawningOn = False
	ElseIf (beacon == RelayBeacon02_Marker.GetReference())
		RelayBeacon02_Synth01.bRespawningOn = False
		RelayBeacon02_Synth02.bRespawningOn = False
	ElseIf (beacon == RelayBeacon03_Marker.GetReference())
		RelayBeacon03_Synth01.bRespawningOn = False
		RelayBeacon03_Synth02.bRespawningOn = False
	EndIf
EndFunction


;------------------------------------
; Extra Synths (3)
;---------------------
;During Phase 3, handles a series of 'extra' synths that spawn in, in addition to those at the beacons.

;Start the Extra Synths timer.
Function StartSpawningExtraSynths()
	if ((Self.GetStage() < 400) && (Inst307Fight_ExtraSynthIndex < Inst307Fight_ExtraSynthBaseActors.Length))
		StartTimer(1, ExtraSynthTimerID)
	EndIf
EndFunction

;Stop the Extra Synths timer.
Function StopSpawningExtraSynths()
	CancelTimer(ExtraSynthTimerID)
EndFunction

;Called by the Extra Synths spawn timer. Spawn new extra synths to fill the alias slots as they open up.
;Returns true if a synth was spawned, false otherwise. 
bool Function SpawnExtraSynthIfNeeded(ReferenceAlias SynthAlias)
	Actor s = SynthAlias.GetActorRef()
	if ((s == None) || (s.IsDead()))
		;Debug.Trace("Trying PlaceActorAtMe: " + Inst307Fight_ExtraSynthTempSpawnPoint + ", " + Inst307Fight_ExtraSynthBaseActors[Inst307Fight_ExtraSynthIndex] + ", " + Inst307Fight_ExtraSynthLevelMods[Inst307Fight_ExtraSynthIndex])
		s = Inst307Fight_ExtraSynthTempSpawnPoint.PlaceActorAtMe(Inst307Fight_ExtraSynthBaseActors[Inst307Fight_ExtraSynthIndex], Inst307Fight_ExtraSynthLevelMods[Inst307Fight_ExtraSynthIndex])
		s.Disable()
		SynthAlias.ForceRefTo(s)
		s.SetLinkedRef(Inst307Fight_ExtraSynthHoldPositionTriggers[Inst307Fight_ExtraSynthIndex], DMP_Combat_HoldPosition_128)
		s.MoveTo(Inst307Fight_ExtraSynthSpawnPoints[Inst307Fight_ExtraSynthIndex])
		s.EnableNoWait()
		;Debug.Trace("EXTRA SYNTH: " + s + " has been enabled.")
		Inst307Fight_ExtraSynthIndex = Inst307Fight_ExtraSynthIndex + 1
		return True
	EndIf
	return False
EndFunction


;------------------------------------
; Distant Bolts
;---------------
;During Phases 2 & 3, we play the Teleport VFX at random locations around the perimeter of the airport and on the
;Prydwen to make the fight seem larger than it is.

;Start all three of the Distant Bolts timers (if the player leaves and reenters the airport, etc.).
;Otherwise, the three sub-functions are called by quest stages as the quest progresses.
Function StartDistantBolts()
	StartDistantBolts01()
	StartDistantBolts02()
	StartDistantBolts03()
EndFunction

;Stop all of the Distant Bolts from firing. Their timers expire without restarting.
Function StopDistantBolts()
	distantBoltsOn = False
EndFunction

Function StartDistantBolts01()
	if ((Self.GetStage() >= 200) && (Self.GetStage() < 500))
		distantBoltsOn = True
		StartTimer(1, DistantBolts01TimerID)
	EndIf
EndFunction

Function StartDistantBolts02()
	if ((Self.GetStage() >= 290) && (Self.GetStage() < 500))
		distantBoltsOn = True
		StartTimer(2.5, DistantBolts02TimerID)
	EndIf
EndFunction

Function StartDistantBolts03()
	if ((Self.GetStage() >= 300) && (Self.GetStage() < 500))
		distantBoltsOn = True
		StartTimer(4, DistantBolts03TimerID)
	EndIf
EndFunction


Function TriggerDistantBolt()
	int tries = 0
	ObjectReference target
	While ((tries < 3) && (target == None))
		target = Phase3_DistantBoltTargets.GetAt(Utility.RandomInt(0, Phase3_DistantBoltTargets.GetCount() - 1))
		if (player.GetDistance(target) < 2500)
			target == None
		EndIf
		tries = tries + 1
	EndWhile
	if (target != None)
		;Debug.Trace("TriggerDistantBolt fires: " + player.GetDistance(target) + " " + target)
		ObjectReference myLight = target.PlaceAtMe(TeleportInFXLight)
		target.PlaceAtMe(TeleportFXExplosion)
		Utility.Wait(1.25)
		myLight.Delete()
	Else
		;Debug.Trace("TriggerDistantBolt01 failed to pick a target.")
	EndIf
EndFunction



;------------------------------------
; Music Overrides
;---------------------

Function StartMusicOverride(int phase, bool isTransitionToPhase2 = False)
	;Debug.Trace("Starting Music Override")
	if (!isMusicOverrideActive || isTransitionToPhase2)
		;Debug.Trace("Starting Override")
		isMusicOverrideActive = True
		Self.RegisterForRemoteEvent(player, "OnDying")
		Self.RegisterForRemoteEvent(player, "OnLocationChange")
		if (isTransitionToPhase2)
			MUSzCombatInst307.Remove()
		EndIf
		if (GetStage() < 200)
			;Debug.Trace("Starting Music Override: 1")
			MUSzCombatInst307.Add()
		Else
			;Debug.Trace("Starting Music Override: 2")
			MUSzCombatInst307Boss.Add()
		EndIf
	EndIf
EndFunction

Function RemoveMusicOverride()
	Debug.Trace("Removing Override " + MUSzCombatInst307 + " & " + MUSzCombatInst307Boss)
	Self.UnregisterForAllRemoteEvents()
	MUSzCombatInst307.Remove()
	MUSzCombatInst307Boss.Remove()
	isMusicOverrideActive = False
EndFunction

Event Actor.OnDying(Actor sender, Actor akKiller)
	RemoveMusicOverride()
EndEvent

Event Actor.OnLocationChange(Actor sender, Location akOldLoc, Location akNewLoc)
	if ((akOldLoc == BostonAirportLocation) && (akNewLoc != BostonAirportLocation))
		RemoveMusicOverride()
	EndIf
EndEvent


;------------------------------------
; Timer
;---------------------

Event OnTimer(int timerID)
	if (timerID == ZoneCheckTimerID) ;1
		;All Phases - Zone Tracking System
		;Debug.Trace("---Inst307Fight Zone Update")
		int newActiveZone = FindActiveZone()
		if (activeZone != newActiveZone)
			SetActiveZone(newActiveZone)
			StartTimer(0.1, ZoneCheckTimerID)
		ElseIf (notInBaseZoneCount > 0)
			;The player may have left the base. Don't update the zone yet,
			;but check again to see if this is the case on the next timer loop.
			StartTimer(1, ZoneCheckTimerID)
		Else
			;Debug.Trace("Zone Check Dropout")
			zoneCheckTimerRunning = False
		EndIf
	ElseIf (timerID == GarbageTimerID) ;2
		;All Phases - Cleanup System
		CheckForCleanup()
		;If anything is left to clean up, restart the timer.
		if (garbage.Length > 0)
			;Debug.Trace("Inst307Fight Cleanup Restarts.---")
			StartTimer(3, GarbageTimerID)
		Else
			;Debug.Trace("Inst307Fight Cleanup Ends.---")
			garbageTimerRunning = False
		EndIf
	ElseIf (timerID == VirusSynthTimerID) ;3
		;Phase 3 - Virus Synth Spawn Timer
		;Debug.Trace("---Inst307Fight Virus Synth Timer")
		;When the timer expires, if the player is at the top of the Gantry (zone 20), teleport the synth in.
		if (activeZone == 20)
			;Debug.Trace("In Zone. Spawning...")
			Actor Virus = Alias_Virus.GetActorRef()
			if (player.GetDistance(Inst307Fight_VirusSpawnPoint01) < player.GetDistance(Inst307Fight_VirusSpawnPoint02))
				Virus.MoveTo(Inst307Fight_VirusSpawnPoint01)
			Else
				Virus.MoveTo(Inst307Fight_VirusSpawnPoint02)
			EndIf
			if (oldVirusSynth != None)
				oldVirusSynth.DisableNoWait(True)
				oldVirusSynth.Delete()
			EndIf
			Virus.Enable()
			Virus.EvaluatePackage()
			Inst307_VirusSynth.ForceRefTo(Virus)
			Inst307VirusSynthActive.SetValue(1)
			Inst307Fight_VirusScene.Start()
		Else
			isVirusSynthActive = False
			;Debug.Trace("Not in Zone. Aborting...")
		EndIf
	ElseIf (timerID == ExtraSynthTimerID) ;4
		;Phase 3 - Extra Synth Spawn Timer
		;Debug.Trace("---Inst307Fight Extra Synth Spawn Timer")
		bool spawnedASynth = SpawnExtraSynthIfNeeded(Phase3_ExtraSynth01)
		if (!spawnedASynth)
			spawnedASynth = SpawnExtraSynthIfNeeded(Phase3_ExtraSynth02)
			if (!spawnedASynth)
				spawnedASynth = SpawnExtraSynthIfNeeded(Phase3_ExtraSynth03)
			EndIf
		EndIf
		;If the battle is still running, and we still have extra synths to spawn, restart the timer.
		if ((Self.GetStage() < 400) && (Inst307Fight_ExtraSynthIndex < Inst307Fight_ExtraSynthBaseActors.Length))
			StartTimer(5, ExtraSynthTimerID)
		EndIf
	ElseIf (timerID == DistantBolts01TimerID) ;5
		;Phase 2 & 3 - Distant Bolts 01
		TriggerDistantBolt()
		if (distantBoltsOn && (Self.GetStage() < 500))
			StartTimer(Utility.RandomFloat(0.5, 4), DistantBolts01TimerID)
		EndIf
	ElseIf (timerID == DistantBolts02TimerID) ;6
		;Phase 2 & 3 - Distant Bolts 02
		TriggerDistantBolt()
		if (distantBoltsOn && (Self.GetStage() < 500))
			StartTimer(Utility.RandomFloat(0.5, 4), DistantBolts02TimerID)
		EndIf
	ElseIf (timerID == DistantBolts03TimerID) ;7
		;Phase 2 & 3 - Distant Bolts 03
		TriggerDistantBolt()
		if (distantBoltsOn && (Self.GetStage() < 500))
			StartTimer(Utility.RandomFloat(0.5, 4), DistantBolts03TimerID)
		EndIf
	ElseIf (timerID == Phase3EnemyEnableTimerID) ;8
		;Phase 3 - Staggered enabling of the Phase 3 BoS enemies.
		TryToEnablePhase3Enemy()
		if (phase3EnemiesEnabled < 5)
			StartTimer(0.5, Phase3EnemyEnableTimerID)
		EndIf
	ElseIf (timerID == BreakoffCombatCheckTimerID) ;9
		;Phase 1 - Breakoff Combat check
		;Debug.Trace("Check for Breakoff.")
		if (!breakoffCombatTimerRunning && (GetStage() < 200) && ((activeZone == -1) || (activeZone == 1) || (activeZone == 4) || (activeZone == 5)))
			;Start the Breakoff Combat timer.
			;Debug.Trace("Start Breakoff Combat Timer")
			breakoffCombatTimerRunning = True
			StartTimer(5, BreakoffCombatTimerID)
		ElseIf (breakoffCombatTimerRunning && !((activeZone == -1) || (activeZone == 1) || (activeZone == 4) || (activeZone == 5)))
			;Stop the Breakoff Combat Timer
			;Debug.Trace("Stop Breakoff Combat Timer")
			breakoffCombatTimerRunning = False
			CancelTimer(BreakoffCombatTimerID)
		EndIf
		if ((activeZone < 9) && (GetStage() < 200))
			StartTimer(10, BreakoffCombatCheckTimerID)
		EndIf
	ElseIf (timerID == BreakoffCombatTimerID) ;10
		;Phase 1 - Breakoff Combat Timer
		BreakoffPerimeterCombat()
	EndIf
EndEvent