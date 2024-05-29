Scriptname DLC01:DLC01Lair_Dispatcher extends ObjectReference Hidden
{Support object for the DLC01 Mechanist Battle. The Dispatcher acts as an intermediary between the DLC01LairQuestScript (which runs the fight) and all of the Tracks, Lifts, and Pipes in the room.}
;
;This script lives on a dummy object in the Mechanist's room, and is used only for this specific scripted event. I'm foregoing a lot
;of validation here because I know exactly how the editor data is set up, and if anything is wrong, the fight will break in obvious ways
;almost immediately.

Group Main_Properties
	;Note: For each of these arrays, Element 0 is NONE to match my in-editor numbering scheme.

	DLC01:DLC01_TrackSystemTrack[] property myActorTracks Auto Const Mandatory
	{Tracks capable of spawning Actors. (5)}

	DLC01:DLC01_TrackSystemTrack[] property myObjectTracks Auto Const Mandatory
	{Tracks capable of spawning non-Actors; includes all of the Actor Tracks, plus two more. (7)}

	DLC01:DLC01_EyebotPipeScript[] property myEyebotPipes Auto Const Mandatory
	{The Eyebot Pipes. (10)}

	DLC01:DLC01_RobotLiftScript[] property myLifts Auto Const Mandatory
	{The Robot Lifts. (3)}
EndGroup

Group Autofill_Properties
	DLC01:DLC01LairQuestScript property DLC01Lair Auto Const Mandatory		;The dungeon quest (and quest script).
	ActorValue property DLC01TrackSystemTrackID Auto Const Mandatory			;AV used to 'stamp' the track number on each of its dropoff points.
	ActorValue property DLC01TrackSystemDropoffPointBusy Auto Const Mandatory	;AV used to indicate when a dropoff point is busy.
	Race property EyebotRace Auto Const Mandatory						;Eyebot Race.
EndGroup

;Local variables.
Actor player
ObjectReference[] myDropoffPoints 					;Array of all of the dropoff points for all of the tracks in myActorTracks.
float[] myDropoffPointDistances 					;Array matching myDropoffPoints, with the player's current distance to each point.
											;I could use a struct here, but I recreate this array frequently, so this is faster.
float myDropoffPointDistanceTimestamp 				;The time we last calculated myDropoffPointDistances.
float CONST_TimeToKeepDistanceCalculations = 5.0 Const	;The amount of time we preserve dropoff point distance calculations for.

;Timer Consts
int CONST_Init_Timer = 1 Const



;-------------------------
;Setup & Cleanup
;----------------

;The Dispatcher can't initialize until all of its tracks have initialized, which they do OnCellLoad.
;So start a timer and wait for them to finish.
Event OnCellLoad()
	StartTimer(1, CONST_Init_Timer)
EndEvent

;Called by OnTimer for CONST_Init_Timer.
Function TryToInitialize()
	;Debug.Trace("Trying to Initialize")
	bool allTracksHaveInitialized = True
	int i = 0
	While ((i < myObjectTracks.Length) && allTracksHaveInitialized)
		if (myObjectTracks[i] != None)
			allTracksHaveInitialized = myObjectTracks[i].HasInitialized()
		EndIf
		i = i + 1
	EndWhile
	;Have all of the tracks finished initializing? If not, restart the timer and bail out.
	if (!allTracksHaveInitialized)
		StartTimer(1, CONST_Init_Timer)
	Else
		;Otherwise, we're ready to perform our initialization.
		;Debug.Trace("Initializing.")
		myDropoffPoints = new ObjectReference[0]
		;Initialize all of the actor tracks, and collect up their dropoff points as potential
		;places to drop Actors off later.
		i = 0
		While (i < myActorTracks.Length)
			if (myActorTracks[i] != None)
				myActorTracks[i].InitializeDispatch(Self, i, True)
			EndIf
			i = i + 1
		EndWhile
		;Initialize all of the object tracks, but don't collect their dropoff points since we
		;can't drop Actors from these tracks. (Tracks that are part of myActorTracks won't re-initialize).
		i = 0
		While (i < myObjectTracks.Length)
			if (myObjectTracks[i] != None)
				myObjectTracks[i].InitializeDispatch(Self, i, False)
			EndIf
			i = i + 1
		EndWhile
		player = Game.GetPlayer()
	EndIf
EndFunction


