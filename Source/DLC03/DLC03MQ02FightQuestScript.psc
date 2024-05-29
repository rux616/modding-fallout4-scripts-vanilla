Scriptname DLC03:DLC03MQ02FightQuestScript extends Quest Conditional
{Quest script for the DLC03MQ02 Fight outside the gates of Far Harbor.}

Group General_Properties
	RefCollectionAlias property JaredAndSurvivors Auto Const Mandatory
	{Jared and his band of survivors.}

	RefCollectionAlias property AllEnemies Auto Const Mandatory
	{All of the current enemies in the fight.}
EndGroup

Group Autofill_Properties
	Scene property DLC03MQ02Fight_SurvivorKilledScene Auto Const Mandatory
	EncounterZone property DLC03FarHarborZone Auto Const Mandatory
	ObjectReference property DLC01MQ02FightEnableMarker Auto Const Mandatory
	ObjectReference property HullGateREF Auto Const Mandatory
EndGroup

;Hidden properties.
int property survivorCount = 4 Auto Hidden Conditional 	;Number of survivors left at the end of the fight.

;Local refs.
Actor player
bool hasRunCleanup

;Local Consts.
int CONST_FightMonitorTimerID = 1 Const
int CONST_SpawnDistance = 1500 Const
int CONST_AutokillDistance = 1250 Const
int CONST_GateKillDistance = 5000 Const


Event OnInit()
	;Store off a ref to the player.
	player = Game.GetPlayer()
	
	;Register for OnDying events for Jared and the Survivors, used to update survivorCount.
	int i = 0
	While (i < JaredAndSurvivors.GetCount())
		Self.RegisterForRemoteEvent(JaredAndSurvivors.GetAt(i) as Actor, "OnDying")
		i = i + 1
	EndWhile

	;Register for Load & Unload events on the quest's enable marker ref.
	Self.RegisterForRemoteEvent(DLC01MQ02FightEnableMarker, "OnLoad")
	Self.RegisterForRemoteEvent(DLC01MQ02FightEnableMarker, "OnUnload")
EndEvent

Event ObjectReference.OnLoad(ObjectReference akSender)
	if (akSender == DLC01MQ02FightEnableMarker)
		if (GetStageDone(40) && !GetStageDone(90))
			;Player has returned to the fight. Resume the Fight Monitor.
			StartFightMonitor()
		EndIf
	EndIf
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSender)
	if (akSender == DLC01MQ02FightEnableMarker)
		if (GetStageDone(40) && !GetStageDone(90))
			;Player has left the fight. Cancel the Fight Monitor.
			StopFightMonitor()
		ElseIf (GetStageDone(100))
			;The fight is over, and the player has left the area.
			CleanupFight()
		EndIf
	EndIf
EndEvent

;Perform final cleanup when the player leaves the area (ObjectReference.OnUnload, above),
;or if the quest aborts because the player makes it to Acadia early (Stage 1000).
Function CleanupFight()
	if (!hasRunCleanup)
		hasRunCleanup = True

		;Disable the perimeter mines, markers, and triggers related to the fight.
		DLC01MQ02FightEnableMarker.DisableNoWait()

		;Clean up Jared and the other survivors.
		int i = 0
		While (i < JaredAndSurvivors.GetCount())
			Actor a = JaredAndSurvivors.GetAt(i) as Actor
			if (a != None)
				a.DisableNoWait()
				a.Delete()
			EndIf
			i = i + 1
		EndWhile

		;Shut down the quest.
		SetStage(1000)
	EndIf
EndFunction

Function CleanupRefCollection(RefCollectionAlias col)
	int i = 0
	While (i < col.GetCount())
		Actor current = col.GetAt(i) as Actor
		if (current != None)
			current.DisableNoWait()
			current.Delete()
		EndIf
		i = i + 1
	EndWhile
	col.RemoveAll()
EndFunction


;------------------------
;Fight Support Functions
;------------------------

;Returns an array of [numToSelect] spawn points, chosen from one of two chains of markers based on what the player can see.
ObjectReference[] Function SelectSpawnPoint(int numToSelect, ObjectReference primarySpawnPointStart, ObjectReference secondarySpawnPointStart)
	;Create our return array.
	ObjectReference[] result = new ObjectReference[0]

	if ((numToSelect > 0) && (primarySpawnPointStart != None) || (secondarySpawnPointStart != None))
		if (IsValidSpawnPoint(primarySpawnPointStart))
			result.Add(primarySpawnPointStart)
			if (result.Length == numToSelect)
				return result
			EndIf
		EndIf

		ObjectReference[] primarySpawnPointChain = primarySpawnPointStart.GetLinkedRefChain()
		if (primarySpawnPointChain != None)
			int i = 0
			While (i < primarySpawnPointChain.Length)
				if (IsValidSpawnPoint(primarySpawnPointChain[i]))
					result.Add(primarySpawnPointChain[i])
					if (result.Length == numToSelect)
						return result
					EndIf
				EndIf
				i = i + 1
			EndWhile
		EndIf

		if (IsValidSpawnPoint(secondarySpawnPointStart))
			result.Add(secondarySpawnPointStart)
			if (result.Length == numToSelect)
				return result
			EndIf
		EndIf

		ObjectReference[] secondarySpawnPointChain = secondarySpawnPointStart.GetLinkedRefChain()
		if (secondarySpawnPointChain != None)
			int i = 0
			While (i < secondarySpawnPointChain.Length)
				if (IsValidSpawnPoint(secondarySpawnPointChain[i]))
					result.Add(secondarySpawnPointChain[i])
					if (result.Length == numToSelect)
						return result
					EndIf
				EndIf
				i = i + 1
			EndWhile
		EndIf

		;As a fallback, just fill out the array with PrimarySpawnPointStart.
		While (result.Length < numToSelect)
			result.Add(primarySpawnPointStart)
		EndWhile
	EndIf
	return result
