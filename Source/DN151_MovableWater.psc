Scriptname DN151_MovableWater extends ObjectReference Hidden Conditional
{Control script for the movable water system.}
;
;This script is an iteration of the movable water system script originally used in Skyrim's Nchardak dungeon.
;It lives on the 'primary' movable water plane in a dungeon. In addition to handling its own translation, it also manages an array of DN151_WaterObjects
;that have registered as caring about the water height-- objects that need to be activated/enabled/disabled/etc. as the water rises or falls.
;
;This script includes some legacy features (such as allowing the water level to both rise and fall, etc.) that are not currently needed for DN151,
;but have been maintained in order to allow this system to be more easily repurposed in the future.


DN151_TrackingQuestScript property TrackingQuest Auto Mandatory
{Associated tracking quest. Mainly exists to hold a RefCollectionAlias used to clear the names of objects that can't be activated while underwater.}

float[] property WaterStages Auto Mandatory
{Array of potential water z-heights for this plane, lowest to highest.}

int property startingWaterStage Auto Mandatory
{Index into WaterStages; which height index we start at.}

int Property myWaterStage = -1 Auto Hidden Conditional
{Index into WaterStages; which height are we currently at?}

float property WaterTranslationSpeed = 30.0 Auto
{Speed at which the water plane moves. Default: 30}

Sound property WaterRiseSound Auto
{Sound to play when the water level is rising.}
int WaterRiseSoundID = -1 	;Tracking index for that sound.

Sound property WaterLowerSound Auto
{Sound to play when the water level is falling.}
int WaterLowerSoundID = -1 	;Tracking index for that sound.

DN151_WaterObject[] property WaterObjectsRegistry Auto Hidden
{Array of objects interested in height-change events from this water plane.}

ObjectReference[] property LinkedWaterPlanes Auto
{Optional secondary water planes associated with the main one. Translate to match its z-height.}


bool property initialized = False Auto Hidden			;Have we done our first-time initialization yet?

Actor player 										;Local ref to player.
bool isTranslating									;Are we moving?
bool rising 										;Are we moving up?
bool readyToMove									;Are we ready to begin translating?

float myX		;Stored position data for the main water plane.
float myY
float myZ
float myAngleX
float myAngleY
float myAngleZ
float myInitialZ

float[] linkX		;Stored position data for the linked water planes, if any.
float[] linkY
float[] linkAngleX
float[] linkAngleY
float[] linkAngleZ


;-----------------
;Attach & Load   ------------------------------------------------------------------
;-----------------

Event OnCellLoad()
	;Debug.Trace("MOVABLE WATER: Loaded.")
	;On first load, store off local variables.
	if (!initialized)
		player = Game.GetPlayer()

		;Store position data for the main water plane.
		myX = Self.GetPositionX()
		myY = Self.GetPositionY()
		myAngleX = Self.GetAngleX()
		myAngleY = Self.GetAngleY()
		myAngleZ = Self.GetAngleZ()
		myInitialZ = Self.GetPositionZ()

		if (LinkedWaterPlanes != None)
			linkX = new float[LinkedWaterPlanes.Length]
			linkY = new float[LinkedWaterPlanes.Length]
			linkAngleX = new float[LinkedWaterPlanes.Length]
			linkAngleY = new float[LinkedWaterPlanes.Length]
			linkAngleZ = new float[LinkedWaterPlanes.Length]

			;Store position data for the linked water planes.
			int i = 0
			While (i < LinkedWaterPlanes.Length)
				linkX[i] = LinkedWaterPlanes[i].GetPositionX()
				linkY[i] = LinkedWaterPlanes[i].GetPositionY()
				linkAngleX[i] = LinkedWaterPlanes[i].GetAngleX()
				linkAngleY[i] = LinkedWaterPlanes[i].GetAngleY()
				linkAngleZ[i] = LinkedWaterPlanes[i].GetAngleZ()
				i = i + 1
			EndWhile
		EndIf

		if (WaterStages.Length < startingWaterStage)
 			Debug.Trace("ERROR: " + Self + " has no water stages, or an invalid starting stage.", 2)
		Else
			myZ = WaterStages[startingWaterStage]
			myWaterStage = startingWaterStage
		EndIf
		if (WaterObjectsRegistry == None)
			WaterObjectsRegistry = new DN151_WaterObject[0]
		EndIf
		initialized = True
 		;Debug.Trace("MOVABLE WATER: Initialized.")
	EndIf

	;On load, snap the water to its target height. This has to be done here instead of, say, in an OnCellAttach block,
	;because water asserts if you try to move it while its 3D is unloaded.
	Self.TranslateTo(myX, myY, myZ, myAngleX, myAngleY, myAngleZ, 100000)
	if (LinkedWaterPlanes != None)
		;Debug.Trace("Initial move of " + LinkedWaterPlanes)
		int i = 0
		While (i < LinkedWaterPlanes.Length)
			LinkedWaterPlanes[i].TranslateTo(linkX[i], linkY[i], myZ, linkAngleX[i], linkAngleY[i], linkAngleZ[i], 100000)
			i = i + 1
		EndWhile
	EndIf
EndEvent

Event OnCellDetach()
	StopWaterSFX()			;Stop the raise/drain SFX to prevent them from playing indefinately.	
	CancelTimer()			;Cancel the timer to make sure it doesn't tick indefinately.
	Self.StopTranslation()	;Make sure we don't move the water anymore, or it will assert.
EndEvent


;-----------------
;Water Movement  ------------------------------------------------------------------
;-----------------

;Convenience function. Change the water's height to the next array position.
Function IncrementWaterStage(bool shouldIncrement)
	;Debug.Trace("IncrementWaterStage - " + shouldIncrement)
	if (shouldIncrement)
		SetWaterStage(myWaterStage + 1)
	Else
		SetWaterStage(myWaterStage - 1)
	EndIf
EndFunction

;Validates the new water stage and sets the water system up for a move.
;WILL NOT animate anything-- you have to call BeginWaterStageTranslation for that, after any VFX/SFX/timing delays/etc. you want to happen first.
;WILL poll the registry for anything that might be affected by the imminent change. This function exists as a seperate step because of the registry poll--
; it makes sure objects are notified (and activation blocked, etc.) before the move actually begins to prevent things from getting out of sync.
Function SetWaterStage(int newStage)
 	;Debug.Trace("SetWaterStage: " + newStage)
 	readyToMove = False
	if (newStage == myWaterStage)
		;Not necessarily an error, but worth throwing a caution about...
		Debug.Trace("WARNING: " + Self + " asked to move to its current stage.", 1)
		return
	ElseIf (WaterStages.Length == 0)
 		Debug.Trace("ERROR: " + Self + " still has no water stages!", 2)
 		return
 	ElseIf (newStage >= WaterStages.Length)
 		Debug.Trace("ERROR: " + Self + " index out of range: " + newStage, 2)
 		newStage = WaterStages.Length - 1
	ElseIf (newStage < 0)
		Debug.Trace("ERROR: " + Self + " index out of range: " + newStage, 2)
 		newStage = 0
	EndIf
	;Is the water going to rise or fall?
	if (newStage > myWaterStage)
		rising = True
	Else
		rising = False
	EndIf
	myWaterStage = newStage
	myZ = WaterStages[newStage]
	PollRegistry() ;Update objects that are watching the water plane.
	readyToMove = True
 	;Debug.Trace("Setting Water Height (but not translating yet!).")
EndFunction

;Provided a new stage has been set (typically with SetWaterStage or IncrementWaterStage), starts the actual water translation.
Function BeginWaterStageTranslation()
	if (readyToMove)
		readyToMove = False
 		;Debug.Trace("Translating water to new height.")
 		;Debug.Trace("Stopping old translation.")
		Self.StopTranslation()
		;Debug.Trace("Starting new translation.")
		isTranslating = True
		;OLD: Start the SFX, passing rising (which may be true or false) to indicate the direction of motion.
		StartWaterSFX(rising)
		if (LinkedWaterPlanes == None)
			Self.TranslateTo(myX, myY, myZ, myAngleX, myAngleY, myAngleZ, WaterTranslationSpeed)
		Else
			Self.TranslateTo(myX, myY, myZ, myAngleX, myAngleY, myAngleZ, WaterTranslationSpeed)
			int i = 0
			While (i < LinkedWaterPlanes.Length)
				LinkedWaterPlanes[i].TranslateTo(linkX[i], linkY[i], myZ, linkAngleX[i], linkAngleY[i], linkAngleZ[i], WaterTranslationSpeed)
				i = i + 1
			EndWhile
		EndIf
		StartTimer(0)		;Start a timer to update objects that are watching the water plane during the translation process. Do the first update immediately.
	Else
		Debug.Trace("WARNING: Ignored a move request because " + Self + " was not ready.", 1)
	EndIf
EndFunction

;While the water plane is translating, periodically poll registry objects to alert them to the new water height.
Event OnTimer(int timerID)
	;Debug.Trace("Polling Registry: " + isTranslating)
	;Debug.Trace("Timer")
	PollRegistry()
	;Debug.Trace("Check for Translation: " + isTranslating)
	if (isTranslating)
		StartTimer(1)
	EndIf
EndEvent

Event OnTranslationComplete()
	;Debug.Trace("Translation Complete.")
	isTranslating = False
	StopWaterSFX()
	CancelTimer()
	;Debug.Trace("----------Final Poll----------")
	PollRegistry()	;Perform one final update for all registered objects.
EndEvent


;--------------
;Registry ------------------------------------------------------------------
;--------------

;Add a new object to the water plane's registry.
Function RegisterWaterObject(DN151_WaterObject obj)
	int index = WaterObjectsRegistry.Find(obj)
	if (index < 0)
		WaterObjectsRegistry.Add(obj)
	EndIf
EndFunction

;Remove an object from the registry. True if one was removed, false otherwise.
bool Function UnregisterWaterObject(DN151_WaterObject obj)
	int index = WaterObjectsRegistry.Find(obj)
	if (index < 0)
 		;Debug.Trace("ERROR: " + obj + " was not found in registry for " + Self)
		return False
	Else
		WaterObjectsRegistry.Remove(index)
		return True	
	EndIf
EndFunction

Function PollRegistry()
 	;Debug.Trace("WATER UPDATE FOR: " + Self + " -----------------------------")
	float currentZ = GetWaterHeight()
	int i = 0
	While (i < WaterObjectsRegistry.Length)
		WaterObjectsRegistry[i].WaterUpdate(myWaterStage, currentZ)
		i = i + 1
	EndWhile
 	;Debug.Trace("-----------------------------------------")
EndFunction

;Remove the name from an object (by forcing it into an alias on the Tracking Quest with a blank display name override).
int Function ClearName(ObjectReference obj)
	TrackingQuest.ClearNameOnObject(obj)
EndFunction

;Restore the name of an object (by removing it from an alias that was clearing its name).
int Function RestoreName(ObjectReference obj)
	TrackingQuest.RestoreNameOnObject(obj)
EndFunction


;-----------------------------------
;Sound, Utility & Helper Functions ------------------------------------------------------------------
;-----------------------------------

;Returns the current water stage.
int Function GetWaterStage()
	if (myWaterStage < 0)
		return startingWaterStage
	Else
		return myWaterStage
	EndIf
EndFunction

;Returns the current water height.
float Function GetWaterHeight()
	;Debug.Trace("Water: " + Self +" returns height " + Self.GetPositionZ())
	return Self.GetPositionZ()
EndFunction

;Play Water SFX
Function StartWaterSFX(bool isRising)
	;Debug.Trace("Water SFX Started")
	StopWaterSFX()
	if (isRising)
		if (WaterRiseSound != None)
			WaterRiseSoundID = WaterRiseSound.Play(player)
		EndIf
	Else
		if (WaterLowerSound != None)
			WaterLowerSoundID = WaterLowerSound.Play(player)
		EndIf
	EndIf
EndFunction

;Stop Water SFX
Function StopWaterSFX()
	;Debug.Trace("Water SFX Ended")
	if (WaterRiseSoundID >= 0)
		Sound.StopInstance(WaterRiseSoundID)
		WaterRiseSoundID = -1
		TrackingQuest.StopPumpActivationSFX()
	EndIf
	if (WaterLowerSoundID >= 0)
		Sound.StopInstance(WaterLowerSoundID)
		WaterLowerSoundID = -1
		TrackingQuest.StopPumpActivationSFX()
	EndIf
EndFunction