;When each Actor track initializes (InitializeDispatch, above), it calls back to this function to send the
;Dispatcher its array of dropoff points.
Function AddDropoffPoints(ObjectReference[] dropoffPoints)
	if (dropoffPoints != None)
		int i = 0
		While (i < dropoffPoints.Length)
			myDropoffPoints.Add(dropoffPoints[i])
			i = i + 1
		EndWhile
		;This voids any previously-calculated dropoff distances. Just discard the array.
		myDropoffPointDistances = None
	EndIf
EndFunction


;All of the tracks reinitialize OnCellLoad, so we have to, too.
Event OnUnload()
	player = None
	myDropoffPoints = None
	myDropoffPointDistances = None
EndEvent



;-----------------------------
;Track System Command
;---------------------
;General functions to control all of the tracks in the room.

Function PauseAllTracks()
	int i = 0
	While (i < myObjectTracks.Length)
		if (myObjectTracks[i] != None)
			myObjectTracks[i].PauseTrack()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function ResumeAllTracks()
	int i = 0
	While (i < myObjectTracks.Length)
		if (myObjectTracks[i] != None)
			myObjectTracks[i].ResumeTrack()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function StopAllTracks()
	int i = 0
	While (i < myObjectTracks.Length)
		if (myObjectTracks[i] != None)
			myObjectTracks[i].StopTrackNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction



;-----------------------------------
;Dispatch: To Eyebot Pipes
;--------------------------
;Dispatches an object to one of the Eyebot Pipes in the room.

Function DispatchToPipe(int pipeID, Form object, int aiLevelMod=1)
	myEyebotPipes[pipeID].PlaceEyebot(object, aiLevelMod)
EndFunction

Function DispatchToRandomPipe(Form object, int aiLevelMod=1)
	myEyebotPipes[Utility.RandomInt(1, myEyebotPipes.Length-1)].PlaceEyebot(object, aiLevelMod)
EndFunction



;-----------------------------------
;Dispatch: To Robot Lifts
;-------------------------
;Dispatches an object to one of the Robot Lifts in the room.

Function DispatchToLift(int liftID, Form object, int aiLevelMod=1)
	myLifts[liftID].PlaceAndRun(object, aiLevelMod)
EndFunction

Function DispatchToRandomLift(Form object, int aiLevelMod=1)
	myLifts[Utility.RandomInt(1, myLifts.Length-1)].PlaceAndRun(object, aiLevelMod)
EndFunction



;-----------------------------------
;Dispatch: Actors to Tracks
;---------------------------
;Dispatches an object to one of the Tracks in the room.

Function DispatchActorToTrack(int track, Form object, Form keyObject=None, ObjectReference dropoffPoint=None, bool dropoffProhibited=False)
	myActorTracks[track].AddMachineConstructor(object, keyObject, dropoffPoint, dropoffProhibited)
EndFunction

Function DispatchActorToTrackIndex(int track, Form object, Form keyObject=None, int dropoffPointIndex=-1, bool dropoffProhibited=False)
	myActorTracks[track].AddMachineConstrutorIndex(object, keyObject, dropoffPointIndex, dropoffProhibited)
EndFunction

Function DispatchActorToTrackNoDrop(int track, Form object, Form keyObject=None)
	myActorTracks[track].AddMachineConstructor(object, keyObject, None, True)
EndFunction

Function DispatchActorToRandomDropoffPoint(Form object, Form keyObject=None)
	;Locate a random unused dropoff point and claim it (set its DLC01TrackSystemDropoffPointBusy AV to 1).
	ObjectReference dropoffPoint = FindRandomDropoffPoint()
	dropoffPoint.SetValue(DLC01TrackSystemDropoffPointBusy, 1)
	;Debug.Trace("Selected point " + dropoffPoint)
	;Since this marker was previously stamped with its Track ID, we can pull the associated track index from the actor value.
	int dropoffTrack = dropoffPoint.GetValue(DLC01TrackSystemTrackID) as int
	;Then dispatch the object to that track.
	myActorTracks[dropoffTrack].AddMachineConstructor(object, keyObject, dropoffPoint)
EndFunction

