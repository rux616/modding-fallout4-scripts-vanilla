Scriptname DLC04:DLC04GZMainQuestScript Extends Quest Conditional
{Script for DLC04GZMainQuest, the Galactic Zone quest.}

Group Autofill_Properties
	GlobalVariable property DLC04GZ_StarCoresInstalled Auto Const Mandatory
	{Number of Star Cores that have been installed.}
	GlobalVariable property DLC04GZ_StarCoresClearTotal Auto Const Mandatory
	{Number of Star Cores needed to secure the zone.}

	;Autofilled. RefCollectionAliases of the enemies in the zone.
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_ExteriorEnemies Auto Const Mandatory
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_NukaGalaxyEnemies Auto Const Mandatory
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_StarlightInterstellarTheaterEnemies Auto Const Mandatory
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_VaultTecAmongTheStarsEnemies Auto Const Mandatory
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_RobCoBattlezoneEnemies Auto Const Mandatory
	DLC04:DLC04GZMainQuestEnemyCollection property DLC04GalacticZone_SubvertedEnemies Auto Const Mandatory

	;Autofilled. Star Core tracking globals.
	GlobalVariable property DLC04GZ_StarCores_ExteriorTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_ExteriorTotal Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_NukaGalaxyTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_NukaGalaxyTotal Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_TheaterTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_TheaterTotal Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_VaultTecTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_VaultTecTotal Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_BattlezoneTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_BattlezoneTotal Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_OutsideTaken Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCores_OutsideTotal Auto Const Mandatory

	;Autofilled. Sub-locations in the zone.
	Location property DLC04GalacticZoneLocation Auto Const Mandatory
	Location property DLC04GalacticZone_NukaGalaxyLocation Auto Const Mandatory
	Location property DLC04GalacticZone_StarlightInterstellarTheaterLocation Auto Const Mandatory
	Location property DLC04GalacticZone_VaultTecAmongTheStarsLocation Auto Const Mandatory
	Location property DLC04GalacticZone_RobCoBattlezoneLocation Auto Const Mandatory

	;Autofilled. Other properties.
	ActorValue property Aggression Auto Const Mandatory
	Faction property PlayerFaction Auto Const Mandatory
	Faction property DLC04GangOperatorsFaction Auto Const Mandatory
	Faction property DLC04GangDisciplesFaction Auto Const Mandatory
	Faction property DLC04GangPackFaction Auto Const Mandatory
	Message property DLC04GZMainQuest_ProtocolReadyMessage Auto Const Mandatory
	Message property DLC04GZMainQuest_ClearReadyMessage Auto Const Mandatory
	Quest property DLC04GZBattlezone Auto Const Mandatory
EndGroup

Group Quest_Properties
	RefCollectionAlias[] property GalacticZoneEnemyRefCollections Auto Const Mandatory
	{The above collections, in an array for easier indexed access. 0=Exterior, 1=NukaGalaxy, 2=Theater, 3=VaultTec, 4=Battlezone.}

	Faction[] property GalacticZoneEnemyFactions Auto Const Mandatory
	{All robots in this zone are assigned to a specific faction. 0=Animatronic, 1=Assaultron, 2=Eyebot, 3=Handy&Gutsy, 4=Nukatron, 5=Protectron, 6=SentryBot, 7=Turret}

	int[] property QuestObjectiveIDs Auto Const Mandatory
	{List of all quest objective numbers.}
EndGroup

