Scriptname DLC04:DLC04_RobotLiftScript extends ObjectReference
{Script for the Robot Lift, a combination platform and trapdoor that raises an object or actor up through a trapdoor in the floor.}
;
;There are two main ways in which this can be used:
; - You can place an object or actor on it in the Editor, link it to the actor (with the LinkKeyword), and when you activate it, it'll send them up.
; - You can give it an object to place or spawn, and it'll place/spawn that object and send it up.


Group User_Properties
	Keyword property LinkKeyword Auto Const
	{Default: NONE. Keyword of the linked ref to this lift's initial object, if any.}

	float property Speed = 0.75 Auto
	{Default: 0.75. The speed of the platform animation (a multiplier).}

	float property Delay = 1.5 Auto
	{Default: 1.5. Amount of time to flash the lights before actually playing the lift animation.}

	RefCollectionAlias property RefCollectionForActors Auto Const
	{OPTIONAL. Defualt: NONE. RefCollection to add placed or spawned actors to.}
EndGroup 

Group Autofill_Properties
	ObjectReference property DLC04_LiftSpawnPoint Auto Const Mandatory	;XMarker in a holding cell where objects are spawned. Prevents them from starting conscious in the play space.
	Keyword property DLC04RobotLiftAnimatedLightsLink Auto Const Mandatory;Keyword used to link the lift to its animated warning lights.
	Keyword property DLC04RobotLiftLightsLink Auto Const Mandatory		;Keyword used to link the lift to the actual lights synced with its animated lights.
	Keyword property DLC04RobotLiftSoundLink Auto Const Mandatory		;Keyword used to link the lift to its warning sound marker.
	Static property XMarker Auto Const Mandatory						;Standard XMarker.
EndGroup

;Local constants.
int property CONST_LightsTimer = 1 Auto Hidden Const		;Timer const for light events.
int property CONST_RunPlatformTimer = 2 Auto Hidden Const 	;Timer const for the platform animation event.

;Local properties.
bool initialized			;Has this lift been initialized?
ObjectReference mySpawnMarker	;Marker on the platform to place newly-spawned objects at (since PlaceAtNode doesn't give us settings for actors, and the pivot is is aligned with the floor).
ObjectReference myObject 	;The current object on the lift. If it's an actor, we set it conscious as the trapdoor opens.
Form[] myQueue				;Queue of objects waiting to be pushed up through the lift. Primarily intended as a failsafe in case the lift is sent a new request while it's busy,
						;since we can't gracefully fail to spawn an actor the boss battle is relying on. Actors spawned by the queue always use aiLevelMod=1 (Easy).
bool myLightsActive = False	;Should the lights be blinking?
bool myLightsOn = True		;If the lights are blinking, are they currently off?
ObjectReference mySoundMarker	;The sound marker associated with the lift.

;Custom Events for the lights. (If you just loop through and call PlayAnimation on each, they won't synchronize properly).
CustomEvent Off
CustomEvent Red
;CustomEvent Yellow		;Not currently used, but these work if we want to use them.
;CustomEvent Green

Event OnCellLoad()
	if (!initialized)
		initialized = True
		mySpawnMarker = Self.PlaceAtNode("LiftBase01", XMarker)
		myQueue = new Form[0]

		;If we have an initial object, store it. If it's an actor, make sure it starts unconscious.
		myObject = Self.GetLinkedRef(LinkKeyword)
		Actor myObjectActor = myObject as Actor
		if (myObjectActor != None)
			myObjectActor.SetUnconscious(True)
		EndIf

		;If we have animated lights, store and initialize them.
		ObjectReference[] myAnimatedLights = Self.GetLinkedRefChain(DLC04RobotLiftAnimatedLightsLink)
		int i = 0
		While (i < myAnimatedLights.Length)
			DLC04:DLC04_RobotLiftLightScript nextLight = myAnimatedLights[i] as DLC04:DLC04_RobotLiftLightScript
			if (nextLight != None)
				(myAnimatedLights[i] as DLC04:DLC04_RobotLiftLightScript).InitializeLight(Self)
			EndIf
			i = i + 1
		EndWhile

		;If we have actual lights, they start disabled.
		Self.DisableLinkChain(DLC04RobotLiftLightsLink)

		mySoundMarker = Self.GetLinkedRef(DLC04RobotLiftSoundLink)
	EndIf
	;Register for the animation events from the platform. We need to re-register each time the cell loads,
	;since the registration is lost when the graph unloads.
	Self.RegisterForAnimationEvent(Self, "Open")	 ;Trapdoor is starting to open.
	Self.RegisterForAnimationEvent(Self, "Stop01");Trapdoor has finished closing.
	Self.RegisterForAnimationEvent(Self, "Done")	 ;Platform has reset and is ready to go again.
EndEvent

;Use-Case 1: Activating this ref just runs the lift (pushes the platform up, opens the trapdoor, activates the actor).
Event OnActivate(ObjectReference akActivator)
	RunLift()
EndEvent

;Use-Case 2: Place or spawn an object, then run the lift.
Function PlaceAndRun(Form objectToPlace, int actorLevelMod = 1)
	PlaceObject(objectToPlace, actorLevelMod)
	RunLift()
EndFunction


;READY STATE: The platform is ready to receive new objects and animate.
Auto State Ready
	Function PlaceObject(Form objectToPlace, int actorLevelMod = 1)
		DoPlaceObject(objectToPlace, actorLevelMod)
	EndFunction

	Function RunLift()
		GoToState("Busy")
		myLightsActive = True
		StartTimer(0, CONST_LightsTimer)
		StartTimer(Delay, CONST_RunPlatformTimer)
	EndFunction
EndState

;BUSY STATE: The platform is animating. Queue new objects instead of placing them; don't make animation calls.
State Busy
	Function PlaceObject(Form objectToPlace, int actorLevelMod = 1)
		myQueue.Add(objectToPlace)
		Debug.Trace("Enqueued " + objectToPlace)
	EndFunction

	Function RunLift()
		;Do nothing.
	EndFunction
EndState

;These functions have to exist in the base state.
Function PlaceObject(Form objectToPlace, int actorLevelMod = 1)
EndFunction
Function RunLift()
EndFunction


;Handle animation events coming from the lift.
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace(Self + " received anim event " + asEventName)
	if (asEventName == "Open")
		;Once the trapdoor starts to open, if our object is an actor, set them conscious.
		Actor myObjectActor = myObject as Actor
		if (myObjectActor != None)
			myObjectActor.SetUnconscious(False)
		EndIf
		;;;myObject = None
	ElseIf (asEventName == "Stop01")
		;Once the platform has visibly finished moving, the lights stop blinking.
		Debug.Trace("Received Stop01")
		myLightsActive = False
	ElseIf (asEventName == "Done")
		;Once the lift has reset, trigger the next object in the queue (if any).
		;If the queue is empty, we're ready to receive more events.
		if (myObject.GetPositionZ() < (Self.GetPositionZ() + 60))
			Debug.Trace("Lift object " + myObject + " fell through!")
			Actor myObjectActor = myObject as Actor
			if (myObjectActor != None)
				myObjectActor.Kill()
			EndIf
		EndIf
		myObject = None
		if (myQueue.Length > 0)
			Debug.Trace("Dequeued " + myQueue[0])
			OnAnimationEvent(akSource, "Open")
			DoPlaceObject(myQueue[0])
			myQueue.Remove(0)
			Self.SetAnimationVariableFloat("fspeed", Speed)
			Self.PlayAnimation("Play01")
			myLightsActive = True 
			StartTimer(0, CONST_LightsTimer)
		Else
			GoToState("Ready")
		EndIf
	EndIf
EndEvent

;Toggle the lights while the lift is moving.
Event OnTimer(int timerID)
	if (timerID == CONST_LightsTimer)
		myLightsOn = !myLightsOn && myLightsActive
		if (myLightsOn)
			SendCustomEvent("Red")
			Self.EnableLinkChain(DLC04RobotLiftLightsLink)
		Else
			SendCustomEvent("Off")
			Self.DisableLinkChain(DLC04RobotLiftLightsLink)
		EndIf
		if (myLightsActive)
			mySoundMarker.EnableNoWait()
			StartTimer(0.75, CONST_LightsTimer)
		Else
			mySoundMarker.DisableNoWait()
		EndIf
	ElseIf (timerID == CONST_RunPlatformTimer)
		Self.SetAnimationVariableFloat("fspeed", Speed)
		Self.PlayAnimation("Play01")
	EndIf
EndEvent

;INTERNAL ONLY: Intended as a private function.
;Actually place the object on the lift, irrespective of the state of the lift.
Function DoPlaceObject(Form objectToPlace, int actorLevelMod = 1)
	;If we've already got an object, warn about it. This is legal (eg. I want to spawn five mines!), but may be a bug.
	if (myObject != None)
		Debug.Trace("WARNING: Lift " + Self + " is placing a new object, " + objectToPlace + ", displacing " + myObject, 1)
	EndIf

	;Figure out what kind of object we're dealing with. Spawn it if necessary.
	ObjectReference object
	if (objectToPlace == None)
		return
	ElseIf (objectToPlace is ObjectReference)
		object = objectToPlace as ObjectReference
		Actor myObjectActor = object as Actor
		if (myObjectActor != None)
			myObjectActor.SetUnconscious(True)
			if ((RefCollectionForActors != None) && (RefCollectionForActors.Find(myObjectActor) < 0))
				RefCollectionForActors.AddRef(myObjectActor)
			EndIf
		EndIf
	ElseIf (objectToPlace is ActorBase)
		Actor myObjectActor = DLC04_LiftSpawnPoint.PlaceActorAtMe((objectToPlace as ActorBase), actorLevelMod, Self.GetEncounterZone())
		myObjectActor.SetUnconscious(True)
		if ((RefCollectionForActors != None) && (RefCollectionForActors.Find(myObjectActor) < 0))
			RefCollectionForActors.AddRef(myObjectActor)
		EndIf
		object = myObjectActor
	Else
		object = DLC04_LiftSpawnPoint.PlaceAtMe(objectToPlace)
	EndIf

	;Then move it into position.
	object.MoveTo(mySpawnMarker)
	object.WaitFor3DLoad()
	myObject = object
EndFunction