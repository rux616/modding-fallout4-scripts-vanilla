Scriptname DLC04:DLC04GZNukaGalaxyQuestScript Extends Quest Conditional

Scene[] property NukaGalaxyPrePowerScenes Auto Const Mandatory
Scene[] property NukaGalaxyPAScenes Auto Const Mandatory
int PowerRestoredStage_CONST = 2000 Const

bool property usingRideModeLighting Auto Hidden Conditional
int property sceneIndex Auto Hidden Conditional
NukaGalaxyCoasterData[] property CoasterData Auto Const Mandatory
NukaGalaxyCoasterData property ActiveCoasterData Auto
int NukaGalaxyCoasterTimerID = 1 Const
int RideLightingTimerID = 2 Const
InputEnableLayer controlLayer

Sound property QSTArcJetLightsOnB Auto Const Mandatory

ReferenceAlias property Companion Auto Const Mandatory
ReferenceAlias property DogmeatCompanion Auto Const Mandatory

ObjectReference property DLC04GZNukaGalaxy_RideOffLightsAndFixtures Auto Const Mandatory
ObjectReference property DLC04GZNukaGalaxy_RideOnLightsAndFixtures Auto Const Mandatory
ObjectReference property DLC04GZNukaGalaxy_FollowerWarpMarker Auto Const Mandatory
RefCollectionAlias property DLC04GZNukaGalaxyEnemies_AlienInvaders Auto Const Mandatory
RefCollectionAlias property DLC04GZNukaGalaxyEnemies_ColonyRobots Auto Const Mandatory
Sound property DLC04OBJRollerCoasterBoardsBreak Auto Const Mandatory
Default2StateActivator property DLC04GZ_NukaGalaxyAirlockDoor Auto Const Mandatory
ActorValue property Health Auto Const Mandatory
Quest property DLC04GZNukaGalaxyRideHelper Auto Const Mandatory

Struct NukaGalaxyCoasterData
	String name
	bool omit
	Scene CoasterScene
	EMSystemTurfScript EMTurf01
	EMSystemTurfScript EMTurf02
	DLC04:DLC04GZEMSystemTurfScript DLC04EMTurf01
	DLC04:DLC04GZEMSystemTurfScript DLC04EMTurf02
	DLC04:DLC04_GZVaultTecEnemyTriggerScript ETrigger01
	DLC04:DLC04_GZNukaGalaxyLightMarkerScript LightMarker
	DLC04:DLC04_GZNukaGalaxyLightMarkerScript TurretMarker
EndStruct	 

;Called by DLC04GZ_NukaGalaxyCellDummy when the cell loads, to make sure everything is set up and in the correct state.
Function CellLoaded()
	if (!Self.GetStageDone(PowerRestoredStage_CONST))
		;Start the pre-power scenes.
		Debug.Trace("Starting Pre Power Scenes")
		StartScenes(NukaGalaxyPrePowerScenes)
	Else
		;Start the post-power scenes.
		StartScenes(NukaGalaxyPAScenes)
	EndIf
	;Either way, restart the Colony Combatants and shut the airlock door.
	RestartColonyCombatants()
	DLC04GZ_NukaGalaxyAirlockDoor.SetOpenNoWait(False)
EndFunction

Function StartPrePowerScenes()
	StartScenes(NukaGalaxyPrePowerScenes)
EndFunction

Function StopPrePowerScenes()
	StopScenes(NukaGalaxyPrePowerScenes)
EndFunction

Function StartPAScenes()
	StartScenes(NukaGalaxyPAScenes)
EndFunction

Function StopPAScenes()
	StopScenes(NukaGalaxyPAScenes)
EndFunction

Function StartScenes(Scene[] s)
	int i = 0
	While (i < s.Length)
		;Debug.Trace("Starting " + s[i])
		s[i].Start()
		i = i + 1
	EndWhile
EndFunction

Function StopScenes(Scene[] s)
	int i = 0
	While (i < s.Length)
		;Debug.Trace("Stopping " + s[i])
		s[i].Stop()
		i = i + 1
	EndWhile
EndFunction


Function DisablePlayerControls()
	Game.GetPlayer().SetGhost(True)
	controlLayer.DisablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
EndFunction