Group Conditional_Properties
	;The type of robot the player previously shut down, if any.
	int property SelectiveShutdownFaction1Index = -1 Auto Conditional
	int property SelectiveShutdownFaction2Index = -1 Auto Conditional
	int property LimitedControlFaction1Index = -1 Auto Conditional

	;Which Emergency Protocol options should be available in the terminal.
	bool property IsTrackingBugAvailable Auto Hidden Conditional
	bool property IsSelectiveShutdown1Available Auto Hidden Conditional
	bool property IsSelectiveShutdown2Available Auto Hidden Conditional
	bool property IsLimitedControlAvailable Auto Hidden Conditional

	;Star Core thresholds at which the options become available.
	int property TrackingBugThreshold = 500 Auto Const
	int property SelectiveShutdown1Threshold = 5 Auto Const
	int property SelectiveShutdown2Threshold = 10 Auto Const
	int property LimitedControlThreshold = 15 Auto Const	

	;For each of the RefCollectionAliases, a bool representing whether we're displaying quest targets
	;to the enemies in that location. Used as quest target conditions.
	bool property GalacticZoneExteriorQTsDisplayed = False Auto Hidden Conditional
	bool property NukaGalaxyQTsDisplayed = False Auto Hidden Conditional
	bool property TheaterQTsDisplayed = False Auto Hidden Conditional
	bool property VaultTecQTsDisplayed = False Auto Hidden Conditional
	bool property BattlezoneQTsDisplayed = False Auto Hidden Conditional

	;For each of the RefCollectionAliases, a bool representing that the collection is empty.
	;Used as quest target conditions.
	bool property GalacticZoneExteriorCleared Auto Hidden Conditional
	bool property NukaGalaxyCleared Auto Hidden Conditional
	bool property TheaterCleared Auto Hidden Conditional
	bool property VaultTecCleared Auto Hidden Conditional
	bool property BattlezoneCleared Auto Hidden Conditional
EndGroup

;Local variables.
Actor player

int UpdateStarControlCommandsTimerID = 1 Const
int UpdateEnemiesTimerID = 2 Const
int property SetStage81ObjectiveStageAfterDelayTimerID = 3 Auto Const

;NoWait function temporary value storage.
int protocolTrackRobotsLocationIndex = -1
int protocolSelectiveShutdownFaction1Index = -1
int protocolSelectiveShutdownFaction2Index = -1
int protocolLimitedControlFaction1Index = -1
int protocolTakeControl = -1


;-----------------
;Setup & Shutdown
;-----------------

Function Startup()
	player = Game.GetPlayer()
	Self.RegisterForRemoteEvent(player, "OnLocationChange")
	;StartTimer(5, UpdateEnemiesTimerID)
	SetupInitialFactionReactions()
	SetupAllEnemies()
	UpdateStarCoreGlobals()
EndFunction

Function SetupInitialFactionReactions()
	int i = 0
	While (i < GalacticZoneEnemyFactions.Length)
		PlayerFaction.SetEnemy(GalacticZoneEnemyFactions[i])
		i = i + 1
	EndWhile
EndFunction


;-------------------------------------
;Objective Display on Location Change
;-------------------------------------

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
	Debug.Trace("GZMain: Got a Location Change: " + akNewLoc)
	;if ((akNewLoc == DLC04GalacticZoneLocation) || (DLC04GalacticZoneLocation.IsChild(akNewLoc)))
	;	Debug.Trace("---Started Update Enemies Timer.")
	;	StartTimer(5, UpdateEnemiesTimerID)
	;ElseIf ((akNewLoc != DLC04GalacticZoneLocation) && (!akNewLoc.IsChild(DLC04GalacticZoneLocation)))
	;	Debug.Trace("---Canceled Update Enemies Timer.")
	;	CancelTimer(UpdateEnemiesTimerID)
	;EndIf
	if (GetStageDone(80) && !GetStageDone(1000))
		if (akNewLoc == DLC04GalacticZone_NukaGalaxyLocation)
			SetStage(110)
			DLC04GalacticZone_NukaGalaxyEnemies.UpdateQuestObjectives()
		ElseIf (akNewLoc == DLC04GalacticZone_StarlightInterstellarTheaterLocation)
			SetStage(120)
			DLC04GalacticZone_StarlightInterstellarTheaterEnemies.UpdateQuestObjectives()
		ElseIf (akNewLoc == DLC04GalacticZone_VaultTecAmongTheStarsLocation)
			SetStage(130)
			DLC04GalacticZone_VaultTecAmongTheStarsEnemies.UpdateQuestObjectives()
		ElseIf (akNewLoc == DLC04GalacticZone_RobCoBattlezoneLocation)
			SetStage(140)
			DLC04GalacticZone_RobCoBattlezoneEnemies.UpdateQuestObjectives()
		EndIf
	EndIf
	if (akNewLoc == DLC04GalacticZone_RobCoBattlezoneLocation)
		DLC04GZBattlezone.SetStage(11)
	EndIf
EndEvent


;--------------------------------------------------
;Star Control Terminal: Emergency Protocol Options
;--------------------------------------------------

;Disable all of the Emergency Protocol options.
Function DisableEmergencyProtocolOptions()
	IsTrackingBugAvailable = False
	IsSelectiveShutdown1Available = False
	IsSelectiveShutdown2Available = False
	IsLimitedControlAvailable = False
