Scriptname DLC01:DLC01_TrackSystemTrack extends ObjectReference
{Part of the DLC01 Track System. Script on a dummy object that manages a track of machines.}

;SYSTEM OVERVIEW:
;The Track System consists of:
; - DLC01_TrackSystemTrack - Manages a 'track', a lane of machines that spawn in, travel along a track, and despawn at the other end. [This Script]
; - DLC01_TrackSystemMachine - Manages a single machine moving along a track, including the visible machine, objects it's carrying, support objects, and their behaviors.
; - DLC01_TrackSystemDoor - Script on the activator doors at each end of the track. These doors are closed when the track is inactive.
; - DLC01_TrackSystemDoorTrigger - Script on a trigger beyond the activator doors. Handle actors that become stuck in the unplayable space at each end.
;
;Some secondary scripts are also related to this system:
; - DLC01_TrackSystemTrapElectricArc - Script on the Electric Arc trap machine. A variant of TrapElectricArc.
; - DLC01_TrackSystemTrap - Script on the Explosive Tank and Mine trap machines.
; - DLC01Lair_Dispatcher - Used for the Mechanist Battle specifically, a utility script that coordinates multiple Tracks, Lifts, and EyebotPipes, sending objects to each.
;
;OVERVIEW:
;In the editor, a 'track' consists of:
; - A static steel beem, the visible 'track' the machines are moving on. May be level or at an angle.
; - A Track System Dummy, a marker with this script on it.
; - Two Source Markers, one at each end of the track. These are the start and end points for the track.
; - A Door and Door Trigger at each end of the track. The space between the doors is the 'playable area' of the track.
; - A chain of Dropoff Points: XMarkerHeadings that objects spawned by the track can potentially be dropped on. 
;
;From that setup, this script handles everything else.
;
;Each Track has a queue of machines waiting to be constructed. When the track is running, on a timer, it pulls a machine from the queue and
;spawns it at one end of the track (the Track creates a new DLC01_TrackSystemMachine, which in turn spawns all of its visual elements and animates it).
;When the machine reaches the other end of the track, it disables and deletes itself.


;A struct representing the elements DLC01_TrackSystemMachine needs to assemble a 'machine': a group of objects moving along the track. 
;
;When this system is asked to spawn a machine, it's (optionally) given an [Object]-- the Actor, Ref, or base form that the machine is
;supposed to move along the track. We might get a [DropoffPoint]-- a marker where something (usually the Dispatcher) wants us to drop the object off,
;or a bool prohibiting us from ever dropping the object.
;
;If necessary, we get the Object's base object, then use FindStruct to look it up in an array of presets.
;This gives us the [Arm], [Platform], and [PlatformHeightOffset] intended for that base object.
;
;We then assemble a new struct, merging the data from the spawn request and the preset, and push it into the construction queue. The next time the track
;is ready to spawn a machine (which might be a bit, if we throw a lot of objects at it at once), it pulls the next struct from the queue and uses this
;data to assemble it.
Struct MachineConstructor
	;---Elements from Spawn Request---
	Form Object 				;Optionally, the object that the Arm and Platform are moving along the track.
	bool DropoffProhibited		;Optionally, is the machine allowed to drop its object (at DropoffPoint, or if hit early)?
	ObjectReference DropoffPoint 	;Optionally, a marker indicating where we want to drop the Object.

	;---Elements from Preset---
	Activator Arm 				;The visible machinery that moves along the track.
	String ArmSpawnNode 		;Node on the Arm to spawn the Object at.
	Activator Platform 			;Something used to support the Object (an invisible platform for the Actor to stand on, etc.). No, can't be built into the Arm.
	float PlatformHeightOffset	;If the platform elevates the object more (or less) than usual, the amount of that offset. Used for calculating drop distance.
	Light ArmLight				;Optionally, a light attached to the arm.
EndStruct


;A struct representing the remaining elements needed to spawn a machine. Unlike the elements in MachineConstructor,
;these are relatively static-- once calculated by the track, they don't change much, and they're the same regardless of the
;Arm/Platform/Object being used.
;
;This struct exists mainly for convenience, as a way of passing a bunch of parameters.
Struct HelperConstructor
	Activator Helper 					;The PlatformHelper, an animated object that the Arm & Platform attach to. Its animation moves the machine.
	ObjectReference HelperSourceMarker 	;Marker to spawn the Helper at.
	float HelperZOffset 				;Z-Offset from the Source marker to move the Helper to.
	float HelperScale 					;Amount to scale the helper.
	String HelperAttachNode 				;Node on the Helper the Arm and Platform should attach to.
	RefCollectionAlias ActorRefCollection 	;RefCollectionAlias to add actors spawned by the track to.
EndStruct


;Properties related to the track's initial state (OnCellLoad). Changing these once the track has loaded will have no effect.
Group Track_Initial_Properties
	bool property InitiallyActive = False Auto
	{DEFAULT: False. Should this track start active-- begin moving immediately after loading?}

	int property InitialCapacity = 6 Auto
	{DEFAULT: 6. If InitiallyActive, the number of machines that can be simultaneously active on the track. Use GetCapacity or SetCapacity to change. (Speed / Capacity = Spawn Delay)}

	int property InitialSourceMarker = 0 Auto
	{DEFAULT: 0. Which of the two Source Markers (0 or 1) is the starting point of the track-- effectively, which direction the Machines move. Use SetSourceMarker to change.}

	float property InitialSpeed = 10.0 Auto
	{DEFAULT: 10. Speed of the Machines on the track; the number of seconds required for them to move the full length of the track. Use SetSpeed to change.}