Function EnablePlayerControls()
	Game.GetPlayer().SetGhost(False)
	controlLayer.Reset()
EndFunction

Function StartCoaster()
	sceneIndex = 0
	controlLayer = InputEnableLayer.Create()
	DisablePlayerControls()
	ActiveCoasterData = CoasterData[CoasterData.Length - 1]
	AdvanceCoaster()
	RestartColonyCombatants()
	StopPAScenes()
	DLC04GZNukaGalaxyRideHelper.Start()
EndFunction

Function AdvanceCoaster()
	if (sceneIndex >= CoasterData.Length)
		Debug.Trace("ERROR: Coaster scene index out of range. " + sceneIndex, 2)
		return
	EndIf

	int myIndex = sceneIndex
	NukaGalaxyCoasterData newCoasterData = CoasterData[sceneIndex]
	sceneIndex = sceneIndex + 1
	Debug.Trace("COASTER EVENT " + sceneIndex + " : " + newCoasterData.Name)

	if (newCoasterData.omit)
		sceneIndex = sceneIndex + 1
		AdvanceCoaster()
		return
	EndIf

	;Start the scene.
	if (newCoasterData.CoasterScene != None)
		newCoasterData.CoasterScene.ForceStart()
	EndIf

	;Turn on the EM System Turfs.
	;EMS Triggers shut themselves off based on their own internal timer.
	bool shouldRunEMSTimer = False
	if (newCoasterData.EMTurf01 == ActiveCoasterData.EMTurf01)
		;Do nothing.
	Elseif (newCoasterData.EMTurf01 != None)
		newCoasterData.EMTurf01.WakeUp()
		shouldRunEMSTimer = True
	EndIf
	if (newCoasterData.EMTurf02 == ActiveCoasterData.EMTurf02)
		;Do nothing.
	Elseif (newCoasterData.EMTurf02 != None)
		newCoasterData.EMTurf02.WakeUp()
		shouldRunEMSTimer = True
	EndIf
	if (newCoasterData.DLC04EMTurf01 == ActiveCoasterData.DLC04EMTurf01)
		;Do nothing.
	Elseif (newCoasterData.DLC04EMTurf01 != None)
		Debug.Trace("Waking turf " + newCoasterData.DLC04EMTurf01)
		newCoasterData.DLC04EMTurf01.WakeUp()
		shouldRunEMSTimer = True
	EndIf
	if (newCoasterData.DLC04EMTurf02 == ActiveCoasterData.DLC04EMTurf02)
		;Do nothing.
	Elseif (newCoasterData.DLC04EMTurf02 != None)
		Debug.Trace("Waking turf " + newCoasterData.DLC04EMTurf02)
		newCoasterData.DLC04EMTurf02.WakeUp()
		shouldRunEMSTimer = True
	EndIf
	if (shouldRunEMSTimer)
		StartTimer(0, NukaGalaxyCoasterTimerID)
	EndIf

	;Turn on enemies in Enemy Triggers.
	;Enemy triggers don't shut off.
	if (newCoasterData.ETrigger01 != None)
		newCoasterData.ETrigger01.TriggerEnemies()
	EndIf

	;Turn on the lights.
	;Lights will shut themselves off based on their internal timers.
	if (newCoasterData.LightMarker != None)
		newCoasterData.LightMarker.TurnOnLights(False)
	EndIf

	;Turn on the turrets.
	;Turrets will shut themselves off when their associated lights shut off.
	if (newCoasterData.TurretMarker != None)
		newCoasterData.TurretMarker.TurnOnTurrets(False)
	EndIf

	;Handle Special Cases
	if (newCoasterData.name == "Trigger_BreakBoards")
		BreakBreakableBoardWall()
	EndIf

	if ((myIndex + 1) == sceneIndex)
		ActiveCoasterData = newCoasterData
		Debug.Trace("ActiveCoasterData now index " + myIndex)
	EndIf
EndFunction


ObjectReference property DLC04GZNukaGalaxyBreakableBoardsWallStart Auto Const Mandatory