EndFunction

;	{All robots in this zone are assigned to a specific faction. 0=Animatronic, 1=Assaultron, 2=Eyebot, 3=Handy&Gutsy, 4=Nukatron, 5=Protectron, 6=SentryBot, 7=Turret}
Function StarControl_TrackRobotsNoWait(int locationIndex)
	IsTrackingBugAvailable = False
	protocolTrackRobotsLocationIndex = locationIndex
	StartTimer(0, UpdateStarControlCommandsTimerID)
EndFunction

Function StarControl_ShutdownRobots1NoWait(int raceIndex)
	IsSelectiveShutdown1Available = False
	protocolSelectiveShutdownFaction1Index = raceIndex
	StartTimer(0, UpdateStarControlCommandsTimerID)
EndFunction

Function StarControl_ShutdownRobots2NoWait(int raceIndex)
	IsSelectiveShutdown2Available = False
	protocolSelectiveShutdownFaction2Index = raceIndex
	StartTimer(0, UpdateStarControlCommandsTimerID)
EndFunction

Function StarControl_ControlRobotsNoWait(int raceIndex)
	IsLimitedControlAvailable = False
	protocolLimitedControlFaction1Index = raceIndex
	StartTimer(0, UpdateStarControlCommandsTimerID)
EndFunction

Function StarControl_TakeControlNoWait()
	protocolTakeControl = 1
	StartTimer(0, UpdateStarControlCommandsTimerID)
EndFunction

Event OnTimer(int timerID)
	if (timerID == UpdateStarControlCommandsTimerID)
		if (protocolTakeControl > -1)
			StarControl_TakeControl()
		Else
			if (protocolTrackRobotsLocationIndex > -1)
				StarControl_TrackRobots(protocolTrackRobotsLocationIndex)
				protocolTrackRobotsLocationIndex = -1
			EndIf
			if (protocolSelectiveShutdownFaction1Index > -1)
				StarControl_ShutdownRobots1(protocolSelectiveShutdownFaction1Index)
				protocolSelectiveShutdownFaction1Index = -1
			EndIf
			if (protocolSelectiveShutdownFaction2Index > -1)
				StarControl_ShutdownRobots2(protocolSelectiveShutdownFaction2Index)
				protocolSelectiveShutdownFaction2Index = -1
			EndIf
			if (protocolLimitedControlFaction1Index > -1)
				StarControl_ControlRobots(protocolLimitedControlFaction1Index)
				protocolLimitedControlFaction1Index = -1
			EndIf
		EndIf
	ElseIf (timerID == SetStage81ObjectiveStageAfterDelayTimerID)
		SetStage(81)
	;ElseIf (timerID == UpdateEnemiesTimerID)
	;	Debug.Trace("Update Enemies Timer")
	;	UpdateAllEnemies()
	;	Location currentLocation = player.GetCurrentLocation()
	;	if ((currentLocation == DLC04GalacticZoneLocation) || (DLC04GalacticZoneLocation.IsChild(currentLocation)))
	;		StartTimer(5, UpdateEnemiesTimerID)
	;	EndIf
	Endif
EndEvent

;'Track' the robots in a specific location by providing quest targets to them.
Function StarControl_TrackRobots(int locationIndex)
	if (locationIndex == 0)
		SetStage(101)
	ElseIf (locationIndex == 1)
		SetStage(111)
	ElseIf (locationIndex == 2)
		SetStage(121)
	ElseIf (locationIndex == 3)
		SetStage(131)
	ElseIf (locationIndex == 4)
		SetStage(141)
	EndIf
EndFunction

;Shut down all robots of a specific faction.
Function StarControl_ShutdownRobots1(int factionIndex)
	SelectiveShutdownFaction1Index = factionIndex
	UpdateAllEnemies()
	Debug.Trace("ShutdownRobots1 Exited")
EndFunction

Function StarControl_ShutdownRobots2(int factionIndex)
	SelectiveShutdownFaction2Index = factionIndex
	UpdateAllEnemies()
	Debug.Trace("ShutdownRobots2 Exited")
EndFunction