Function DispatchActorToNearestDropoffPoint(Form object, Form keyObject=None)
	;Locate the nearest unused dropoff point and claim it (set its DLC01TrackSystemDropoffPointBusy AV to 1).
	ObjectReference dropoffPoint = FindNearestDropoffPoint()
	dropoffPoint.SetValue(DLC01TrackSystemDropoffPointBusy, 1)
	;Debug.Trace("Selected point " + dropoffPoint)
	;Since this marker was previously stamped with its Track ID, we can pull the associated track index from the actor value.
	int dropoffTrack = dropoffPoint.GetValue(DLC01TrackSystemTrackID) as int
	;Debug.Trace("DROPOFF POINT SELECTED: " + dropoffPoint + ",  dropoffTrack=" + dropoffTrack)
	;Then dispatch the object to that track.
	myActorTracks[dropoffTrack].AddMachineConstructor(object, keyObject, dropoffPoint)
EndFunction

;Pick a semi-random, non-busy dropoff point from the array of points.
ObjectReference Function FindRandomDropoffPoint()
	int startIndex = Utility.RandomInt(0, myDropoffPoints.Length-1)
	int i = startIndex
	While (i < myDropoffPoints.Length)
		if (myDropoffPoints[i].GetValue(DLC01TrackSystemDropoffPointBusy) == 0)
			return myDropoffPoints[i]
		Else
			i = i + 1
		EndIf
	EndWhile
	i = 0
	While (i < startIndex)
		if (myDropoffPoints[i].GetValue(DLC01TrackSystemDropoffPointBusy) == 0)
			return myDropoffPoints[i]
		Else
			i = i + 1
		EndIf
	EndWhile
	;In the unlikely event that all of the dropoff points are busy for some reason,
	;just return a random one. StartIndex was selected randomly, so that's fine.
	return myDropoffPoints[startIndex]
EndFunction

;Pick the nearest non-busy dropoff point from the array.
ObjectReference Function FindNearestDropoffPoint()
	;Check to see if we need to recalculate the distance between the player and the dropoff points. If so, do so.
	if ((myDropoffPointDistances == None) || (Utility.GetCurrentRealTime() > (myDropoffPointDistanceTimestamp + CONST_TimeToKeepDistanceCalculations)))
		RecalculateDropoffPointDistances()
	EndIf

	ObjectReference nearestDropoffPoint = None
	float nearestDropoffPointDistance = 1000000
	int i = 0
	While (i < myDropoffPoints.Length)
		if ((myDropoffPointDistances[i] < nearestDropoffPointDistance) && (myDropoffPoints[i].GetValue(DLC01TrackSystemDropoffPointBusy) == 0))
			nearestDropoffPoint = myDropoffPoints[i]
			nearestDropoffPointDistance = myDropoffPointDistances[i]
		EndIf
		i = i + 1
	EndWhile
	if (nearestDropoffPoint == None)
		nearestDropoffPoint = FindRandomDropoffPoint()
	EndIf

	;Return the nearest dropoff point we found. In the unlikely event that all of
	;the dropoff points were busy, this means we always return the initial random selection.
	return nearestDropoffPoint
EndFunction

;Helper for FindNearestDropoffPoint. Recalculates the distances to each point.
;Since this is fairly expensive, we set a timestamp and only recalculate every few seconds.
Function RecalculateDropoffPointDistances()
	myDropoffPointDistanceTimestamp = Utility.GetCurrentRealTime()
	myDropoffPointDistances = new float[myDropoffPoints.Length]
	int i = 0
	While (i < myDropoffPoints.Length)
		myDropoffPointDistances[i] = myDropoffPoints[i].GetDistance(player)
		i = i + 1
	EndWhile
EndFunction



;-----------------------------------
;Dispatch: Trashbots
;---------------------------

;Used to spawn and respawn Trashbots during the final phase of the fight.
;- The name is a bit misleading-- it will use the nearest Track System spawn point, but
;  has a chance of spawning via pipe (for Eyebots) or lift (for non-Eyebots) as well,
;  provided we haven't started the final countdown (Stage 1290).
;- Lifts and Pipes are just selected at random.
Function DispatchActorToNearestSpawner(Actor akActor)
	if ((DLC01Lair.GetStage() < 1290) && (Utility.RandomInt(0, 100) < 20) && (akActor != None))
		;Try to spawn via pipe or lift.
		if (akActor.GetRace() == EyebotRace)
			;Eyebot, so pick a random pipe.
			DLC01:DLC01_EyebotPipeScript pipe = myEyebotPipes[Utility.RandomInt(1, myEyebotPipes.Length-1)]
			pipe.PlaceEyebot(akActor)
		Else
			;Non-Eyebot, so pick a random lift.
			DLC01:DLC01_RobotLiftScript lift = myLifts[Utility.RandomInt(1, myLifts.Length-1)]
			lift.PlaceAndRun(akActor)
		EndIf
	Else
		Self.DispatchActorToNearestDropoffPoint(akActor)
	EndIf
