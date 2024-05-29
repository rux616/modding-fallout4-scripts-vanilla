Scriptname DLC01:DLC01_EyebotPipeScript extends ObjectReference Hidden
{Script for the Eyebot Pipe, a method of spawning Eyebots that snaps them into a furniture marker hidden in a ceiling pipe, then triggers them to come out.}
;
;Like the Robot Lift, there are two main ways in which this can be used:
; - You can just activate it, causing it to spawn a predetermined actor.
; - You can give it an actor to place or spawn, and it'll place/spawn that actor and send it out.
;
;This system does not validate that the actor being spawned is actually an Eyebot, since there are now two Eyebot races (and might end up being more).
;We'll trust the user not to spawn a Sentry Bot or something.
;
;This system does not have the usual Busy state, since there are no animating objects to wait for (only the actor animates, and even that only takes a moment).

Group Optional_Properties
	ActorBase property ActorToSpawnOnActivation Auto Const
	{OPTIONAL. Default= Actor to spawn when this object is activated. Player activations are ignored.}

	RefCollectionAlias property RefCollectionForActors Auto Const
	{OPTIONAL. RefCollection to add placed or spawned actors to.}

	ObjectReference property myLinkedRefToSet Auto Const
	{OPTIONAL. When an actor emerges from the pipe, link it to myLinkedRefToSet with myLinkedRefKeywordToSet.}

	Keyword property myLinkedRefKeywordToSet Auto Const
	{OPTIONAL. When an actor emerges from the pipe, link it to myLinkedRefToSet with myLinkedRefKeywordToSet.}
EndGroup

Group Autofill_Properties
	ObjectReference property DLC01_EyebotPipeSpawnPoint Auto Const Mandatory 	;XMarker in a holding cell where objects are spawned. Prevents them from starting conscious in the play space.
	Keyword property DLC01EyebotPipeFurnitureLink Auto Const Mandatory		;Keyword used to link this dummy object to its furniture marker.
	Keyword property LinkAmbushFurniture Auto Const Mandatory				;Keyword used to link actors to ambush furniture.
	ActorValue property Aggression Auto Const Mandatory					;Aggression AV.
	ActorValue property Suspicious Auto Const Mandatory					;Suspicious AV.
	Sound property DLC01OBJRobotTubeActivate Auto Const Mandatory			;SFX
EndGroup

;Local properties.
bool initialized				;Has this pipe been initialized?
ObjectReference myFurnitureMarker	;Furniture marker to snap actors into when they load. [Unnamed Linkedref]


Event OnCellLoad()
	if (!initialized)
		initialized = True
		myFurnitureMarker = Self.GetLinkedRef(DLC01EyebotPipeFurnitureLink)
		if (myFurnitureMarker == None)
			Debug.Trace("ERROR: EyebotPipe " + Self + " is missing its furniture marker.", 2)
		EndIf
	EndIf
EndEvent


;Use-Case 1: If activated by anything other than the player, try to spawn ActorToSpawnOnActivation.
Event OnActivate(ObjectReference akActivator)
	if ((akActivator != Game.GetPlayer()) && (ActorToSpawnOnActivation != None))
		PlaceEyebot(ActorToSpawnOnActivation)
	Else
		Debug.Trace("WARN: EyebotPipe " + Self + " was activated, but unable to spawn. " + akActivator + ", " + ActorToSpawnOnActivation + ", " + Self.GetLinkedRef(), 1)
	EndIf
EndEvent

;Use-Case 2: Place or spawn an actor on request.
Function PlaceEyebot(Form objectToPlace, int actorLevelMod = 1)
	;Check the state of the furniture before we try to place/spawn the actor. Fail out if there are problems.
	if (myFurnitureMarker == None)
		Debug.Trace("ERROR: EyebotPipe " + Self + " is missing its furniture marker.", 2)
		return
	EndIf

	;Spawn the Eyebot if necessary.
	Actor myActor
	if (objectToPlace == None)
		Debug.Trace("ERROR: EyebotPipe " + Self + " received a PlaceEyebot call, but objectToPlace was NONE.", 2)
		return
	ElseIf (objectToPlace is ActorBase)
		myActor = DLC01_EyebotPipeSpawnPoint.PlaceActorAtMe((objectToPlace as ActorBase), actorLevelMod, Self.GetEncounterZone())
	Else
		myActor = objectToPlace as Actor
		if (myActor == None)
			Debug.Trace("ERROR: EyebotPipe " + Self + " received a PlaceEyebot call, but its objectToPlace was not an actor. " + objectToPlace, 2)
			return
		EndIf
	EndIf

	;Add the Eyebot to the ref collection, if any.
	if ((RefCollectionForActors != None) && (RefCollectionForActors.Find(myActor) < 0))
		RefCollectionForActors.AddRef(myActor)
	EndIf

	;The easiest way to get the Eyebot into the furniture is to rely on the Ambush behavior in DefaultMasterPackage, which has priority over
	;the other DefaultMasterPackage behaviors (sandboxing, patrols, etc.). This isn't bulletproof-- an Eyebot with a special package
	;setup might not snap into the furniture-- but it should work for all practical purposes for this DLC.
	;
	;The Ambush procedure conditions require Aggression and Suspicious to be 0. We'll restore Aggression later; we don't care if this clears
	;Suspicion since the Eyebot is being moved anyway.
	float oldAggression = myActor.GetValue(Aggression)
	myActor.SetValue(Aggression, 0)
	myActor.SetValue(Suspicious, 0)

	;To snap the Eyebot into the furniture, disable it, give it an ambush link, and enable it at the furniture. DefaultMasterPackage has the
	;LoadIntoFurniture flag set, so it just loads in.
	myActor.Disable()
	myActor.SetLinkedRef(myFurnitureMarker, LinkAmbushFurniture)
	myActor.EvaluatePackage()
	myActor.MoveTo(myFurnitureMarker)
	myActor.Enable()

	;Go ahead and set myLinkedRefToSet now, if we have one.
	if (myLinkedRefToSet != None)
		myActor.SetLinkedRef(myLinkedRefToSet, myLinkedRefKeywordToSet)
	EndIf

	;Play a sound effect as it comes out of the furniture.
	DLC01OBJRobotTubeActivate.Play(myActor)

	;To get the actor out of the furniture, we need to make sure they have a package behavior other than the default fallback sandbox. The
	;easiest way to do that is to just give them an unnamed link if they don't already have one. Linking them to this marker will do the job.
	bool isUsingSelfLinkedRef
	if (myActor.GetLinkedRef() == None)
		myActor.SetLinkedRef(Self)
		Self.RegisterForRemoteEvent(myActor, "OnGetUp")
		isUsingSelfLinkedRef = True
	EndIf

	;Then pull the Ambush link. When the Eyebot EVPs, it'll switch to a different behavior and exit the furniture.
	myActor.SetLinkedRef(None, LinkAmbushFurniture)
	myActor.SetValue(Aggression, oldAggression)
	myActor.EvaluatePackage()
EndFunction

Event Actor.OnGetUp(Actor source, ObjectReference akFurniture)
	if (source.GetLinkedRef() == Self)
		source.SetLinkedRef(None)
	EndIf
EndEvent