;Take control of all robots of a specific race, making them hostile to all of the other robots in the zone.
Function StarControl_ControlRobots(int raceIndex)
	LimitedControlFaction1Index = raceIndex
	Faction controlledFaction = GalacticZoneEnemyFactions[raceIndex]
	PlayerFaction.SetAlly(controlledFaction)
	Debug.Trace("Setting " + PlayerFaction + " ally to " + controlledFaction)
	int i = 0
	While (i < GalacticZoneEnemyFactions.Length)
		if (i != raceIndex)
			GalacticZoneEnemyFactions[i].SetEnemy(controlledFaction)
			Debug.Trace("Setting " + GalacticZoneEnemyFactions[i] + " enemy to " + controlledFaction)
		EndIf
		i = i + 1
	EndWhile
	UpdateAllEnemies()
EndFunction

;Take control of all robots in the zone.
Function StarControl_TakeControl()
	;Faction [0], the Animatronics, are a special case-- they remain hostile to all other robots (since the only time they're found in conjunction
	;with other robots is in Nuka-Galaxy, where they're supposed to be fighting the others in the Planetscape tableau).
	PlayerFaction.SetAlly(GalacticZoneEnemyFactions[0])

	;For the other factions, make the player allies to all, and all allies to each other.
	int i = 1
	While (i < GalacticZoneEnemyFactions.Length)
		PlayerFaction.SetAlly(GalacticZoneEnemyFactions[i])
		DLC04GangOperatorsFaction.SetAlly(GalacticZoneEnemyFactions[i])
		DLC04GangDisciplesFaction.SetAlly(GalacticZoneEnemyFactions[i])
		DLC04GangPackFaction.SetAlly(GalacticZoneEnemyFactions[i])
		int j = i + 1
		While (j < GalacticZoneEnemyFactions.Length)
			GalacticZoneEnemyFactions[i].SetAlly(GalacticZoneEnemyFactions[j])
			j = j + 1
		EndWhile
		i = i + 1
	EndWhile
	UpdateAllEnemies(True)
	SetStage(212)
EndFunction


;-------------------
;Star Core Tracking
;-------------------

;Called by DLC04GZTrackingQuestScript as Star Cores are installed.
Function UpdateStarCoreInstallCount(bool isInitialDisplay=False)
	;Update the globals used by the quest objectives.
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCoresInstalled)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCoresClearTotal)

	;Update the available Emergency Protocols.
	int starCoreCount = DLC04GZ_StarCoresInstalled.GetValueInt()
	if (starCoreCount == TrackingBugThreshold)
		IsTrackingBugAvailable = True
	EndIf
	if (starCoreCount == SelectiveShutdown1Threshold)
		IsSelectiveShutdown1Available = True
	EndIf
	if (starCoreCount == SelectiveShutdown2Threshold)
		IsSelectiveShutdown2Available = True
	EndIf
	if (starCoreCount == LimitedControlThreshold)
		IsLimitedControlAvailable = True
	EndIf

	;Update and/or redisplay quest objectives as appropriate.
	if (starCoreCount == DLC04GZ_StarCoresClearTotal.GetValue())
		SetStage(200)
	ElseIf ((isInitialDisplay || Self.IsObjectiveDisplayed(80)) && !Self.IsObjectiveCompleted(80))
		SetObjectiveDisplayed(80, True, True)
	ElseIf (Self.GetStage() == 60)
		SetStage(70)
	EndIf
EndFunction

Function UpdateStarCoreAcquireCount(int starCoresAcquired)
	if (Self.GetStageDone(80))
		if ((starCoresAcquired == TrackingBugThreshold) || (starCoresAcquired == SelectiveShutdown1Threshold) || \
			(starCoresAcquired == SelectiveShutdown2Threshold) || (starCoresAcquired == LimitedControlThreshold))
			DLC04GZMainQuest_ProtocolReadyMessage.Show()
		ElseIf (starCoresAcquired == DLC04GZ_StarCoresClearTotal.GetValueInt())
			DLC04GZMainQuest_ClearReadyMessage.Show()
		EndIf
	EndIf
EndFunction


;--------------------------------
;Enemy Ref Collection Management
;--------------------------------