EndFunction



;--------------------------------
;Dispatch: Interventions
;------------------------
;Dispatches the Mechanist's Interventions-- the tanks, mines, and arc traps used during the fight.
;In general, when referring to interventions, {0=Tank, 1=Mine, 2=Arc}.

;A Machine-Object pair, representing an Intervention Object (mine, etc.) being carried by a Machine on a track.
Struct InterventionObjectPair
	DLC01:DLC01_TrackSystemMachine machine 	
	ObjectReference object
EndStruct

Group Intervention_Properties
	;Intervention base objects.
	MovableStatic property DLC01TrackSystem_TrapTankMStatic Auto Const Mandatory
	MovableStatic property DLC01TrackSystem_TrapMineMStatic Auto Const Mandatory
	Activator property DLC01TrackSystem_TrapElectricArc Auto Const Mandatory
EndGroup


;Local Properties
InterventionObjectPair[] activeObjects 		;Array of intervention objects currently on the tracks.
int nextIntervention = 0					;Which Intervention are we doing next? {0=Tank, 1=Mine, 2=Arc}
int previousIntervention = 1 				;Which intervention did we do last?

;Intervention Constants.
int CONST_MaxMinesToDeployPerTrack = 1 Const
int CONST_MaxMinesToDrop = 3 Const

int CONST_MaxTanksToDeployPerTrack = 2 Const
int CONST_MaxTanksToDrop = 3 Const

int CONST_MaxArcTrapsToDeployPerTrack = 2 Const

int CONST_DropObjectsMinDistanceApart = 500 Const


;We have to cap the total number of Mine interventions, to prevent exploits
;(since the player can collect the mines and sell them).
int CONST_MaxMineInterventions = 4 Const
int mineInterventionCount = 0


;Timer ID Constants.
int CONST_TankInterventionTimer = 10 Const
int CONST_MineInterventionTimer = 11 Const
int CONST_ElectricArcInterventionTimer = 12 Const



;For testing purposes, we can force a specific intervention to happen next.
Function DispatchTanks()
	SetupIntervention(0)
EndFunction

Function DispatchMines()
	SetupIntervention(1)
EndFunction

Function DispatchArcTraps()
	SetupIntervention(2)
EndFunction


;Select the next intervention we want to use next.
;We don't actually want to start it yet-- we just need to pick one.
int Function SetupIntervention(int forceIntervention=-1)
	if (forceIntervention >= 0)
		nextIntervention = forceIntervention
	Else
		nextIntervention = SelectIntervention()
	EndIf

	return nextIntervention
EndFunction

int Function SelectIntervention()
	if (mineInterventionCount >= CONST_MaxMineInterventions)
		;The number of mine interventions is capped, to prevent exploits (since the player can pick up the mines).
		;If we've hit the cap, just alternate between Arc and Tank traps.
		if (previousIntervention == 0)
			nextIntervention = 2
		Else
			nextIntervention = 0
		EndIf
	Else
		;Otherwise, pick randomly, but never pick the same intervention twice in a row.
		int intervention
		if (previousIntervention == 0)
			intervention = Utility.RandomInt(1, 2)
		ElseIf (previousIntervention == 1)
			intervention = Utility.RandomInt(0, 1)
			if (intervention == 1)
				intervention = 2
			EndIf
		Else ;previousIntervention == 2
			intervention = Utility.RandomInt(0, 1)
		EndIf
		return intervention
	EndIf
EndFunction


;After SetupIntervention returns the intervention we're doing next, DLC01LairQuestScript fires off a scene where the
;Mechanist comments on it ("Call in the Tesla Coils!", etc.). When that scene ends, it calls this function to actually
;send in the appropriate trap.
Function StartIntervention()
	DLC01:DLC01_TrackSystemTrack[] tracks = SelectInterventionTracks(nextIntervention)
	if (nextIntervention == 0)
		DispatchIntervention(DLC01TrackSystem_TrapTankMStatic, CONST_MaxTanksToDeployPerTrack, tracks, CONST_TankInterventionTimer)
	ElseIf (nextIntervention == 1)
		DispatchIntervention(DLC01TrackSystem_TrapMineMStatic, CONST_MaxMinesToDeployPerTrack, tracks, CONST_MineInterventionTimer)
	ElseIf (nextIntervention == 2)
		DispatchIntervention(DLC01TrackSystem_TrapElectricArc, CONST_MaxArcTrapsToDeployPerTrack, tracks, CONST_ElectricArcInterventionTimer)
	EndIf
	previousIntervention = nextIntervention
