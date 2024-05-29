Scriptname DLC01:DLC01_TrackSystemMachine extends ObjectReference
{Part of the DLC01 Track System. Script on a spawned dummy object that manages a group of objects moving along a track.}

Group _BASE_Machine_Properties CollapsedOnRef
	Form[] property IgnoreHitsList Auto Const							;List of things we ignore hit events from, to prevent one explosion from chain-triggering multiple objects.
EndGroup

Group Autofill_Properties CollapsedOnRef
	Static property XMarker Auto Const Mandatory							;The standard XMarker.
	Keyword property DLC01TrackSystemCarriedObject Auto Const Mandatory		;Keyword on Actors being carried on the track. Prevents the TrackSystemDoorTrigger from detecting them.
	ActorValue property DLC01TrackSystemDropoffPointBusy Auto Const Mandatory 	;ActorValue used to indicate a 'Busy' dropoff point. Cleared when an object sent there drops.
EndGroup

;Local Variables
;-----Machine Components-----
DLC01:DLC01_TrackSystemTrack myTrack	;The track this Machine is moving on. The track script manages all of the Machines on the track.
ObjectReference myHelper				;The animated object that the Arm and Platform are attachref'd to. Its animation controls their motion.
ObjectReference myArm 				;The visible mechanical device that moves along the track. Doesn't do anything, just there for appearances. Attachref'd to myHelper.
ObjectReference myPlatform			;A support object. In most cases, it's an invisible collision basket that holds myObject in place. Attachref'd to myHelper.
ObjectReference myArmLight 			;Optionally, a light attachref'd to the arm.
ObjectReference myObject 			;The reference being carried by the Machine. May be an actor or other object (mine, trap, etc.). Typically not Attachref'd; sits on myPlatform.
ObjectReference myDropoffPoint		;A marker that we want to drop myObject onto.

float mySpeed						;The Machine's movement speed, expressed in seconds to cross the full track.
float myStartPosition				;The Machine's starting position on the track, in percent (0-1.0) exclusive. Used to determine its movement speed offset when it starts moving.
float myPlatformHeightOffset			;The Machine's platform height offset, if any. Compensates if the platform elevats the object more (or less) than usual.

RefCollectionAlias ActorRefCollection	;RefCollectionAlias to add actors carried by the track to.

