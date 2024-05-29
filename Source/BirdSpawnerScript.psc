Scriptname BirdSpawnerScript extends ObjectReference 
{Spawns and manages groups of birds.}

Activator Property BirdBase Auto Const
{type of bird}
Bool Property InteriorFlee = false Auto
{Use interior fleeing}
int Property InteriorFleeRadius = 0 Auto
{Don't care about weapon fire until within this radius.}


;Custom events to send to the inividual crow scripts
;Flee for when weapons are fired
customEvent flee
;Fly for when the birds get scared (player or npc enters trigger)
customEvent hide
;Safe for when the birds get un scared (player or npc exits trigger)
customEvent safe


Event OnUnload()
	;Break any registration to events
	if InteriorFlee == false && InteriorFleeRadius == 0
		UnRegisterForAnimationEvent(game.getPlayer(), "WeaponFire")
	else
		UnRegisterForDistanceEvents(self, Game.GetPlayer())

	endif

EndEvent

Event OnCellLoad()

	if InteriorFlee == false && InteriorFleeRadius == 0
		GotoState("")
		RegisterForAnimationEvent(game.getPlayer(), "WeaponFire")
		
	else
		RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), InteriorFleeRadius)

	endif
	;place to spawn crows. Set up needs at least 1 linked ref with critter markers or it wont place them.
    ObjectReference startingPerch = GetLinkedRef()
    ;Make sure we have a bird type and a starting perch or we dont spawn anthing.
	if startingPerch && BirdBase
		;Spawn 5 birds
		spawnBird("CritterPerch01", startingPerch)
		spawnBird("CritterPerch02", startingPerch)
		spawnBird("CritterPerch03", startingPerch)
		spawnBird("CritterPerch04", startingPerch)
		spawnBird("CritterPerch05", startingPerch)
	endIf
EndEvent


Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace("triggered")
    ;If it is the player make crows hide in a tree in the critter script
	if akActionRef == game.getPlayer()
		SendCustomEvent("hide")
	else ; any other actors make them fly away
		debug.trace("NPC in trigger")
		SendCustomEvent("flee")
		GotoState("DoNothing")
	endIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;;If it is the player make crows safe  in critter script
	if akActionRef == game.getPlayer()
		SendCustomEvent("safe")	
	endIf	
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace( "I got wep fire from the player!!!!!!!!" )
	;If a weaponFire event comes in we scare the birds away
	SendCustomEvent("flee")
	GotoState("DoNothing")
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), InteriorFleeRadius)
	RegisterForAnimationEvent(game.getPlayer(), "WeaponFire")

endEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), InteriorFleeRadius)
	UnRegisterForAnimationEvent(game.getPlayer(), "WeaponFire")

endEvent


State DoNothing
	;do nothing
	Event OnTriggerEnter(ObjectReference akActionRef)
	    ;empty on purpose
	EndEvent
	Event OnTriggerLeave(ObjectReference akActionRef)
	    ;empty on purpose
	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	    ;empty on purpose
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	    ;empty on purpose
	endEvent

	Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	    ;empty on purpose
	endEvent

EndState


ObjectReference function spawnBird(String akPerchName, ObjectReference akMyStartingPerch)
		 ObjectReference birdSpawn = akMyStartingPerch.PlaceAtNode(akPerchName, BirdBase, 1, false, false, true)
		 birdCritterScript newBirdScript =   (birdSpawn as BirdCritterScript)
		 newBirdScript.spawnBird(akPerchName, self)
		 return birdSpawn
endFunction
