ScriptName MirelurkQueenSpawnScript Extends Actor
{This script is to spawn Mirelurk Spawn from the queen while she is in combat}

import utility

Spell Property MirelurkSpawnQueenSpell Auto
Form Property xMarker Auto
GlobalVariable Property MirelurkQueenDropSpawn Auto
;Weapon Property WeapMirelurkQueenEggs Auto
ActorValue Property MirelurkQueenActiveSpawn Auto
int Property MaxActiveSpawn = 6 Auto
Actor[] MyMirelurkSpawn
ImpactDataSet Property PMirelurkQueenSpitImpact Auto Const ;markie added

Group SpawnProperties
	float Property SpawnTimerMin = 15.0 Auto
	float Property SpawnTimerMax = 45.0 Auto
	int Property SpawnNumberMin = 3 Auto
	int Property SpawnNumberMax = 6 Auto
EndGroup

int SpawnTimerID = 200
Bool CleanedUp = false


Event OnTimer(int aiTimerID)
	debug.Trace(self + ": recieved aiTimerID >> " + aiTimerID)
	;if spawn timer & in combat & not dead
    if aiTimerID == SpawnTimerID && GetCombatState() == 1 && !isDead()
    	debug.Trace(self + "::: Time To Spawn Back Babies!")
    	if MirelurkQueenDropSpawn.GetValue() == 1
    		FireMirelurkSpawn()
    	Endif
    	StartTimer(RandomFloat(SpawnTimerMin, SpawnTimerMax), SpawnTimerID)
    else
    	;debug.Trace(self + "::: Time To Spawn Back Babies!")
    endif
EndEvent


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	;0: Not in combat; 1: In combat; 2: Searching
	if aeCombatState == 1
		debug.Trace(self + ": Starting Combat")
		;start the spawn timer
		StartTimer(RandomFloat(SpawnTimerMin, SpawnTimerMax), SpawnTimerID)
	elseif aeCombatState == 0
		debug.Trace(self + ": Stopping Combat")
		;if we drop out of combat, cancel the timer
		CancelTimer(SpawnTimerID)
	endif
EndEvent

Float Offset = 512.0

Function FireMirelurkSpawn()
	objectReference myTarget = placeAtMe(xMarker)
	objectReference objSelf = self as objectReference
	ObjectReference FiringNode
	int i = 0
	;Set the random number to spawn
	int numToSpawn = RandomInt(SpawnNumberMin, SpawnNumberMax)
	debug.Trace(self + "::: Firing Back Babies >> " + numToSpawn)

	;if HasNode("MagicNode")
	;	debug.Trace(self + "::: HAS MAGIC NODE == TRUE")
	;else
	;	debug.Trace(self + "::: HAS MAGIC NODE == FALSE")
	;endif

	;check if it is more than we are allowed to have active, if so, set to the max we can do
	;	This actorvalue should get lowered by the mirelurks when they die
	;	This does NOT actually change the value, the spawn change the value on the closest queen they can find
	int currentActiveSpawn = (GetValue(MirelurkQueenActiveSpawn) as int)
	if (currentActiveSpawn + numToSpawn) > MaxActiveSpawn
		numToSpawn = MaxActiveSpawn - currentActiveSpawn
	endif

	;Here we actually fire the spell
	while i < numToSpawn
		;Move the xmarker
		firingNode = PlaceAtNode("NPC R MagicNode [RMag]Alt", XMarker)
		myTarget.MoveTo(objSelf, afXOffset = (0 - Math.Sin(GetAngleZ()) * Offset), afYOffset = (0 - Math.Cos(GetAngleZ()) * Offset), afZOffset = 256.0)
		;Fire at the xmarker
		MirelurkSpawnQueenSpell.Cast(firingNode, myTarget)
		;MirelurkSpawnQueenSpell.Cast(objSelf, myTarget)
		
		;MirelurkSpawnQueenSpell.Cast(objSelf)
		;WeapMirelurkQueenEggs.fire(objSelf, )
		PlayImpactEffect(PMirelurkQueenSpitImpact, "NPC R MagicNode [RMag]Alt", 0, 0, -1, 512, false, false)
		
		firingNode.delete()
		i += 1
		utility.wait(randomFloat(0.2, 0.9))
	endWhile
	CleanedUp = False
	myTarget.Delete()
	Debug.Trace(Self + ": MirelurkQueenActiveSpawn == " + GetValue(MirelurkQueenActiveSpawn))
EndFunction

Function SpawnBabiesDueToUnreachablePlayer()
	CancelTimer(SpawnTimerID)
	StartTimer(0.1, SpawnTimerID)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Baby Manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;TODO 
;	add stuff to check the length
;	OnUnload crap
;	Spawn Script
;		ObjectReference[] Function FindAllReferencesOfType(Form arObjectOrList, float afRadius)
bool Function AreYouMyMommy(Actor CurrentSpawn)
	Debug.Trace(Self + ": AreYouMyMommy called by >> " + CurrentSpawn)
	int currentActiveSpawn = (GetValue(MirelurkQueenActiveSpawn) as int)
	if currentActiveSpawn < MaxActiveSpawn
		if MyMirelurkSpawn == none
			MyMirelurkSpawn = New Actor[0]
		Endif
		MyMirelurkSpawn.Add(CurrentSpawn)
		ModValue(MirelurkQueenActiveSpawn, 1.0)
		RegisterForRemoteEvent(CurrentSpawn, "OnDeath")
		RegisterForRemoteEvent(CurrentSpawn, "OnUnload")
		return true
	else
		;Too many babies! Go find a different mommy!
		return false
	endif
EndFunction

Event Actor.OnDeath(Actor KilledRef, Actor akKiller)
	ClearSpawnFromMyList(KilledRef)
EndEvent

Event ObjectReference.OnUnload(ObjectReference UnloadedActor)
	ClearSpawnFromMyList(UnloadedActor as Actor)
EndEvent

Function ClearSpawnFromMyList(Actor SpawnToRemove)
	;NEW
	int i = MyMirelurkSpawn.Find(spawnToRemove)
	if i >= 0
		MyMirelurkSpawn.Remove(i, 1)

		;UnregisterForEvents
		UnRegisterForRemoteEvent(SpawnToRemove, "OnDeath")
		UnRegisterForRemoteEvent(SpawnToRemove, "OnUnload")

		;Then Mod the queens actor value so she can spawn more
		ModValue(MirelurkQueenActiveSpawn, -1.0)
		if GetValue(MirelurkQueenActiveSpawn) < 0.0
			SetValue(MirelurkQueenActiveSpawn, 0.0)
		Endif
	endif
	Debug.Trace(Self + ": MirelurkQueenActiveSpawn == " + GetValue(MirelurkQueenActiveSpawn))
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Clean up
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;On The Queens death, do the clean up
Event OnDeath(Actor akKiller)
	CleanUp()
EndEvent

;If the queen is unloaded, do the clean up
Event OnUnload()
	CleanUp()
EndEvent

;If we need to clean up, do so
;	This should clear the array so the mirelurkSpawn can properly delete themselves
Function CleanUp()
	if CleanedUp
		return
	else
		CancelTimer(SpawnTimerID)
		MyMirelurkSpawn = none
	EndIf
EndFunction