EndFunction

;Select which tracks to use for the intervention based on where the player is in the room.
DLC01:DLC01_TrackSystemTrack[] Function SelectInterventionTracks(int intervention)
	int[] tracks = new int[0]
	float playerPosX = player.GetPositionX()
	float playerPosZ = player.GetPositionZ()
	if (playerPosZ < 240)
		tracks.Add(1)
		if (intervention != 0)
			tracks.Add(6)
		EndIf
		if (playerPosX > -3450)
			tracks.Add(3)
		Else
			tracks.Add(4)
		EndIf
	Else
		if (playerPosX > -3000)
			tracks.Add(2)
			tracks.Add(3)
		ElseIf (playerPosX > -3903)
			tracks.Add(3)
			tracks.Add(4)
		Else
			tracks.Add(4)
			tracks.Add(5)
		EndIf
	EndIf

	;Go through and cull any tracks that aren't active from the list.
	DLC01:DLC01_TrackSystemTrack[] activeTracks = new DLC01:DLC01_TrackSystemTrack[0]
	int i = 0
	While (i < tracks.Length)
		if ((myObjectTracks[tracks[i]] != None) && (myObjectTracks[tracks[i]].IsMoving()))
			activeTracks.Add(myObjectTracks[tracks[i]])
		EndIf
		i = i + 1
	EndWhile
	return activeTracks
EndFunction

;Then send in the specified trap.
Function DispatchIntervention(Form objectToDispatch, int maxToDispatchPerTrack, DLC01:DLC01_TrackSystemTrack[] tracks, int timerID)
	if (objectToDispatch == None)
		Debug.Trace("ERROR: Attempted to dispatch a NONE object.", 2)
	ElseIf (tracks == None)
		Debug.Trace("ERROR: Attempted to dispatch objects, but none of the selected tracks were active.", 2)
	ElseIf (activeObjects != None)
		Debug.Trace("ERROR: Attempted to dispatch objects, but objects were already on the track.", 2)
	EndIf

	;Set up arrays to record the incoming traps and their machines.
	;Debug.Trace("Before " + activeObjects + ", " + activeObjectsMachines)
	activeObjects = new InterventionObjectPair[0]
	;Debug.Trace("After " + activeObjects + ", " + activeObjectsMachines)

	;As we cycle through, keep track of the speed of each track. We want to find the lowest such speed.
	float lowestTrackSpeed = 100.0

	;Go through and add the traps to the tracks, with a chance of having some blanks.
	int i = 0
	While (i < tracks.Length)
		float numDispatched = 0
		While (numDispatched < maxToDispatchPerTrack)
			if (Utility.RandomInt(0, 100) < 35)
				tracks[i].AddMachineConstructor(None)
				numDispatched = numDispatched + 0.5
			Else
				tracks[i].AddMachineConstructor(objectToDispatch)
				numDispatched = numDispatched + 1
			EndIf
		EndWhile
		if (tracks[i].GetSpeed() < lowestTrackSpeed)
			lowestTrackSpeed = tracks[i].GetSpeed()
		EndIf
		i = i + 1
	EndWhile
	
	;Then determine when we want to drop the trap.
	;- Trap 0 (the Electric Arc trap) doesn't drop anything per se; the electric arc traps are always active.
	;  However, we still use the timer to delay a bit before calling DLC01Lair's StartInterventionTimer.
	;- Traps 1 & 2 will drop. They drop in a random multiple of the slowest track's speed (which,
	;  remember, is also the length of time it takes the track to cross the room).
	float dropTime = Utility.RandomFloat((lowestTrackSpeed * 0.4), (lowestTrackSpeed * 0.8))
	;Debug.Trace("Ready to drop in: " + dropTime + ", " + timerID)
	StartTimer(dropTime, timerID)
EndFunction