;Perform initial setup on all six enemy RefCollectionAliases.
Function SetupAllEnemies()
	Debug.Trace("Start SetupAllEnemies")

	DLC04GalacticZone_ExteriorEnemies.SetupEnemies()
	DLC04GalacticZone_NukaGalaxyEnemies.SetupEnemies()
	DLC04GalacticZone_StarlightInterstellarTheaterEnemies.SetupEnemies()
	DLC04GalacticZone_VaultTecAmongTheStarsEnemies.SetupEnemies()
	DLC04GalacticZone_RobCoBattlezoneEnemies.SetupEnemies()

	Debug.Trace("End SetupAllEnemies")
EndFunction

;Update all six enemy RefCollectionAliases.
Function UpdateAllEnemies(bool takingControl=False)
	Debug.Trace("Start UpdateAllEnemies")

	DLC04GalacticZone_ExteriorEnemies.UpdateEnemies(takingControl)
	DLC04GalacticZone_NukaGalaxyEnemies.UpdateEnemies(takingControl)
	DLC04GalacticZone_StarlightInterstellarTheaterEnemies.UpdateEnemies(takingControl)
	DLC04GalacticZone_VaultTecAmongTheStarsEnemies.UpdateEnemies(takingControl)
	DLC04GalacticZone_RobCoBattlezoneEnemies.UpdateEnemies(takingControl)

	Debug.Trace("End UpdateAllEnemies")
EndFunction

bool Function ShouldBeShutDown(Actor a)
	int factionIndex = -1
	int i = 0
	While ((i < GalacticZoneEnemyFactions.Length) && (factionIndex == -1))
		if (a.IsInFaction(GalacticZoneEnemyFactions[i]))
			factionIndex = i
		EndIf
		i = i + 1
	EndWhile
	if (factionIndex == -1)
		Debug.Trace("ERROR: ShouldBeShutDown couldn't find a faction for " + a)
		return False
	Else
		return ((factionIndex == SelectiveShutdownFaction1Index) || (factionIndex == SelectiveShutdownFaction2Index))
	EndIf
EndFunction


;------------------------------------
;Star Core Ref Collection Management
;------------------------------------








Function UpdateQuestObjectives()
	if (DLC04GalacticZone_ExteriorEnemies.CollectionCleared && \
		DLC04GalacticZone_NukaGalaxyEnemies.CollectionCleared && \
		DLC04GalacticZone_StarlightInterstellarTheaterEnemies.CollectionCleared && \
		DLC04GalacticZone_VaultTecAmongTheStarsEnemies.CollectionCleared && \
		DLC04GalacticZone_RobCoBattlezoneEnemies)
	SetStage(300)
	EndIf
EndFunction



Function CleanupObjectives()
	int i = 0
	While (i < QuestObjectiveIDs.Length)
		if (IsObjectiveDisplayed(QuestObjectiveIDs[i]) && !IsObjectiveCompleted(QuestObjectiveIDs[i]))
			SetObjectiveDisplayed(QuestObjectiveIDs[i], False)
		EndIf
		i = i + 1
	EndWhile
EndFunction



Function UpdateStarCoreGlobals()
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_ExteriorTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_ExteriorTotal)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_NukaGalaxyTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_NukaGalaxyTotal)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_TheaterTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_TheaterTotal)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_VaultTecTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_VaultTecTotal)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_BattlezoneTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_BattlezoneTotal)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_OutsideTaken)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCores_OutsideTotal)
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Remote listening for flag raise
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DLC04MQ03 Auto Const Mandatory

Group FlagRaiseProperties
	int Property ExternalFlagRaisedStage = 110 auto const
	int Property ExternalQuestKickoutStage = 1500 auto const
	int Property myFlagRaisedStage = 1500 auto const
	int Property myFlagFailedStage = 1600 auto const
EndGroup

Function ListenForFlagRaise()
	Debug.Trace(Self + " is ListenForFlagRaise on " + DLC04MQ03)
	RegisterForRemoteEvent(DLC04MQ03, "OnStageSet")
EndFunction

Event Quest.OnStageSet(Quest sendingQuest, int auiStageID, int auiItemID)
	Debug.Trace(self + ": recieved OnStageSet from " + sendingQuest)
	Debug.Trace(self + "::: auiStageID = " + auiStageID)
	Debug.Trace(self + "::: auiItemID = " + auiItemID)
	;Flag Was raised!
	if auiStageID == ExternalFlagRaisedStage
		SetStage(myFlagRaisedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	;Flag raised fail due to raider kick out
	elseif auiStageID == ExternalQuestKickoutStage
		SetStage(myFlagFailedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	Endif
EndEvent