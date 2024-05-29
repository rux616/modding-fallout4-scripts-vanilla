Scriptname DN017QuestScript extends DefaultQuestRespawnScriptA
{Quest script for DN017 - Arcjet Systems. Primarily handles the Engine Core events in ArcjetSystems02.}


Group QuestObjects
	ReferenceAlias property Danse Auto Const Mandatory
	{Danse, who is a quest follower in DN017.}

	ReferenceAlias property Companion Auto Const Mandatory
	{Player's Follower.}

	ReferenceAlias property DogmeatCompanion Auto Const Mandatory
	{Dogmeat}

	Quest property DN017_Overrides Auto Const Mandatory
	{DN017 Overrides quest; has a high priority to force packages onto the Companion and Dogmeat.}

	ActorValue property Health Auto Const Mandatory
	{Health AV}

	Scene property BoS101ArcJetComputerScene00 Auto Const Mandatory
	{Button fail, out of power.}

	Scene property BoS101ArcJetComputerScene01a Auto Const Mandatory
	{Power restored.}

	Scene property BoS101ArcJetComputerScene01b Auto Const Mandatory
	{Danse comments on power.}

	Scene property BoS101ArcJetComputerScene01c Auto Const Mandatory
	{Danse calls out about incoming synths.}

	Scene property BoS101ArcJetComputerScene01d Auto Const Mandatory
	{Danse 'Ambush!' line}

	Scene property BoS101ArcJetComputerScene02 Auto Const Mandatory
	{Test fire countdown.}

	Scene property BoS101ArcJetComputerScene03 Auto Const Mandatory
	{Test fire completed.}
EndGroup


Group PowerEventObjects
	ObjectReference[] property PowerEnableMarkers Auto Const Mandatory
	{Array of objects enabled when the power turns on.}

	ObjectReference[] property PowerDisableMarkers Auto Const Mandatory
	{Array of objects disabled when the power turns on.}

	ElevatorMasterScript property DN017_ArcjetEngineCoreUtilityElevator Auto Const Mandatory
	{DN017 ArcjetSystems02 Elevator; becomes functional when the power turns on.}

	LoadElevatorPanelScript property DN017_ArcjetEngineCoreSurfaceElevator Auto Const Mandatory
	{DN017 Surface Elevator; becomes functional when the power turns on.}

	ObjectReference property ArcjetSystems02_ElevatorLoadDoorBottom Auto Const Mandatory
	{Faux load doors used to help Danse move through the elevator.}

	ObjectReference property ArcjetSystems02_ElevatorLoadDoorTop Auto Const Mandatory
	{Faux load doors used to help Danse move through the elevator.}
	
	Message property ElevatorDeactivatedMesssage Auto Const Mandatory
	{Standard deactivated message. Replaces 'Out of Power' during the rocket fire sequence.}

	Sound property OBJPowerGeneratorTurbine01On Auto Const Mandatory
	{Sound for the Generator}

	ObjectReference property DN017_OBJPowerGeneratorTurbine01LPmarker Auto Const Mandatory
	{Sound marker for the Generator}

	ObjectReference property DN017_FacilitiesRoomLight Auto Const Mandatory
	{Sound marker for the Facilities Room lights.}

	Default2StateActivator property DN017_EngineCoreControlRoomDoor Auto Const Mandatory
	{Door that seals the control room until the power is turned on, or while the rocket is firing.}

	Default2StateActivator property DN017_EngineCoreMidlevelDoor Auto Const Mandatory
	{Door that seals the midlevel while the rocket is firing.}

	Sound property QSTArcJetLightsOnA Auto Const Mandatory
	{Sound for the first set of lights that turn on.}

	Sound property QSTArcJetLightsOnB Auto Const Mandatory
	{Sound for the second set of lights that turn on.}

	ObjectReference property DN017_PowerUpSFXMarker Auto Const Mandatory
	{Source to play the lights on sounds from.}
EndGroup


Group ButtonObjects
	DN017_ToggleButtonRocketScript property RocketButton Auto Const Mandatory
	{Toggle button that fires the rocket.}

	DN017_ToggleButtonDoorScript[] property DoorButtons Auto Const Mandatory
	{Toggle button that controls the blast doors.}
EndGroup


Group SecurityGateObjects
	Default2StateActivator property DN017_SecurityGateOuter Auto Const Mandatory
	{Outer Security Gate}

	Default2StateActivator property DN017_SecurityGateInner Auto Const Mandatory
	{Inner Security Gate}
EndGroup


Group RocketObjects
	ObjectReference property DN017_ArcjetEngine Auto Const Mandatory
	{The rocket itself.}

	ObjectReference property DN017_RocketFireHazards_Primary Auto Const Mandatory
	{Primary fire damage hazards, in the core.}

	ObjectReference property DN017_RocketFireHazards_Secondary Auto Const Mandatory
	{Secondary fire damage hazards, in the hallway.}

	ObjectReference property DN017_Char_EmbersOff Auto Const Mandatory
	{Embers-Off Enable Marker.}

	ObjectReference property DN017_Char_EmbersOn Auto Const Mandatory
	{Embers-On Enable Marker.}

	ObjectReference property DN017_HallwaySmokeRef Auto Const Mandatory
	{Hallway Smoke effects marker.}

	ObjectReference property DN017_RocketMusicActivator Auto Const Mandatory
	{Music Activator to trigger once the rocket finishes firing.}

	Perk property DN017_DanseSynthInvulnerabilityPerk Auto Const Mandatory
	{Danse's synth invulnerability perk.}
EndGroup


Group SynthBattleObjects
	Quest property BoS101 Auto Const Mandatory
	{BoS101}

	ReferenceAlias[] property SynthAliases Auto Const Mandatory
	{Array of Synth aliases involved in the fight.}

	ObjectReference property DN017_SynthsEnterCombatTriggerRef Auto Const Mandatory
	{Trigger that, when enabled, EVPs synths as they enter it.}

	Scene property BoS101SceneAfterFight Auto Const Mandatory
	{Danse's post-fight scene if the player doesn't fire the rocket to end the fight.}

	int property stopFightAfterRespawnCount = 12 Auto Const
	{Stop respawning Synths after how many respawns?}

	float property beginForcekillsAfterDelay = 5.0 Auto Const
	{Begin force-killing synths after how many seconds?}

	float property assaultStopTime Auto Hidden
	{Timestamp that records when StopAssaultEncounter was called. We start forcekilling beginForcekillsAfterDelay seconds later.}

	bool property assaultEncounterDoneBeforeRocket = True Auto Hidden
	{Did the player complete the encounter before firing the rocket? Determines how Danse's post-fight dialogue works.}
EndGroup
int myRespawnCount
bool trackingRespawns					;Are we tracking respawns? Until the player engages with the fight, don't count them (infinite respawns).
bool forcekillIgnoresLoS					;Should the Forcekill function ignore the player's LoS? True only if the rocket is in the process of firing.

;Custom Event
CustomEvent DN017RocketFireDisintegrate

;Timer Consts
int RestorePowerTimer1 = 10 Const
int RestorePowerTimer2 = 11 Const
int RestorePowerAmbushTimer = 12 Const
int SynthEncounterCompletionTimer = 20 Const

;Local refs
Actor playerRef
Actor DanseRef
Actor CompanionRef
Actor DogmeatCompanionRef



;---------------
;Initialization
;---------------

Event OnInit()
	playerRef = Game.GetPlayer()
EndEvent


;-------------
;Power Events
;-------------

;When the player uses the terminal to reactivate the generator, start a timer to handle it.
;This effectively means the power won't actually turn on until you've exited the terminal, which looks better.
Function RestartGenerator()
	StartTimer(0, RestorePowerTimer1)
EndFunction

;When the player leaves the generator room, start a timer to restore power to the rest of the space without
;causing the rest of the quest script to block.
Function ExitGeneratorRoom()
	;Fork a timer thread to restore the power without causing the quest script to block.
	StartTimer(0, RestorePowerTimer2)
EndFunction


;-------------
;Door Buttons
;-------------

;Called when the player pushes one of the toggle buttons that controls the blast door.
Function DoorButtonActivated()
	;Block all of the door buttons until we're done.
	int i = 0
	While (i < DoorButtons.Length)
		DoorButtons[i].SetBusy(True)
		i = i + 1
	EndWhile

	;Open or close the doors.
	if (DN017_SecurityGateOuter.isOpen)
		DN017_SecurityGateInner.SetOpenNoWait(False)
		DN017_SecurityGateOuter.SetOpen(False)
	Else
		DN017_SecurityGateInner.SetOpenNoWait(True)
		DN017_SecurityGateOuter.SetOpen(True)
	EndIf

	;Enable/Disable the Rocket Fire vfx, sfx, and hazards as necessary.
	UpdateRocketFireEffectsState()

	;Allow the buttons to be activated again.
	i = 0
	While (i < DoorButtons.Length)
		DoorButtons[i].SetBusy(False)
		i = i + 1
	EndWhile
EndFunction


;---------------------------------------
;Rocket Button & Rocket Firing Sequence
;---------------------------------------

;Called when the player pushes the button that fires the rocket.
Function RocketButtonActivated()
	;Set Stage 90, indicating that the player has begun the rocket firing sequence.
	SetStage(90)

	;Disable the elevator while the rocket is firing.
	DN017_ArcjetEngineCoreUtilityElevator.DeactivatedMessage = ElevatorDeactivatedMesssage
	DN017_ArcjetEngineCoreUtilityElevator.MakeElevatorNonFunctional()
	DN017_ArcjetEngineCoreSurfaceElevator.MakeElevatorNonFunctional()
	UpdateElevatorLoadDoors(False)

	;Close the blast doors on the mid and upper levels while the rocket is firing.
	DN017_EngineCoreControlRoomDoor.SetOpenNoWait(False)
	DN017_EngineCoreMidlevelDoor.SetOpenNoWait(False)

	;Store off local refs.
	DanseRef = Danse.GetActorRef()
	CompanionRef = Companion.GetActorRef()
	DogmeatCompanionRef = DogmeatCompanion.GetActorRef()

	;Make Danse invulnerable to the synths during the firing sequence.
	DanseRef.AddPerk(DN017_DanseSynthInvulnerabilityPerk)

	;Start the Overrides quest, which packages Danse, the Companion, and Dogmeat to run to safety.
	DN017_Overrides.Start()

	;Engine VFX, Part 1 - Coolant FX
	DN017_ArcjetEngine.PlayAnimation("stage2")

	;Begin the countdown scene.
	BoS101ArcJetComputerScene01a.Stop()
	BoS101ArcJetComputerScene02.Start()
EndFunction

;When BoS101ArcJetComputerScene02 is finished, it calls this function to fire the rocket. 
Function FireRocketPhase2()
	;Once the countdown scene has finished, fire the engine.

	;Record whether the assault encounter was done at this point for later reference.
	assaultEncounterDoneBeforeRocket = GetStageDone(89)
	
	;Engine VFX, Part 2 - Fire Engine
	DN017_ArcjetEngine.PlayAnimation("stage4")
	Utility.Wait(3.5)

	;Watch for Danse, the Companion, or Dogmeat to fall into Bleedout. If they do, set them in NoBleedoutRecovery until the rocket fire is done.
	if (DanseRef != None)
		DanseRef.SetNoBleedoutRecovery(True)
	EndIf
	if (CompanionRef != None)
		CompanionRef.SetNoBleedoutRecovery(True)
	EndIf
	if (DogmeatCompanionRef != None)
		DogmeatCompanionRef.SetNoBleedoutRecovery(True)
	EndIf

	;Set Stage 95, allowing the rocket fire hazard and hallway smoke to turn on.
	SetStage(95)
	UpdateRocketFireEffectsState()

	;Stop the assault encounter and kill all of the synths.
	if (!assaultEncounterDoneBeforeRocket)
		forcekillIgnoresLoS = True
		StopAssaultEncounter()
		Self.SendCustomEvent("DN017RocketFireDisintegrate")
	EndIf

	;Continue waiting while effects play.
	Utility.Wait(2.5)

	;If any synths somehow remain, kill them.
	ForcekillAssaultEncounter()

	;Swap the floor for the char with embers.
	DN017_Char_EmbersOn.Enable()
	DN017_Char_EmbersOff.DisableNoWait()

	;Remove Danse's invulnerability to the synths.
	DanseRef.RemovePerk(DN017_DanseSynthInvulnerabilityPerk)

	;Wait a bit longer while the engine continues to fire.
	Utility.Wait(7)

	;Engine VFX, Part 3 - Finish Firing
	DN017_ArcjetEngine.PlayAnimation("stage6")
	DN017_HallwaySmokeRef.PlayAnimation("reset")
	Utility.Wait(1)

	;Set Stage 99, indicating that the rocket firing sequence has ended. This also turns off the rocket fire hazard.
	SetStage(99)
	UpdateRocketFireEffectsState()

	;Continue waiting for effects to finish.
	Utility.Wait(2)

	;Trigger the music activator.
	DN017_RocketMusicActivator.Activate(DN017_ArcjetEngine)

	;BoS101 - Computer announces that the test is complete.
	BoS101ArcJetComputerScene02.Stop()
	BoS101ArcJetComputerScene03.Start()

	;Enable the elevators.
	DN017_ArcjetEngineCoreUtilityElevator.MakeElevatorFunctional()
	DN017_ArcjetEngineCoreSurfaceElevator.MakeElevatorFunctional()
	UpdateElevatorLoadDoors(True)

	;Clear the Companion and DogmeatCompanion from NoBleedoutRecovery.
	float currentHealth
	if (CompanionRef != None)
		CompanionRef.SetNoBleedoutRecovery(False)
	EndIf
	if (DogmeatCompanionRef != None)
		DogmeatCompanionRef.SetNoBleedoutRecovery(False)
	EndIf

	;If the assault encounter finished before the rocket was fired, allow Danse to recover.
	;Otherwise, keep him in NoBleedoutRecovery and AllowBleedoutDialogue until the player goes over and talks to him.
	if (DanseRef != None)
		if (assaultEncounterDoneBeforeRocket)
			DanseRef.SetNoBleedoutRecovery(False)
		Else
			DanseRef.AllowBleedoutDialogue(True)
			BoS101.SetStage(270)
		EndIf
	EndIf

	;Shut down the Overrides quest.
	DN017_Overrides.Stop()

	;Reopen the blast doors.
	DN017_EngineCoreControlRoomDoor.SetOpenNoWait(True)
	DN017_EngineCoreMidlevelDoor.SetOpenNoWait(True)
	if (!DN017_SecurityGateOuter.isOpen)
		DoorButtonActivated()
	EndIf
EndFunction


;If the player fired the rocket to end the assault encounter, they have to go speak with Danse while he's in bleedout.
;Allow him to get up when requested by BoS101.
Function AllowDanseToRecover()
	if (DanseRef != None)
		DanseRef.SetNoBleedoutRecovery(False)
		DanseRef.AllowBleedoutDialogue(False)
		float currentHealth = DanseRef.GetValue(Health)
		if (currentHealth < 0)
			DanseRef.RestoreValue(Health, currentHealth * -1 + 1)
		EndIf
	EndIf
EndFunction


;Utility function. Check whether the rocket fire vfx, sfx, and hazards should be enabled or disabled.
Function UpdateRocketFireEffectsState()
	if (GetStageDone(95) && !GetStageDone(99))
		;While the rocket is firing, the primary hazards are always on.
		;Debug.Trace("Primary hazards enabled.")
		DN017_RocketFireHazards_Primary.EnableNoWait()

		;If the player left the blast doors open, the secondary hazards turn on, too.
		if (DN017_SecurityGateOuter.isOpen)
			;Debug.Trace("Secondary hazards enabled.")
			DN017_HallwaySmokeRef.PlayAnimation("stage2")
			DN017_RocketFireHazards_Secondary.EnableNoWait()
		Else
			;Debug.Trace("Secondary hazards disabled.")
			DN017_HallwaySmokeRef.PlayAnimation("reset")
			DN017_RocketFireHazards_Secondary.DisableNoWait()
		EndIf
	Else
		DN017_HallwaySmokeRef.PlayAnimation("reset")
		DN017_RocketFireHazards_Primary.DisableNoWait()
		DN017_RocketFireHazards_Secondary.DisableNoWait()
	EndIf
EndFunction

Function UpdateElevatorLoadDoors(bool shouldEnable)
	if (shouldEnable)
		ArcjetSystems02_ElevatorLoadDoorBottom.EnableNoWait()
		ArcjetSystems02_ElevatorLoadDoorTop.EnableNoWait()
	Else
		ArcjetSystems02_ElevatorLoadDoorBottom.DisableNoWait()
		ArcjetSystems02_ElevatorLoadDoorTop.DisableNoWait()
	EndIf
EndFunction


;-----------------------
;Synth Encounter Events
;-----------------------
;
;DN017QuestScript extends DefaultQuestRespawnScriptA, overriding some of its functions to:
; - Track respawning once the player engages in the combat (enters the combat area or hits any enemy).
; - Identify when a predetermined number of enemies have respawned and been killed.
; - Force-kill all of the surviving enemies in the encounter when the rocket fires.


;Called at the end of BoS101ArcJetComputerScene01b. Starts the combat.
Function StartAssaultEncounter()
	;Debug.Trace("Start Assault Encounter Starts")

	;Enable a trigger to EVP the synths as they run in.
	DN017_SynthsEnterCombatTriggerRef.Enable()

	;Enable the Synths and begin the fight.
	int i = 0
	Actor synth
	While (i < SynthAliases.Length)
		synth = SynthAliases[i].GetActorRef()
		synth.EnableNoWait()
		;Delay slightly for combat pacing.
		Utility.Wait(0.25)
		synth.EvaluatePackage()
		i = i + 1
	EndWhile
EndFunction


;When the player enters the combat area or hits any enemy, start tracking respawns. Respawns are now finite.
Function EngageAssaultEncounter()
	;Debug.Trace("Player engages with the encounter.")
	trackingRespawns = True
EndFunction


;Handles respawning of enemies.
Function TryToRespawn(ReferenceAlias aliasToRespawn)
	;If we're tracking respawns, increment the counter.
	if (trackingRespawns)
		myRespawnCount = myRespawnCount + 1
	EndIf
	;Debug.Trace("Respawn Count=" + myRespawnCount)
	if (myRespawnCount < stopFightAfterRespawnCount)
		;Until we reach the limit, allow enemies to respawn.
		Parent.TryToRespawn(aliasToRespawn)
	ElseIf (!GetStageDone(88))
		;Once at the limit, stop the encounter.
		SetStage(88)
	Else
		;Thereafter, when an enemy dies, reset the assaultStopTime counter, delaying the force kill until absolutely necessary.
		if (assaultStopTime > 0)
			assaultStopTime = Utility.GetCurrentRealTime()
		EndIf
	EndIf
EndFunction


;When TryToRespawn sets myRespawnCount to the limit value (stopFightAfterRespawnCount), Stage 88 is set.
;That stage ultimately calls back to here.
Function StopAssaultEncounter()
	;Set Stage 88 to stop further respawning, if it hasn't already been set.
	SetStage(88)
	;Record the current time. If nothing else changes, we start forcekilling actors beginForcekillsAfterDelay seconds later.
	assaultStopTime = Utility.GetCurrentRealTime()
	;Start a timer to begin monitoring for when the encounter is complete.
	StartTimer(1, SynthEncounterCompletionTimer)
EndFunction


;As part of the timer loop, we eventually start killing actors that may have become stuck so the quest can continue.
Function ForcekillAssaultEncounter()
	;Once we start forcekilling enemies, make sure we do so on all subsequent timer loops.
	assaultStopTime = 0

	;Debug.Trace("Forcekilling Enemies")
	int i = 0
	While (i < SynthAliases.Length)
		Actor synth = SynthAliases[i].GetActorRef()
		if (synth != None)
			bool playerHasLoS = playerRef.HasDetectionLOS(synth)
			if ((!synth.IsDead()) && (forcekillIgnoresLoS || !playerHasLoS))
				synth.Kill()
				;Hide the corpses of any synths who may have become stuck.
				if ((forcekillIgnoresLoS && !playerHasLoS) || ((synth.GetDistance(playerRef) > 1024) && !playerHasLoS))
					synth.DisableNoWait()
					synth.Delete()
				EndIf
				;Debug.Trace("Forcekilled " + i)
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Called when all synths are dead.
Function CompleteAssaultEncounter()
	;Disable the synth EVP trigger.
	DN017_SynthsEnterCombatTriggerRef.Disable()

	;SetStage 89 to record that the encounter is done.
	SetStage(89)

	;Clear the Synth aliases so their dead actors don't remain persistent.
	int i = 0
	While (i < SynthAliases.Length)
		SynthAliases[i].Clear()
		i = i + 1
	EndWhile

	;Play Danse's post-encounter scene if relevant.
	if (assaultEncounterDoneBeforeRocket)
		Utility.Wait(1.5)
		BoS101SceneAfterFight.Start()
	EndIf
EndFunction


;-------
;Timers
;-------

Event OnTimer(int timerID)
	if (timerID == RestorePowerTimer1)
		;Timer for restoring power in the generator room.
		;Play SFX for Generator powering up.
		OBJPowerGeneratorTurbine01On.Play(DN017_OBJPowerGeneratorTurbine01LPmarker)

		;Start the ambush. This includes some latent calls, so better to do it in another timer...
		StartTimer(0, RestorePowerAmbushTimer)

		;Pause before continuing...
		Utility.Wait(0.5)

		;Enable Generator audio marker.
		DN017_OBJPowerGeneratorTurbine01LPmarker.Enable()

		;Play the power on sfx.
		QSTArcJetLightsOnA.Play(DN017_FacilitiesRoomLight)

		;Turn on the power in the Facilities Room only.
		PowerEnableMarkers[0].EnableNoWait()
		PowerDisableMarkers[0].DisableNoWait()

		;Play a scene from the computer adknowledging that the power is back on.
		BoS101ArcJetComputerScene01a.Start()
	ElseIf (timerID == RestorePowerAmbushTimer)
		;Begin the synth assault in the main chamber.
		SetStage(86)

		;Play 'Ambush!' scene.
		BoS101ArcJetComputerScene01d.Start()
	ElseIf (timerID == RestorePowerTimer2)
		;Timer for restoring power to the rest of the cell.
		;Enable the Elevators
		if (!GetStageDone(90))
			DN017_ArcjetEngineCoreUtilityElevator.MakeElevatorFunctional()
			DN017_ArcjetEngineCoreSurfaceElevator.MakeElevatorFunctional()
		EndIf

		;Open the Control Room door.
		DN017_EngineCoreControlRoomDoor.SetOpenNoWait(True)

		;Enable the buttons.
		RocketButton.SetActive(True)
		int i = 0
		While (i < DoorButtons.Length)
			DoorButtons[i].SetActive(True)
			i = i + 1
		EndWhile

		;Turn on the rest of the lights.
		i = 1
		While (i < PowerEnableMarkers.Length)
			PowerEnableMarkers[i].EnableNoWait()
			PowerDisableMarkers[i].DisableNoWait()
			QSTArcJetLightsOnB.Play(DN017_PowerUpSFXMarker)
			Utility.Wait(1.5)
			i = i + 1
		EndWhile
	ElseIf (timerID == SynthEncounterCompletionTimer)
		;Timer that monitors whether the synth assault encounter is complete. When it is, it sets stage 89.
		;Should we try to forcekill any survivors?
		;Debug.Trace("Synth timer check: " + assaultStopTime + "+" + beginForcekillsAfterDelay + " : " + Utility.GetCurrentRealTime())
		if ((assaultStopTime + beginForcekillsAfterDelay) < Utility.GetCurrentRealTime())
			ForcekillAssaultEncounter()
		EndIf
		;Check to see if any synths are still alive.
		bool synthFoundAlive = False
		int i = 0
		While ((!synthFoundAlive) && (i < SynthAliases.Length))
			Actor synth = SynthAliases[i].GetActorRef()
			if ((synth != None) && (!synth.IsDead()))
				;We've found a living synth, so break out of the loop.
				;Debug.Trace("LIVE: " + synth)
				synthFoundAlive = True
			;Else
				;Debug.Trace("DEAD: " + synth)
			EndIf
			i = i + 1
		EndWhile
		if (synthFoundAlive)
			;Debug.Trace("Living synth found. Continue to wait...")
			StartTimer(1, SynthEncounterCompletionTimer)
		Else
			;Debug.Trace("All synths dead. Finishing battle.")
			CompleteAssaultEncounter()
		EndIf
	EndIf
EndEvent