;-----Machine State-----
bool isOnTrack = False			;Is the machine somewhere other than its starting position? (May or may not be moving).
bool isMoving = False			;Is the Machine in the playable space AND moving? (Implies isOnTrack=True)
bool isPaused = False			;Is the Machine paused on the track? (Implies isOnTrack=True, isMoving=False)
bool hasDroppedObject = False 	;Has the machine dropped its object, if any?
bool dropoffProhibited = False 	;Do we want to prevent the Machine from dropping its object? (This blocks all drops EXCEPT for actor deaths; we always drop dead actors.


;-------------------------
;Setup & Cleanup
;----------------

;Called by the Track script's CreateMachine function. When a new Machine is spawned, initialize it.
Function InitMachine(DLC01:DLC01_TrackSystemTrack track, DLC01:DLC01_TrackSystemTrack:HelperConstructor HC, DLC01:DLC01_TrackSystemTrack:MachineConstructor MC)
	;Debug.Trace("Spawned " + Self + " with object " + MC.Object)
	;Store the track.
	myTrack = track

	;Spawn and position the helper, using the data from the HelperConstructor struct.
	myHelper = HC.HelperSourceMarker.PlaceAtMe(HC.Helper)
	myHelper.MoveTo(HC.HelperSourceMarker, 0, 0, HC.HelperZOffset, True)
	myHelper.SetScale(HC.HelperScale)
	myHelper.WaitFor3DLoad()

	;Spawn and attach the Arm and Platform specified by the MachineConstructor.
	if (MC.Arm != None)
		myArm = myHelper.PlaceAtNode(HC.HelperAttachNode, MC.Arm, 1, False, False, True, True)
		myArm.WaitFor3DLoad()
	EndIf
	if (MC.Platform != None)
		myPlatform = myHelper.PlaceAtNode(HC.HelperAttachNode, MC.Platform, 1, False, False, True, True)
		myPlatformHeightOffset = MC.PlatformHeightOffset
		myPlatform.WaitFor3DLoad()
	EndIf

	;Then deal with its object.
	if (MC.Object != None)
		;Store the Dropoff Point marker and bool.
		myDropoffPoint = MC.DropoffPoint
		dropoffProhibited = MC.dropoffProhibited

		;Place or spawn its object, if any.
		;Debug.Trace("InitMachine called with object: " + MC.Object)
		if ((MC.Object != None) && (MC.Object is ObjectReference))
			;If MC.Object is a reference, just use it.
			myObject = MC.Object as ObjectReference

			;If it's an actor, also make sure it's unconscious.
			Actor myObjectActor = myObject as Actor
			if (myObjectActor != None)
				myObjectActor.SetUnconscious(True)
			EndIf

			;Add the keyword indicating that myObject is a carried object.
			myObject.AddKeyword(DLC01TrackSystemCarriedObject)

			;Then place it at the Arm's spawn point.
			myObject.MoveToNode(myArm, MC.ArmSpawnNode)
		Else
			;Otherwise, we need to spawn the object.
			if (MC.Object is ActorBase)
				;Actors: Actors we spawn are placed at the SpawnPoint, set unconscious, and then moved onto the platform.
				Actor a = myTrack.DLC01_TrackSystemSpawnPoint.PlaceActorAtMe((MC.Object as ActorBase), 1, myTrack.TrackEncounterZone)
				a.AddKeyword(DLC01TrackSystemCarriedObject)
				a.SetUnconscious(True)
				a.MoveToNode(myArm, MC.ArmSpawnNode)
				myObject = a
			ElseIf (MC.Object is Activator)
				;Activators: Activators we spawn are attachref'd to myHelper if possible.
				if (MC.ArmSpawnNode == "")
					myObject = myArm.PlaceAtMe(MC.Object)
				Else
					myObject = myArm.PlaceAtNode(MC.ArmSpawnNode, MC.Object, 1, False, False, True, True)
				EndIf
				myObject.AddKeyword(DLC01TrackSystemCarriedObject)
				;This sets up an odd problem. We don't have a way to run distance checks on the Activator, since it and all of the other components
				;of its machine are attachref'd to myHelper, and the only attachref'd objects that get position updates are apparently XMarkers.
				;So we need one. Thankfully, the platform slot is always unused in this case (the activator is attachref'd; it doesn't need a platform
				;to carry it, so we'll use that.
				myPlatform = myHelper.PlaceAtNode(HC.HelperAttachNode, XMarker, 1, False, False, True, True)
				;Debug.Trace("Machine is: " + Self + " Platform is: " + myPlatform + " and Machine Attached.")
			Else
				;Everything Else: Everything else is just placed at SpawnMarker.
				if (MC.ArmSpawnNode == "")
					myArm.PlaceAtMe(MC.Object)
				Else
					myObject = myArm.PlaceAtNode(MC.ArmSpawnNode, MC.Object, 1, False, False, True, False)
				EndIf
				myObject.SetFactionOwner(myTrack.TrackOwnerFaction)
				myObject.AddKeyword(DLC01TrackSystemCarriedObject)
				;Debug.Trace("Machine is: " + Self + " Platform is: " + myPlatform + " and is " + myPlatform.IsEnabled())
			EndIf
		EndIf

		;Whatever the object, wait for its 3D to load.
		if (myObject != None)
			myObject.Waitfor3dLoad()

			if (myObject is DLC01:DLC01_TrackSystemTrapBase)
				(myObject as DLC01:DLC01_TrackSystemTrapBase).InitTrap(Self)
			EndIf

			;If we aren't prohibiting dropoff:
			if (!dropoffProhibited)
				;If we have a dropoff point, drop the object when it reaches that point.
				if (myDropoffPoint != None)
					;Debug.Trace("TRACK MACHINE: " + self + " trying to drop " + myObject + " at " + myDropoffPoint)
					RegisterForDistanceLessThanEvent(myObject, myDropoffPoint, myTrack.CalculateDropDistance(myDropoffPoint, MC.PlatformHeightOffset))
				EndIf

				;Register for hit events against the object or platform. The object will drop if it gets hit while in the playable space.
				RegisterForHitEvent(myObject)
				if (myPlatform != None)
					RegisterForHitEvent(myPlatform)
				EndIf
			EndIf

			;If the object is an actor (an existing ObjectReference, or one we spawned), register for its OnDying and OnDeath events. We drop dead actors
			;even if dropoff is otherwise prohibited, since we can't let them ragdoll while sitll in the platform's invisible collision box.
			Actor myObjectActor = myObject as Actor
			if (myObjectActor != None)
				RegisterForRemoteEvent(myObjectActor, "OnDying")
				RegisterForRemoteEvent(myObjectActor, "OnDeath")

				if (HC.ActorRefCollection != None)
					ActorRefCollection = HC.ActorRefCollection
					ActorRefCollection.AddRef(myObjectActor)
				EndIf
			EndIf

			;Notify the track that the object has been placed. It relays this on to the Dispatcher, which may care about it.
			myTrack.MachineObjectPlaced(Self, myObject)
		EndIf
	EndIf

	;Spawn and attach the ArmLight specified by the MachineConstructor.
	if (MC.ArmLight != None)
		myArmLight = myHelper.PlaceAtNode(HC.HelperAttachNode, MC.ArmLight, 1, False, False, True, False)
		myArmLight.WaitFor3DLoad()
		myArmLight.MoveTo(myArmLight, 0, 12, -34)
		myArmLight.AttachTo(myHelper)
	EndIf

	;Debug.Trace("-----------------------")
	;Debug.Trace("READOUT of " + Self)
	;Debug.Trace(myTrack + ", " + myHelper + ", " + myArm) 
	;Debug.Trace(myPlatform + ", " + myObject + ", " + myDropoffPoint) 
	;Debug.Trace("-----------------------")
EndFunction

;Machines are destroyed when they finish moving the full length of the track (finishedRunning=True), or when their parent track unloads (finishedRunning=False).
Function CleanupMachine(bool finishedRunning)
	;Unregister for events; we don't care any more.
	Self.UnregisterForAllEvents()

	;Let the track know the Machine has finished running and can be removed from its array.
	myTrack.CleanupMachine(Self, myHelper)

	;Clean up the object, if any.
	if (myObject != None)
		;If the machine is still carrying an object, disable, kill, and delete it.
		myObject.DisableNoWait()
		Actor myObjectActor = myObject as Actor
		if (myObjectActor != None)
			myObjectActor.Kill()
			if (ActorRefCollection != None)
				ActorRefCollection.RemoveRef(myObjectActor)
			EndIf
		EndIf
		myObject.Delete()
		myObject = None

		;If we were supposed to drop this object at a point, and failed to do so for whatever reason, make sure to clear
		;the 'busy' actor value flag on the drop point, too.
		if (myDropoffPoint != None)
			myDropoffPoint.SetValue(DLC01TrackSystemDropoffPointBusy, 0)
		EndIf
	EndIf

	;Clean up the reference to the dropoff point, if any.
	if (myDropoffPoint != None)
		myDropoffPoint = None
	EndIf

	;Clean up the platform.
	if (myPlatform != None)
		myPlatform.DisableNoWait()
		myPlatform.Delete()
		myPlatform = None
	EndIf

	;Clean up the light.
	if (myArmLight != None)
		myArmLight.DisableNoWait()
		myArmLight.Delete()
		myArmLight = None
	EndIf

	;Clean up the arm.
	if (myArm != None)
		myArm.DisableNoWait()
		myArm.Delete()
		myArm = None
	EndIf
	
	;Clean up the helper.
	myHelper.DisableNoWait()
	myHelper.Delete()
	myHelper = None

	;Clean up other properties.
	ActorRefCollection = None

	;Then delete ourself.
	Self.DisableNoWait()
	Self.Delete()

	;Debug.Trace("CLEANUP of " + Self)
EndFunction


;-------------------------
;Machine Movement
;--------------

;Finish setting up the Machine and its object, then start moving the Machine.
;This function returns as soon as the animation call has been made; it does not wait for the animation to finish.
Function StartMachine(float speed)
	;Debug.Trace("StartMachine called on " + Self + " with object " + objectToCarry)

	;Error handling.
	if (myTrack == None)
		Debug.Trace("ERROR: " + Self + " received a StartMachine call before being initialized (InitMachine), or has no track.", 2)
		return ;We can't continue.
	ElseIf (isPaused)
		Debug.Trace("ERROR: " + Self + " was paused, and received a Start call instead of a Resume call.", 2)
		return ;Safest thing to do is ignore this call and remain paused.
	ElseIf (isMoving)
		Debug.Trace("ERROR: " + Self + " was already moving, and received a Start call.", 2)
		return ;Safest thing to do is ignore this call and let the current movement finish.
	EndIf

	if (isOnTrack)
		;If isOnTrack=True in this context, InitMachine was called with a startPosition, so the Machine is somewhere out on the track.
		;
		;The 'speed' value of a PlatformHelper is really an animation scalar-- the time needed to translate the full distance.
		;If the Machine starts somewhere on the track, we need to adjust the requested speed to account for that starting position.
		;(Eg. If the Machine is halfway across the track, and the speed provided is '10', it'll only take this Machine '5' to cross the remaining distance.)
		speed = speed * (1 - myStartPosition)
	EndIf

	;Set the Machine's translation speed.
	mySpeed = speed
	myHelper.SetAnimationVariableFloat("fspeed", mySpeed)

	;Set the helper's destination value. This is always '1' (all the way across).
	myHelper.SetAnimationVariableFloat("fvalue", 1)

	;We're now on the track and moving (or will be momentarily).
	isOnTrack = True
	isMoving = True

	;Previously, this script forked off a timer to call PlayAnimationAndWait, but that's inefficient-- since there are often multiple active Machines
	;on any given track, it resulted in a lot of blocked threads. So handle this with event registration instead.
	RegisterForAnimationEvent(myHelper, "Done")
	myHelper.PlayAnimation("Play01")
EndFunction

;Once the animation finishes, clean up the Machine.
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;Debug.Trace("In OnAnimationEvent: " + akSource + ", " + asEventName)
	if ((akSource == myHelper) && (asEventName == "Done"))
		;We're no longer moving.
		isMoving = False

		;The Machine successfully finished moving, so clean it up and delete it.
		CleanupMachine(True)
	EndIf
EndEvent


;-------------------------
;Machine Pause & Resume
;--------------------
;It turns out that there's no way to actually pause an animation (no, really), but we can effectively pause it by
;slowing the machine to the point that it never makes any visible progress. It's good enough for our purposes.

Function PauseMachine()
	if (isMoving && isOnTrack && !isPaused)
		isMoving = False
		isPaused = True
		myHelper.SetAnimationVariableFloat("fspeed", 2000000000.0)
		if (myArmLight != None)
			myArmLight.DisableNoWait()
		EndIf
	EndIf
EndFunction

Function ResumeMachine()
	if (!isMoving && isOnTrack && isPaused)
		isMoving = True
		isPaused = False
		myHelper.SetAnimationVariableFloat("fspeed", mySpeed)
		if (myArmLight != None)
			myArmLight.EnableNoWait()
		EndIf
	EndIf
EndFunction


;-------------------------
;Object Drop Events
;-------------------
;We may want to drop our carried object (myObject) under a couple of conditions.

;If we registered for an OnDistanceLessThan event, and receive it, drop the object.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;Debug.Trace("OnDistanceLessThan; Dropping!")
	DropMyObject()
	;If we didn't drop the object (for any reason), we don't re-register.
EndEvent

;Drop the object when it or its platform are hit by an attack.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if ((ignoreHitsList.Find(akSource) < 0) && (ignoreHitsList.Find(akProjectile) < 0))
		;Debug.Trace("Machine Hit: " + akTarget + " hit by " + akAggressor + ", " + akSource + ", " + akProjectile + "; myObject=" + myObject.GetBaseObject() + "; Dropping!")
		DropMyObject(False, True, False, akAggressor)
	EndIf
	;If we didn't drop the object (for any reason), re-register for another hit event.
	if (!dropoffProhibited && (myObject != None))
		RegisterForHitEvent(myObject)
		RegisterForHitEvent(myPlatform)
	EndIf
EndEvent

;If the object is dying or dead, we always drop it.
Event Actor.OnDying(Actor source, Actor akKiller)
	;Debug.Trace("Machine OnDying: " + source + " killed by " + akKiller)
	DropMyObject(True, True, True, akKiller)
EndEvent

Event Actor.OnDeath(Actor source, Actor akKiller)
	;Debug.Trace("Machine OnDeath: " + source + " killed by " + akKiller)
	DropMyObject(True, True, True, akKiller)
EndEvent


;Attempt to drop the object.
;Returns True if the object was dropped successfully.
bool Function DropMyObject(bool shouldIgnorePlayableSpaceCheck = False, bool shouldDropWithForce = False, bool shouldDropEvenIfProhibited = False, ObjectReference pushSource = None)
	;We don't drop the object if:
	; - The machine has no object, or has already dropped it. (Error case; should never actually occur).
	; - The machine is not in the playable space (unless the drop request overrides that).
	; - Dropoffs are currently prohibited (unless the drop request overrides that).
	;Debug.Trace("Trying to DropMyObject: " + hasDroppedObject + ", " + myTrack.IsObjectInPlayableSpace(myObject) + ", " + shouldDropEvenIfProhibited)
	if ((myObject != None) && !hasDroppedObject && (!dropoffProhibited || shouldDropEvenIfProhibited) && (shouldIgnorePlayableSpaceCheck || myTrack.IsObjectInPlayableSpace(myObject)))
		;We're about to drop this object.
		hasDroppedObject = True

		;Let the track know the player has 'engaged' the object, in case the track has an EngagedObjectsLimit.
		myTrack.MachineObjectEngaged(myObject)

		;The object is no longer being carried, so remove the carried keyword from it.
		myObject.RemoveKeyword(DLC01TrackSystemCarriedObject)

		;If we were supposed to drop this object on a specific dropoff point (whether we made it there or not), we're
		;done using that point. Update its actor value to reflect the fact that it's no longer busy, and other objects can be sent to it.
		if (myDropoffPoint != None)
			myDropoffPoint.SetValue(DLC01TrackSystemDropoffPointBusy, 0)
		EndIf

		;The arm opens. Standard animation.
		myArm.PlayAnimation("Play01")

		;The platform disables, releasing the object.
		myPlatform.DisableNoWait()

		;Update the state of the object.
		Actor tempObjectActor = myObject as Actor
		if (tempObjectActor != None)
			;If the object is an actor, we need to...
			;Clear the Unconscious state if possible.
			if (!tempObjectActor.IsDead())
				tempObjectActor.SetUnconscious(False)
			EndIf
			;If shouldDropWithForce, give it a push.
			if (shouldDropWithForce && (pushSource != None))
				pushSource.PushActorAway(tempObjectActor, 100)
			EndIf
		EndIf

		;Activate the object. This will trigger some traps.
		myObject.Activate(Self)

		;Clear myObject so CleanupTrack won't delete the object when the Machine finishes animating.
		myObject = None

		;We dropped the object successfully.
		return True
	EndIf

	;We did not drop the object successfully.
	return False
EndFunction


;-------------------------
;Utility Functions
;------------------

Function SetSpeed(float newSpeed)
	mySpeed = newSpeed
	if (isMoving)
		myHelper.SetAnimationVariableFloat("fspeed", newSpeed)
	EndIf
EndFunction

ObjectReference Function GetArm()
	return myArm
EndFunction

ObjectReference Function GetPlatform()
	return myPlatform
EndFunction

ObjectReference Function GetObject()
	return myObject
EndFunction

bool Function IsDropoffProhibited()
	return dropoffProhibited
EndFunction

bool Function IsOnTrack()
	return isOnTrack
EndFunction

bool Function IsMoving()
	return isMoving
EndFunction

bool Function IsPaused()
	return isPaused
EndFunction

bool Function IsActive()
	return isOnTrack && isMoving && !isPaused
EndFunction

bool Function IsReadyForDrop()
	if (myObject != None)
		return ((!dropoffProhibited) && (myTrack.IsObjectInPlayableSpace(myObject)))
	EndIf
	return False
EndFunction