EndGroup


;Other per-Track properties.
Group Track_Main_Properties
	MachineConstructor[] property ConstructionQueue Auto
	{DEFAULT: Empty. The queue of Machines this track has been asked to spawn.}

	bool property ConstructionQueueShouldLoop = False Auto
	{DEFAULT: False. If True, elements are not removed from the Construction queue; we just loop through it. If False, we empty the queue as machines are constructed.}

	int property EngagedObjectsLimit = 0 Auto
	{DEFAULT: 0. If >0, the track will not spawn any more objects once EngagedObjectsLimit objects have been dropped from machines on the track. This prevents infinite-XP exploits.}

	float property TrackHeightOffsetZ = 184.0 Auto Const
	{DEFAULT: 184. For convenience, in the editor, source markers are placed on the ground. Offset newly-placed Helpers up by this much so they'll be centered on the track.}

	float property TrackDropoffDistanceFudge = 0.0 Auto Const
	{DEFAULT: 0. Optional. If desired, fudge the dropoff distance for objects being dropped by the track (this value is added to the calculated drop distance, so >0 = Early).}

	EncounterZone property TrackEncounterZone Auto Hidden
	{The track's Encounter Zone. Property filled at runtime.}

	RefCollectionAlias property RefCollectionForActors Auto Const
	{Actors carried by the track are added to this ref collection. They are removed from the collection if they despawn, but NOT when they drop.}
EndGroup


;Properties set on the track base object that are not intended to be changed for individual tracks.
Group _BASE_Track_Properties CollapsedOnRef
	;---System Properties---
	Faction property TrackOwnerFaction Auto Const Mandatory
	{DEFAULT: RobotFaction. The Owner faction for the tracks; used to prevent Robots on the track from triggering mines on the track.}

	MachineConstructor[] property MachinePresets Auto
	{DEFAULT: Set up in the editor. An array of preset Base Object / Arm / Platform combinations.}

	MachineConstructor[] property MachineFallbackPresets Auto
	{DEFAULT: Set up in the editor. An array of fallback combinations, if ConstructionQueue is empty and the track is still running.}

	;---System Consts---
	float property CONST_PlatformHelperScale = 1024.0 Auto Const
	{DEFAULT: 1024. The length of the PlatformHelpers used by this system.}

	float property CONST_DoorBuffer = 16.0 Auto Const
	{DEFAULT: 16. Each track is bookended by doors. When calculating the playable space between them, deduct this const to make sure actors don't hit the doorframe.}

	int[] property CONST_TrackSystemDropDistanceOffsets Auto Const
	{For dropoff points, we have to drop objects a little early because they fall at an angle. A precalculated array of offsets for this, indexed by track speed.}

	float property CONST_ExpelZOffset = -128.0 Auto Const
	{DEFAULT: 128. When expelling the player or another actor from a DLC01_TrackSystemDoorTrigger volume, shift them down by this amount.}
EndGroup


Group _Autofill_Properties CollapsedOnRef
	;---Track System Elements---
	ObjectReference property DLC01_TrackSystemSpawnPoint Auto Const Mandatory	;Standard spawn point for the Track system. [An XMarker in the DLC01LairHoldingCell holding cell.]
	Activator property DLC01TrackSystem_TrackHelper Auto Const Mandatory		;The animated object whose animation ultimately moves things along the track.
	Activator property DLC01TrackSystem_MachineDummy Auto Const Mandatory		;A marker base object with the DLC01_TrackSystemMachine script. We spawn one per machine to run each.

	;---Linked Ref Keywords---
	;Unnamed Linked Ref 						 	;Links to [Source Markers]
	Keyword property LinkCustom01 Auto Const Mandatory 	;Links to [DLC01_TrackSystemDoors]
	Keyword property LinkCustom02 Auto Const Mandatory 	;Links to [Drop Points]
	Keyword property LinkCustom03 Auto Const Mandatory 	;Links to [Sound Markers]

	;---Other Properties---
	ActorValue property DLC01TrackSystemTrackID Auto Const Mandatory		;For tracks with a Dispatcher and Dropoff Points, we stamp this Actor Value on each dropoff point with the trackID
															;provided by the Dispatcher.
EndGroup



;Local Variables
;---Track System Elements---
DLC01:DLC01Lair_Dispatcher myDispatcher		;Optionally, the Dispatcher that controls this track, if any.
DLC01:DLC01_TrackSystemMachine[] myMachines	;Array of Machines that are currently active on the track.
ObjectReference[] mySourceMarkers			;Array of exactly two markers that define the ends of the track. [This ref's unnamed LinkedRef chain.]
DLC01:DLC01_TrackSystemDoor[] myDoors 		;Array of exactly two doors at either end of the track. The doors, in turn, each have an associated trigger. [This ref's LinkCustom01 chain.]
ObjectReference[] myDropoffPoints			;Array of dropoff points along the axis of the track. [This ref's LinkCustom02 LinkedRef chain.]
ObjectReference[] mySoundMarkers			;Array of sound markers associated with the track, enabled when it's running. [This ref's LinkCustom03 LinkedRef chain.]

;---Track State Data---
bool isInitialized = False	;Have we finished initializing the track? Set by OnCellLoad, cleared by OnUnload, each time.
bool isMoving = False		;Is the track currently moving?
bool isPaused = False		;Is the track currently paused? (Implies isMoving=False.)

int currentSourceMarker 		;Index into mySourceMarkers; the starting point of the track.
float speed 				;The current speed of the track; the number of seconds it takes to complete its animation.
int capacity				;The capacity of the track; the number of machines that can be active on it simultaneously. (= Speed / SpawnDelay)
float spawnDelay 			;The current delay, in seconds, between when each new Machine spawns on the track. Dependent Variable. (= Speed / Capacity)
int myConstructionQueueIndex	;If (ConstructionQueueShouldLoop=True), the index in myMachines that we're currently on. Otherwise, we just use index 0.
int objectsEngaged			;If (EngagedObjectsLimit>0), a count of the number of objects that have been dropped from this track; after the limit is hit, no more objects will spawn.
						;Notably, this is NOT cleared when the track re-initializes.
float[] tempTrackSettingsData	;Temporary data used by UpdateTrackStateNoWait.
HelperConstructor HC 		;Struct of objects needed to spawn a Helper for Machines on this track.

;---Stored Data---
float helperScale				;The amount to scale the track helpers by when we spawn them. (Length of Track / CONST_PlatformHelperScale)
float sourceMarkerAngle			;The X- or Y-angle of the first source marker, if any. Used when calculating the range to dropoff points.
float sourceMarkerZDifferential	;The difference in height between the two source markers, if any. Used when calculating the range to dropoff points.
String[] sourceMarkerAttachNodes 	;The name of the attach ref on the helper we want to use, based on each source marker's angle.
							;If the track is angled down, we have to spawn objects using a node that's offset up by the same number of degrees to level the arm.
bool myDoorsHaveMatchingX		;All tracks are orthogonal, so either their X-values will be the same and their Ys will differ, or vice-versa. Which is it?
int[] myDoorsMinMaxValues		;For the X- or Y-component on which they differ, what are the minimum and maximum values that define the playable space between the two doors?

;---Timer Properties---
int SPAWN_TIMER = 1 Const
int UPDATE_TRACK_SETTINGS_TIMER = 2 Const
int STOP_TRACK_TIMER = 3 Const


;----------------------------------------------------------------
;Initialization, Loading, and Unloading
;---------------------------------------

;Initialize the track OnCellLoad.
Event OnCellLoad()
	if (!isInitialized)
		;Debug.Trace("Track " + Self + " OnCellLoad")

		;Set up myMachines.
		myMachines = new DLC01:DLC01_TrackSystemMachine[0]

		;Set up the ConstructionQueue
		if (ConstructionQueue == None)
			ConstructionQueue = new MachineConstructor[0]
		EndIf

		;Store Source Markers. We expect one at each end, defining the length of the track.
		mySourceMarkers = Self.GetLinkedRefChain()
		if (mySourceMarkers.Length != 2)
			Debug.Trace("TRACK ERROR: " + Self + " has " + mySourceMarkers.Length + " source marker(s)!", 2)
		EndIf

		;Store and initialize Doors. Again, we expect one on each end.
		myDoors = Self.GetLinkedRefChain(LinkCustom01) as DLC01:DLC01_TrackSystemDoor[]
		if (myDoors.Length != 2)
			Debug.Trace("TRACK ERROR: " + Self + " has " + myDoors.Length + " source marker(s)!", 2)
		Else
			myDoors[0].InitDoor(Self, 0)
			myDoors[1].InitDoor(Self, 1)
		EndIf

		;Store Dropoff Points, if any.
		myDropoffPoints = Self.GetLinkedRefChain(LinkCustom02)

		;Store Sound Markers, if any.
		mySoundMarkers = Self.GetLinkedRefChain(LinkCustom03)


		;Move initial properties to local variables.
		currentSourceMarker = InitialSourceMarker
		speed = InitialSpeed
		capacity = InitialCapacity
		spawnDelay = speed / capacity

		;Store our Encounter Zone.
		TrackEncounterZone = Self.GetEncounterZone()


		;Calculate: HelperScale
		;The track's length is the distance between the source markers.
		float trackLength = mySourceMarkers[0].GetDistance(mySourceMarkers[1])
		;The helper's scale is the track length divided by its base length.
		helperScale = trackLength / CONST_PlatformHelperScale

		;Calculate: SourceMarkerZDifferential
		sourceMarkerZDifferential = Math.Abs(mySourceMarkers[0].GetPositionZ() - mySourceMarkers[1].GetPositionZ())

		;Calculate: SourceMarkerAngle
		float marker1AngleX = mySourceMarkers[0].GetAngleX()
		float marker1AngleY = mySourceMarkers[0].GetAngleY()
		if ((marker1AngleX != 0) && (marker1AngleY != 0))
			Debug.Trace("TRACK ERROR: Tracks must be orthoganal; " + Self + " has two different angles.", 2)
		ElseIf (marker1AngleX != 0)
			sourceMarkerAngle = marker1AngleX
		ElseIf (marker1AngleY != 0)
			sourceMarkerAngle = marker1AngleY
		EndIf

		;Calculate: sourceMarkerAttachNodes
		sourceMarkerAttachNodes = new String[2]
		if (sourceMarkerAngle == 0)
			sourceMarkerAttachNodes[0] = "REF_ATTACH_NODE"
			sourceMarkerAttachNodes[1] = "REF_ATTACH_NODE"
		ElseIf (Math.Abs(sourceMarkerAngle) == 15)
			sourceMarkerAttachNodes[0] = "Angle15"
			sourceMarkerAttachNodes[1] = "Angle15"
		ElseIf (Math.Abs(sourceMarkerAngle) == 45)
			sourceMarkerAttachNodes[0] = "Angle45"
			sourceMarkerAttachNodes[1] = "Angle45"
		Else
			Debug.Trace("TRACK ERROR: Track " + Self + " has an unsupported angle, " + sourceMarkerAngle, 2)
		EndIf
		if (sourceMarkerAngle > 0)
			sourceMarkerAttachNodes[0] = sourceMarkerAttachNodes[0] + "Up"
			sourceMarkerAttachNodes[1] = sourceMarkerAttachNodes[1] + "Down"
		ElseIf (sourceMarkerAngle < 0)
			sourceMarkerAttachNodes[0] = sourceMarkerAttachNodes[0] + "Down"
			sourceMarkerAttachNodes[1] = sourceMarkerAttachNodes[1] + "Up"
		EndIf

		;Calculate: myDoorsHaveMatchingX
		myDoorsHaveMatchingX = myDoors[0].GetPositionX() == myDoors[1].GetPositionX()

		;Calculate: myDoorsMinMaxValue
		myDoorsMinMaxValues = new int[2]
		if (myDoorsHaveMatchingX)
			myDoorsMinMaxValues[0] = (Math.Min(myDoors[0].GetPositionY(), myDoors[1].GetPositionY()) + CONST_DoorBuffer) as int
			myDoorsMinMaxValues[1] = (Math.Max(myDoors[0].GetPositionY(), myDoors[1].GetPositionY()) + CONST_DoorBuffer) as int
		Else
			myDoorsMinMaxValues[0] = (Math.Min(myDoors[0].GetPositionX(), myDoors[1].GetPositionX()) + CONST_DoorBuffer) as int
			myDoorsMinMaxValues[1] = (Math.Max(myDoors[0].GetPositionX(), myDoors[1].GetPositionX()) + CONST_DoorBuffer) as int
		EndIf

		;Set up the Track's HelperConstructor.
		HC = new HelperConstructor
		HC.Helper = DLC01TrackSystem_TrackHelper
		HC.HelperSourceMarker = mySourceMarkers[currentSourceMarker]
		HC.HelperZOffset = TrackHeightOffsetZ
		HC.HelperScale = HelperScale
		HC.HelperAttachNode = sourceMarkerAttachNodes[currentSourceMarker]
		HC.ActorRefCollection = RefCollectionForActors

		;If the track starts active, start it.
		if (InitiallyActive)
			StartTrack()
		Else
			;Disable the sound markers.
			if (mySoundMarkers != None)
				int i = 0
				While (i < mySoundMarkers.Length)
					mySoundMarkers[i].DisableNoWait()
					i = i + 1
				EndWhile
			EndIf

			;Close the doors at either end of the track.
			int i = 0
			While (i < myDoors.Length)
				myDoors[i].SetOpenNoWait(False)
				i = i + 1
			EndWhile
		EndIf

		isInitialized = True
	EndIf
EndEvent


;If this track has a Dispatcher (DLC01Lair_Dispatcher), the Dispatcher waits until the track has initialized, then calls this function.
Function InitializeDispatch(DLC01:DLC01Lair_Dispatcher dispatcher, int trackID, bool shouldAddDropoffPoints)
	if (myDispatcher == None)
		;Record that we have a Dispatcher.
		myDispatcher = dispatcher

		;Stamp each of our dropoff points with the trackID the dispatcher is using for us.
		;This allows the dispatcher to pick a random dropoff point and look up which track it's associated with.
		int i = 0
		While (i < myDropoffPoints.Length)
			myDropoffPoints[i].SetValue(DLC01TrackSystemTrackID, trackID)
			i = i + 1
		EndWhile

		;Pass our dropoff points back to the dispatcher, which adds them to its own array.
		if (shouldAddDropoffPoints)
			myDispatcher.AddDropoffPoints(myDropoffPoints)
		EndIf
	EndIf
EndFunction


;On Unload, clear and clean up everything.
Event OnUnload()
	myDispatcher = None
	While (myMachines.Length > 0)
		myMachines[0].CleanupMachine(False)
		;CleanupMachine ultimately removes the machine from the array entirely, so don't increment the count.
	EndWhile
	mySourceMarkers.Clear()
	myDoors.Clear()
	myDropoffPoints.Clear()
	myDoorsMinMaxValues.Clear()
	isInitialized = False
EndEvent



;----------------------------------------------------------------
;Timer
;------

Event OnTimer(int timerID)
	if ((timerID == SPAWN_TIMER) && (spawnDelay > 0) && isMoving && !isPaused)
		CreateMachine(GetNextMachineConstructor())
	ElseIf (timerID == UPDATE_TRACK_SETTINGS_TIMER)
		UpdateTrackSettings(tempTrackSettingsData[0] as int, tempTrackSettingsData[1] as Int, tempTrackSettingsData[2], tempTrackSettingsData[3] as bool, tempTrackSettingsData[4] as bool)
	ElseIf (timerID == STOP_TRACK_TIMER)
		StopTrack()
	EndIf
EndEvent


;----------------------------------------------------------------
;Machine Functions
;------------------

;When the timer loop fires, spawn the next machine in the queue.
Function CreateMachine(MachineConstructor MC)
	;Ignore CreateMachine requests if:
	; - VATS playback is active, because OnTimer events are suspect during that mode.
	; - The track is already at capacity.
	if (Game.IsVATSPlaybackActive() || (myMachines.Length == capacity))
		StartTimer(spawnDelay, SPAWN_TIMER)
	Else
		;Spawn the Machine dummy object, which handles everything associated with this particular machine.
		DLC01:DLC01_TrackSystemMachine newMachine = mySourceMarkers[currentSourceMarker].PlaceAtMe(DLC01TrackSystem_MachineDummy) as DLC01:DLC01_TrackSystemMachine

		;Initialize it, spawning the machine's Helper, Arm, Platform, etc.
		newMachine.InitMachine(Self, HC, MC)

		;Add it to the array of active machines.
		myMachines.Add(newMachine)

		;If the track is moving, and we're not still setting up the track, send the machine off.
		if (isMoving && isInitialized)
			newMachine.StartMachine(speed)
		EndIf

		;Then restart the timer.
		if ((isMoving) && (spawnDelay > 0))
			StartTimer(spawnDelay, SPAWN_TIMER)
		EndIf
	EndIf
EndFunction


;Called by the Machine's CleanupMachine function.
;Machines disable and delete themselves and all of their parts, so all we have to do is update our own state.
Function CleanupMachine(DLC01:DLC01_TrackSystemMachine Machine, ObjectReference helper)
	;Remove the machine from our array of active machines.
	int MachineIndex = myMachines.Find(Machine)
	if (MachineIndex >= 0)
		myMachines.Remove(MachineIndex)
	EndIf
	;If there's nothing on the track, the track has stopped.
	if (myMachines.Length == 0)
		isMoving = False
		isPaused = False
	EndIf
EndFunction


;-----Construction Queue-----
;Since different threads might be trying to modify the ConstructionQueue array, all getters and setters are routed through a common function.
;
;Get the next machine from the queue so we can spawn it.
MachineConstructor Function GetNextMachineConstructor()
	return ModifyConstructionQueue(None)
EndFunction

;Add a machine to the queue (dropoff point specified as index).
Function AddMachineConstrutorIndex(Form object, Form keyObject=None, int dropoffPointIndex=-1, bool dropoffProhibited=False)
	if (dropoffPointIndex < 0)
		AddMachineConstructor(object, keyObject, None, dropoffProhibited)
	Else
		AddMachineConstructor(object, keyObject, myDropoffPoints[dropoffPointIndex], dropoffProhibited)
	EndIf
EndFunction

;Add a machine to the queue (dropoff point specified as object).
Function AddMachineConstructor(Form object, Form keyObject=None, ObjectReference dropoffPoint=None, bool dropoffProhibited=False)
	;We need to search the Presets array to find a matching machine. What's our search key?
	if (keyObject != None)
		;Use the provided key.
	ElseIf (object == None)
		;keyObject remains None. Fine.
	ElseIf (object is Actor)
		keyObject = (object as Actor).GetRace()
	ElseIf (object is ActorBase)
		keyObject = (object as ActorBase).GetRace()
	ElseIf (object is ObjectReference)
		keyObject = (object as ObjectReference).GetBaseObject()
	Else
		keyObject = object
	EndIf

	;Search the MachinePresets array for a matching Constructor.
	int index = MachinePresets.FindStruct("Object", keyObject, 0)

	MachineConstructor preset
	if (index >= 0)
		preset = MachinePresets[index]
	Else
		preset = MachineFallbackPresets[Utility.RandomInt(0, MachineFallbackPresets.Length - 1)]
	EndIf

	;If we found a match, create a new struct, merging our data with the preset.
	MachineConstructor c = new MachineConstructor
	c.Object = object
	c.DropoffProhibited = dropoffProhibited
	c.DropoffPoint = dropoffPoint
	c.Arm = preset.Arm
	c.ArmSpawnNode = preset.ArmSpawnNode
	c.Platform = preset.Platform
	c.PlatformHeightOffset = preset.PlatformHeightOffset
	c.ArmLight = preset.ArmLight

	;Then add it to the queue.
	ModifyConstructionQueue(c)
EndFunction

;For thread safety, this is the only function allowed to modify ConstructionQueue directly. It has two modes:
; - Setter Mode: If passed a Constructor, it adds it to the queue, and returns None.
; - Getter Mode: If passed None, it finds the next element in the queue and returns it.
MachineConstructor Function ModifyConstructionQueue(MachineConstructor c)
	if (c != None)
		;---Setter Mode---
		ConstructionQueue.Add(c)
		return None
	Else
		;---Getter Mode---
		if (constructionQueue.Length > 0)
			if (!ConstructionQueueShouldLoop)
				;If the queue is not looping, the element at [0] is up next. Remove it from the queue.
				c = ConstructionQueue[0]
				ConstructionQueue.Remove(0)

				;Check to see if that would exceed our Engaged Objects limit. If so, try again until we find a safe
				;machine to spawn, or until our queue has run out.
				if ((EngagedObjectsLimit > 0) && (objectsEngaged >= EngagedObjectsLimit))
					While ((c != None) && (c.Object != None) && (ConstructionQueue.Length > 0))
						c = ConstructionQueue[0]
						ConstructionQueue.Remove(0)
					EndWhile
				EndIf
			Else
				;If the queue is looping, we take the element at [myConstructionQueueIndex], and don't remove it.
				if (myConstructionQueueIndex >= constructionQueue.Length)
					myConstructionQueueIndex = 0
				EndIf
				c = ConstructionQueue[myConstructionQueueIndex]

				;Check to see if that exceeds our Engaged Objects limit. If so, remove it from the queue (even though
				;we're looping) and try again until we find a safe machine to spawn, or until our queue has run out.
				if ((EngagedObjectsLimit > 0) && (objectsEngaged >= EngagedObjectsLimit))
					While ((c != None) && (c.Object != None) && (ConstructionQueue.Length > 0))
						ConstructionQueue.Remove(myConstructionQueueIndex)
						if (myConstructionQueueIndex == ConstructionQueue.Length)
							myConstructionQueueIndex = ConstructionQueue.Length - 1
						EndIf
						c = ConstructionQueue[myConstructionQueueIndex]
					EndWhile
				EndIf

				myConstructionQueueIndex = myConstructionQueueIndex + 1
			EndIf
		EndIf

		;If we still don't have anything to return, just pick randomly from the fallback list.
		if (c == None)
			c = MachineFallbackPresets[Utility.RandomInt(0, MachineFallbackPresets.Length - 1)]
		EndIf

		return c
	EndIf
EndFunction



;----------------------------------------------------------------
;Track State Functions
;-------------------------

;Start the track.
Function StartTrack()
	;Error checking.
	if (isPaused)
		Debug.Trace("TRACK ERROR: " + Self + " was paused, and received a StartTrack call instead of a ResumeTrack call. This is not supported.", 2)
		return ;Safest thing to do is ignore this call and remain paused.
	EndIf
	if (isMoving)
		Debug.Trace("TRACK ERROR: " + Self + " was already moving, and received a StartTrack call.", 2)
		return ;Safest thing to do is ignore this call and let the current movement finish.
	EndIf
	if ((myMachines.Length == 0) && (spawnDelay == 0))
		Debug.Trace("TRACK ERROR: " + Self + " was told to start, but has no active Machines.", 2)
		return ;Bail out and don't do anything.
	EndIf

	;The track is now moving.
	isMoving = True

	;Open the doors at either end of the track.
	;Debug.Trace("THIS IS TRACK " + Self + " opening doors.")
	int i = 0
	While (i < myDoors.Length)
		myDoors[i].SetOpenNoWait(True)
		i = i + 1
	EndWhile

	;Enable the sound markers.
	if (mySoundMarkers != None)
		i = 0
		While (i < mySoundMarkers.Length)
			mySoundMarkers[i].EnableNoWait()
			i = i + 1
		EndWhile
	EndIf

	;If there are Machines already on the track (from InitialMachinePositions, etc.), they start moving.
	if (myMachines.Length > 0)
		i = 0
		While (i < myMachines.Length)
			myMachines[i].StartMachine(speed)
			i = i + 1
		EndWhile
	EndIf

	;Start the spawn timer.
	if (spawnDelay > 0)
		StartTimer(0, SPAWN_TIMER)
	EndIf 
EndFunction


;Stop the track.
Function StopTrackNoWait()
	StartTimer(0, STOP_TRACK_TIMER)
EndFunction

Function StopTrack()
	if (isPaused)
		;If we were paused, we need to resume moving, since we're about to wait for the track to clear,
		;and it obviously can't clear if none of the machines are moving.
		ResumeTrack()
	EndIf

	;Error checking.
	if (!isMoving)
		return ;Nothing to do.
	EndIf

	;Clear the track. This also sets isMoving=False.
	ClearTrack()

	;Close the doors at either end of the track.
	int i = 0
	While (i < myDoors.Length)
		myDoors[i].SetOpenNoWait(False)
		i = i + 1
	EndWhile
EndFunction


;Pause the track, stopping the machines in place.
Function PauseTrack()
	;Error checking.
	if (isPaused)
		Debug.Trace("WARN: " + Self + " was told to pause, but was already paused.", 1)
		return
	ElseIf (!isMoving)
		Debug.Trace("WARN: " + Self + " was told to pause, but wasn't moving anyway.", 1)
		return
	EndIf

	isMoving = False
	isPaused = True

	int i = 0
	While (i < myMachines.Length)
		myMachines[i].PauseMachine()
		i = i + 1
	EndWhile

	;Disable the sound markers.
	if (mySoundMarkers != None)
		i = 0
		While (i < mySoundMarkers.Length)
			mySoundMarkers[i].DisableNoWait()
			i = i + 1
		EndWhile
	EndIf
EndFunction


;Resume from the paused state.
Function ResumeTrack()
	;Error checking.
	if (!isPaused)
		Debug.Trace("TRACK ERROR: " + Self + " was told to resume, but wasn't paused.", 2)
		return
	EndIf

	int i = 0
	While (i < myMachines.Length)
		myMachines[i].ResumeMachine()
		i = i + 1
	EndWhile

	;Enable the sound markers.
	if (mySoundMarkers != None)
		i = 0
		While (i < mySoundMarkers.Length)
			mySoundMarkers[i].EnableNoWait()
			i = i + 1
		EndWhile
	EndIf

	isMoving = True
	isPaused = False

	;Start the spawn timer.
	if (spawnDelay > 0)
		StartTimer(spawnDelay, SPAWN_TIMER)
	EndIf 
EndFunction


;Clear the track, waiting for all machines to move off of the track before returning.
;As a side effect, this also sets isMoving=False and isPaused=False.
Function ClearTrack()
	if (myMachines.Length == 0)
		isMoving = False
		isPaused = False
		;Debug.Trace("Track was already clear. Returning.")
	Else
		;Debug.Trace("Clearing track. Please wait.")
		float oldSpawnDelay = spawnDelay
		spawnDelay = 0

		if (isPaused)
			ResumeTrack()
		ElseIf (!isMoving)
			StartTrack()
		EndIf

		;Use a while loop to wait for the track to clear, or for something to happen that means it'll never clear.
		While ((myMachines.Length > 0) && (Self.Is3DLoaded()) && (isMoving || isPaused))
			Debug.Trace("Waiting..." + Self)
			Utility.Wait(1)
		EndWhile

		;Disable the sound markers.
		if (mySoundMarkers != None)
			int i = 0
			While (i < mySoundMarkers.Length)
				Debug.Trace("Sound Markers: " + Self + " is disabling " + mySoundMarkers[i])
				mySoundMarkers[i].DisableNoWait()
				i = i + 1
			EndWhile
		EndIf

		isMoving = False
		isPaused = False
		spawnDelay = oldSpawnDelay
		;Debug.Trace("Track is clear.")
	EndIf
EndFunction


;Updates all of the minor track settings (below) at once.
;This is the non-latent version of UpdateTrackSettings, below. Stores its params, then forks off a timer to handle the update.
Function UpdateTrackSettingsNoWait(int newSourceMarker, int newCapacity, float newSpeed, bool shouldLoopQueue, bool shouldStart)
	tempTrackSettingsData = new Float[5]
	tempTrackSettingsData[0] = newSourceMarker
	tempTrackSettingsData[1] = newCapacity
	tempTrackSettingsData[2] = newSpeed
	tempTrackSettingsData[3] = shouldLoopQueue as Float
	tempTrackSettingsData[4] = shouldStart as Float
	;Introduce a small delay here, so if this is called on multiple tracks at once (as it usually is), they aren't
	;all in perfect sync with one another.
	StartTimer(Utility.RandomFloat(0, 1), UPDATE_TRACK_SETTINGS_TIMER)
EndFunction

;Updates all of the minor track settings at once.
Function UpdateTrackSettings(int newSourceMarker, int newCapacity, float newSpeed, bool shouldLoopQueue, bool shouldStart)
	SetSourceMarker(newSourceMarker)
	ConstructionQueueShouldLoop = shouldLoopQueue
	SetCapacity(newCapacity)
	SetSpeed(newSpeed)
	;Debug.Trace("SHOULD START?" + Self + ", " + shouldStart)
	if (!isMoving && shouldStart)
		Debug.Trace("--Starting " + Self)
		StartTrack()
	EndIf
EndFunction


;Changes the track's source marker. Effectively, this changes the direction the track moves.
Function SetSourceMarker(int newSourceMarker, bool shouldRestartWhenDone = True)
	if (newSourceMarker == currentSourceMarker)
		;Debug.Trace("SetSourceMarker: Source marker remains the same.")
	Else
		;We have to clear the track before changing its direction.
		ClearTrack()

		;Set the new source marker.
		currentSourceMarker = newSourceMarker
		if (HC != None)
			HC.HelperSourceMarker = mySourceMarkers[newSourceMarker]
			HC.HelperAttachNode = sourceMarkerAttachNodes[newSourceMarker]
		EndIf

		;If we're restarting the track, do so.
		if (shouldRestartWhenDone)
			StartTrack()
		EndIf
	EndIf
EndFunction


Function SetCapacity(int newCapacity)
	if (newCapacity == capacity)
		;Debug.Trace("SetCapacity: Capacity remains the same.")
	Else
		capacity = newCapacity
		spawnDelay = speed / capacity
	EndIf

	;Start the spawn timer.
	if (spawnDelay > 0)
		StartTimer(spawnDelay, SPAWN_TIMER)
	EndIf
EndFunction


Function SetSpeed(float newSpeed)
	if (newSpeed == speed)
		;Debug.Trace("SetSpeed: Speed remains the same.")
	Else
		;Update all of the machines currently on the track.
		int i = 0
		While (i < myMachines.Length)
			myMachines[i].SetSpeed(newSpeed)
			i = i + 1
		EndWhile

		;Set the speed for newly-spawned Machines.
		speed = newSpeed
		spawnDelay = speed / capacity

		;Start the spawn timer.
		if (spawnDelay > 0)
			StartTimer(spawnDelay, SPAWN_TIMER)
		EndIf		
	EndIf
EndFunction


Function SetEngagedObjectsLimit(int newLimit, bool shouldResetCount)
	EngagedObjectsLimit = newLimit
	if (shouldResetCount)
		objectsEngaged = 0
	EndIf
EndFunction


;----------------------------------------------------------------
;Utility & Support Functions
;----------------------------

;-----Dispatcher Support-----
;If the track has a Dispatcher, when a machine places/spawns its object, relay that up to the Dispatcher.
Function MachineObjectPlaced(DLC01:DLC01_TrackSystemMachine Machine, ObjectReference MachineObject)
	if (myDispatcher != None)
		myDispatcher.MachineObjectPlaced(Machine, MachineObject)
	EndIf
EndFunction

;-----Machine Support-----
;If the track has an Engaged Objects Limit, update the count when the player engages an object
;(that is, when the Machine drops the object).
Function MachineObjectEngaged(ObjectReference objectEngaged)
	if ((objectEngaged != None) && (EngagedObjectsLimit > 0))
		objectsEngaged = objectsEngaged + 1
	EndIf
EndFunction

;Machines check to make sure they only drop their objects if the objects are in the playable space.
bool Function IsObjectInPlayableSpace(ObjectReference obj)
	if (obj == None)
		return False
	EndIf
	if (myDoorsHaveMatchingX)
		float objY = obj.GetPositionY()
		return ((objY > myDoorsMinMaxValues[0]) && (objY < myDoorsMinMaxValues[1]))
	Else
		float objX = obj.GetPositionX()
		return ((objX > myDoorsMinMaxValues[0]) && (objX < myDoorsMinMaxValues[1]))
	EndIf
EndFunction

;A lot of machines want to drop their carried object on a specific mark. The most efficient way to do that is with an OnDistanceLessThan event.
;But what distance do we ask the event for? We know the track will pass over the dropoff point, but OnDistanceLessThan uses linear distance;
;we can't just check against one component of the distance. And the vertical distance between the track and its dropoff points varies; some tracks
;are at ascending or descending angles, and the dropoff points can be on different levels of the room. Yuck.
;
;This one took a while. But it works.
float Function CalculateDropDistance(ObjectReference dropPoint, float platformHeightOffset)
	;A object will never arrive at the actual drop point, of course, it'll be some distance above it.
	float zDifferential = mySourceMarkers[currentSourceMarker].GetPositionZ() - dropPoint.GetPositionZ()

	;If the track is level, ok. But if the track is on an angle, that's not good enough. Instead of being at the spawn marker's Z, the object is
	;going to be higher or lower based on where it is along the track. So we need to do some trig. I hate trig.
	if (sourceMarkerAngle != 0)
		float horizontalDifferential
		if (mySourceMarkers[currentSourceMarker].GetPositionX() != dropPoint.GetPositionX())
			horizontalDifferential = Math.Abs(mySourceMarkers[currentSourceMarker].GetPositionX() - dropPoint.GetPositionX())
		Else
			horizontalDifferential = Math.Abs(mySourceMarkers[currentSourceMarker].GetPositionY() - dropPoint.GetPositionY())
		EndIf
		float sign
		if (mySourceMarkers[currentSourceMarker].GetPositionZ() > mySourceMarkers[1-currentSourceMarker].GetPositionZ())
			sign = 1.0
		Else
			sign = -1.0
		EndIf
		zDifferential = zDifferential + (Math.Tan(sourceMarkerAngle) * horizontalDifferential * sign)
	EndIf

	;Even that's not quite enough. The object on the track is moving at speed, so when it falls, it falls at an angle. So we have to drop it a little
	;early to compensate and let it hit its mark. And we have to define 'early' in terms of distance relative to the speed of the track.
	;I worked out a system of equations for that (yes, really), but rather than solve a polynomial here, I've just precalculated the values and put them
	;in an array. So go fetch the precalculated offset.
	float dropDistanceOffset
	if ((speed > 0) && (speed < CONST_TrackSystemDropDistanceOffsets.Length))
		dropDistanceOffset = CONST_TrackSystemDropDistanceOffsets[speed as int]
	Else
		dropDistanceOffset = CONST_TrackSystemDropDistanceOffsets[CONST_TrackSystemDropDistanceOffsets.Length - 1]
	EndIf

	;Debug.Trace("DROP INFO: " + zDifferential + ", " + dropDistanceOffset + ", " + platformHeightOffset)
	return zDifferential + dropDistanceOffset + platformHeightOffset + TrackDropoffDistanceFudge
EndFunction


;-----Utility Functions-----

float Function GetSpawnDelay()
	return spawnDelay
EndFunction

float Function GetCapacity()
	Debug.Trace(myMachines.Length + "/" + capacity)
	return capacity
EndFunction

float Function GetSpeed()
	return speed
EndFunction

bool Function IsMoving()
	return isMoving
EndFunction

bool Function IsPaused()
	return isPaused
EndFunction

bool Function IsActive()
	return isMoving && !isPaused
EndFunction

bool Function HasInitialized()
	return isInitialized
EndFunction