Function BreakBreakableBoardWall()
	DLC04OBJRollerCoasterBoardsBreak.Play(DLC04GZNukaGalaxyBreakableBoardsWallStart)
	ObjectReference[] boards = DLC04GZNukaGalaxyBreakableBoardsWallStart.GetLinkedRefChain()
	boards.Add(DLC04GZNukaGalaxyBreakableBoardsWallStart)
	int i = 0
	While (i < boards.Length)
		boards[i].DamageObject(1000)
		i = i + 1
	EndWhile
EndFunction

Function EndCoaster()
	sceneIndex = 0
	EnablePlayerControls()
	controlLayer.Delete()
	controlLayer = None
	StartPAScenes()
	DLC04GZNukaGalaxyRideHelper.Stop()
	CancelTimer(NukaGalaxyCoasterTimerID)
	if (Companion.GetActorRef() != None)
		Companion.GetActorRef().MoveTo(DLC04GZNukaGalaxy_FollowerWarpMarker)
	EndIf
	if (DogmeatCompanion.GetActorRef() != None)
		DogmeatCompanion.GetActorRef().MoveTo(DLC04GZNukaGalaxy_FollowerWarpMarker)
	EndIf
	ActiveCoasterData = None
EndFunction


Event OnTimer(int timerID)
	if (timerID == NukaGalaxyCoasterTimerID)
		if (ActiveCoasterData != None)
			bool performedAction = False
			if (ActiveCoasterData.EMTurf01 != None)
				ActiveCoasterData.EMTurf01.StartUpdateActorsTimer()
				ActiveCoasterData.EMTurf01.StartIdleEncounterTimer()
				performedAction = True
			EndIf
			if (ActiveCoasterData.EMTurf02 != None)
				ActiveCoasterData.EMTurf02.StartUpdateActorsTimer()
				ActiveCoasterData.EMTurf02.StartIdleEncounterTimer()
				performedAction = True
			EndIf
			if (ActiveCoasterData.DLC04EMTurf01 != None)
				ActiveCoasterData.DLC04EMTurf01.StartUpdateActorsTimer()
				ActiveCoasterData.DLC04EMTurf01.StartIdleEncounterTimer()
				performedAction = True
			EndIf
			if (ActiveCoasterData.DLC04EMTurf02 != None)
				ActiveCoasterData.DLC04EMTurf02.StartUpdateActorsTimer()
				ActiveCoasterData.DLC04EMTurf02.StartIdleEncounterTimer()
				performedAction = True
			EndIf
			if (performedAction)
				StartTimer(4, NukaGalaxyCoasterTimerID)
			EndIf
		EndIf
	ElseIf (timerID == RideLightingTimerID)
		QSTArcJetLightsOnB.Play(Game.GetPlayer())
		ToggleNukaGalaxyLighting(usingRideModeLighting)
	EndIf
EndEvent


Function RestartColonyCombatants()
	RestartColonyCombatantsSingleCollection(DLC04GZNukaGalaxyEnemies_ColonyRobots)
	RestartColonyCombatantsSingleCollection(DLC04GZNukaGalaxyEnemies_AlienInvaders)
	Debug.Trace("Finished RestartCombatants.")
EndFunction

Function RestartColonyCombatantsSingleCollection(RefCollectionAlias myCol)
	int i = 0
	While (i < myCol.GetCount())
		Actor current = myCol.GetAt(i) as Actor
		if ((current != None) && (!current.IsDead()))
			Debug.Trace("Colony Restart for " + current)
			current.EnableAI(False)
			current.MoveToMyEditorLocation()
			current.RestoreValue(Health, 10000)
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function ToggleNukaGalaxyLightingNoWait(bool shouldUseRideModeLighting)
	usingRideModeLighting = shouldUseRideModeLighting
	StartTimer(0.1, RideLightingTimerID)
EndFunction

Function ToggleNukaGalaxyLighting(bool shouldUseRideModeLighting)
	usingRideModeLighting = shouldUseRideModeLighting
	if (usingRideModeLighting)
		DLC04GZNukaGalaxy_RideOffLightsAndFixtures.DisableNoWait()
		DLC04GZNukaGalaxy_RideOnLightsAndFixtures.EnableNoWait()
	Else
		DLC04GZNukaGalaxy_RideOffLightsAndFixtures.EnableNoWait()
		DLC04GZNukaGalaxy_RideOnLightsAndFixtures.DisableNoWait()
	EndIf
EndFunction