;As the traps spawn, TrackSystemMachine reports to TrackSystemTrack, which reports back to us so we can record it.
Function MachineObjectPlaced(DLC01:DLC01_TrackSystemMachine machine, ObjectReference MachineObject)
	;Debug.Trace("Received " + machine + ", " + MachineObject)
	;Debug.Trace("Testing " + activeObjects + ", " + MachineObject + ", " + ((MachineObject as Actor) == None))
	;Debug.Trace("And Testing " + (activeObjectsMachines != None) + ", " + (activeObjects != None))
	if (MachineObject.GetBaseObject() == DLC01TrackSystem_TrapElectricArc)
		;Electric Arc traps just drop (activate) immediately.
		machine.DropMyObject()
	ElseIf ((machine != None) && (MachineObject != None) && ((MachineObject as Actor) == None)); && (activeObjectsMachines != None) && (activeObjects != None))
		;Mine and Tank Traps get recorded so we can drop them when the timer expires.
		;Debug.Trace("Recorded " + machine + ", " + MachineObject)
		InterventionObjectPair current = new InterventionObjectPair
		current.Machine = machine
		current.Object = MachineObject
		activeObjects.Add(current)
	EndIf
EndFunction


;When the drop timer expires, drop up to [maxDrops] Mine or Tank Traps (provided they aren't too close to each other), etc.
Function DropInterventionObjects(int maxDrops, bool shouldOpen=True, float maxDropDelay=0.5)
	;Debug.Trace("In DropObjects. " + activeObjects + ", " + maxDrops)

	InterventionObjectPair[] objectsToDrop = new InterventionObjectPair[0]
	int drops = 0

	if (maxDrops >= 0)
		;Go through [activeObjects]-- all of the trap objects that have spawned for this Intervention, picking randomly--
		;and drop up to [maxDrops], provided we can find that many that are safe to drop.
		While ((activeObjects.Length > 0) && (drops < maxDrops))
			int i = Utility.RandomInt(0, activeObjects.Length - 1)
			;Debug.Trace("Now testing: " + activeObjects[i] + ", " + activeObjectsMachines[i] + ", " + activeObjects[i].GetDistance(player))
			if ((activeObjects[i].Object != None) && (activeObjects[i].Machine != None))
				bool isSafeToDrop = activeObjects[i].Machine.IsReadyForDrop()
				int j = 0
				While (isSafeToDrop && (j < drops))
					;Debug.Trace("--Now testing: " + activeObjects[i] + "for drop safety vs. " + objectsToDrop[j] + "; " + activeObjects[i].GetDistance(objectsToDrop[j]))
					if (activeObjects[i].Object.GetDistance(objectsToDrop[j].Object) < CONST_DropObjectsMinDistanceApart)
						isSafeToDrop = False
					EndIf
					j = j + 1
				EndWhile
				if (isSafeToDrop)
					;Debug.Trace("--SAFE TO DROP.")
					objectsToDrop.Add(activeObjects[i])
					drops = drops + 1
				EndIf
			EndIf
			activeObjects.Remove(i)
		EndWhile
	Else
		;Just drop everything, I guess.
		objectsToDrop = activeObjects
		drops = activeObjects.Length
	EndIf
	;Debug.Trace("Dropping " + objectsToDrop)
	;Then cycle through and have each machine drop its object.
	int i = 0
	While (i < drops)
		objectsToDrop[i].Machine.DropMyObject(shouldOpen)
		if (maxDropDelay > 0)
			Utility.Wait(Utility.RandomFloat(0, maxDropDelay))
		EndIf
		i = i + 1
	EndWhile
	activeObjects = None
	;Debug.Trace("Exiting DropObjects.")
EndFunction


;-------------------------
;OnTimer Function
;-----------------

Event OnTimer(int timerID)
	;Debug.Trace("Dispatch Initialize Timer")
	if (timerID == CONST_Init_Timer)
		TryToInitialize()
	ElseIf (timerID == CONST_TankInterventionTimer)
		DropInterventionObjects(CONST_MaxMinesToDrop)
		DLC01Lair.StartInterventionTimer()
	ElseIf (timerID == CONST_MineInterventionTimer)
		DropInterventionObjects(CONST_MaxTanksToDrop)
		DLC01Lair.StartInterventionTimer()
	ElseIf (timerID == CONST_ElectricArcInterventionTimer)
		DLC01Lair.StartInterventionTimer()
	EndIf
EndEvent