EndFunction

bool Function IsValidSpawnPoint(ObjectReference spawnPoint)
	return (!player.HasDetectionLOS(spawnPoint) && !player.HasDirectLOS(spawnPoint) && (player.GetDistance(spawnPoint) > CONST_SpawnDistance))
EndFunction


;Standard setup for Jared and his survivors.
Function SetupSurvivor(ReferenceAlias survivor, ObjectReference[] spawnPoints, int index)
	Actor survivorActor = survivor.GetActorRef()
	if (survivorActor != None)
		survivorActor.MoveTo(spawnPoints[index])
		survivorActor.EnableNoWait()
		survivorActor.EvaluatePackage()
	EndIf
EndFunction


;Standard setup for enemies in the fight. This function is responsible for:
; - Spawning enemies, if necessary. (actorToSetUp = None)
; - Adding the actor to one or more RefCollections.
Function SetupEnemy(Actor actorToSetUp, ObjectReference spawnPoint=None, ActorBase akActorToPlace=None, int aiLevelMod=0, \
				RefCollectionAlias col1=None, RefCollectionAlias col2=None, RefCollectionAlias col3=None)
	if ((actorToSetUp == None) && (spawnPoint != None) && (akActorToPlace != None))
		actorToSetUp = spawnPoint.PlaceActorAtMe(akActorToPlace, aiLevelMod, DLC03FarHarborZone)
	EndIf
	if (actorToSetup != None)
		Self.RegisterForDistanceGreaterThanEvent(actorToSetUp, HullGateREF, CONST_GateKillDistance)
		if (col1 != None)
			col1.AddRef(actorToSetup)
		EndIf
		if (col2 != None)
			col2.AddRef(actorToSetup)
		EndIf
		if (col3 != None)
			col3.AddRef(actorToSetup)
		EndIf
	EndIf
EndFunction


;SetupSurvivor registers the Survivors for OnDying events. When they die, we update the survivor count and play a reaction scene.
Event Actor.OnDying(Actor akSender, Actor akKiller)
	survivorCount = survivorCount - 1
	DLC03MQ02Fight_SurvivorKilledScene.Start()
EndEvent


;SetupEnemy registers enemies for a distance event. If an enemy is ever more than this distance from the gate,
;we force-kill them, and disable them if the player can't see them. This prevents fleeing or hiding enemies from stalling the fight.
Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	Actor a = akObj1 as Actor
	if ((a != None) && (a != player) && (!a.IsDead()))
		bool playerHasDetectionLoS = player.HasDetectionLOS(a)
		if ((player.GetDistance(a) > CONST_AutokillDistance) && (!playerHasDetectionLoS) && (a.HasDetectionLOS(player)))
			a.Kill()
			if (!playerHasDetectionLoS)
				a.Disable()
			EndIf
		Else
			;We can't safely kill the actor at the moment, so wait a few seconds, then re-register for the OnDistanceGreaterThan check.
			;We need to wait or OnDistanceGreaterThan will (probably) just trigger immediately, and there are so few actors involved (3-5) that this should be safe.
			Utility.Wait(4)
			Self.RegisterForDistanceGreaterThanEvent(a, HullGateREF, CONST_GateKillDistance)
		EndIf
	EndIf
EndEvent


;------------------
;Fight Monitor
;------------------
;Like the BoS100 fight outside Cambridge PD, this fight has a large number of melee enemies who are succeptible to fleeing uncontrollably. Since
;they all have to be killed in order for the fight to proceed, we script-kill the last couple if they leave the combat area. This is in addition to
;the OnDistanceGreaterThan scripted kill, above.

Function StartFightMonitor()
	StartTimer(1, CONST_FightMonitorTimerID)
EndFunction

Function StopFightMonitor()
	CancelTimer(CONST_FightMonitorTimerID)
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_FightMonitorTimerID)
		if (AllEnemies.GetCount() <= 2)
			int i = 0
			While (i < AllEnemies.GetCount())
				Actor a = AllEnemies.GetAt(i) as Actor
				if (a == None)
					AllEnemies.RemoveRef(None)
				ElseIf ((!player.HasDetectionLOS(a)) && (player.GetDistance(a) > CONST_AutokillDistance))
					a.Kill()
				EndIf
				i = i + 1
			EndWhile
		EndIf
		if (!GetStageDone(90))
			StartFightMonitor()
		EndIf
	EndIf
EndEvent