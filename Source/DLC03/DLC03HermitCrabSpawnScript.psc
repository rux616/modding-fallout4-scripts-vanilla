Scriptname DLC03:DLC03HermitCrabSpawnScript extends Actor
{This script spawns Hermit Crab Spawn from the Hermit Crab while in combat. Based on MirelurkQueenSpawnScript.}

import utility

Spell Property DLC03HermitCrabSpawnSpell Auto Mandatory Const
Form Property xMarker Auto Mandatory Const
GlobalVariable Property DLC03HermitCrabDropSpawn Auto Mandatory Const
ActorValue Property DLC03HermitCrabActiveSpawn Auto Mandatory Const
int Property MaxActiveSpawn = 6 Auto Const
Actor[] mySpawn
Idle Property RangedAttack Auto Mandatory Const
ActorValue Property AvailableCondition3 Auto Mandatory Const

Group SpawnProperties
	float Property SpawnTimerMin = 15.0 Auto
	float Property SpawnTimerMax = 45.0 Auto
	float Property SpawnLockoutTimer = 15.0 Auto
	int Property SpawnNumberMin = 3 Auto
	int Property SpawnNumberMax = 6 Auto
EndGroup

int SpawnTimerID = 200 Const
int SpawnLockoutTimerID = 111 Const
Bool CleanedUp = false
Bool SpawnLockout = false
Float Offset = 512.0 Const
Float myConditionHealth
int currentActiveSpawn = 0

Event OnTimer(int aiTimerID)
	debug.Trace(self + ": recieved aiTimerID >> " + aiTimerID)
	if aiTimerID == SpawnTimerID
    	debug.Trace(self + "::: Time To Spawn!")
   		TryToFireSpawn()
    	StartTimer(RandomFloat(SpawnTimerMin, SpawnTimerMax), SpawnTimerID)
    elseif aiTimerID == SpawnLockoutTimerID
    	debug.Trace(self + "::: Turn off spawn lockout.")
    	SpawnLockout = false
    endif
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	;0: Not in combat; 1: In combat; 2: Searching
	if aeCombatState == 1
		debug.Trace(self + ": Starting Combat")
		;start the spawn timer
		StartTimer(RandomFloat(SpawnTimerMin, SpawnTimerMax), SpawnTimerID)
		;Catch when the player is shooting the van
		RegisterForHitEvent(Self)
		;Cache the van condition to check for hits
		myConditionHealth = GetValue(AvailableCondition3)
	elseif aeCombatState == 0
		debug.Trace(self + ": Stopping Combat")
		;if we drop out of combat, cancel the timer
		CancelTimer(SpawnTimerID)
		CancelTimer(SpawnLockoutTimerID)
		UnregisterForHitEvent(Self)
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + "OnHit, myConditionHealth=" + myConditionHealth + "+ AvailableCondition3=" + GetValue(AvailableCondition3))
	;check condition to see if van has been shot by the player
	if myConditionHealth > GetValue(AvailableCondition3) && akAggressor == Game.GetPlayer()
		TryToFireSpawn()
	endif
	RegisterForHitEvent(Self)
	;cache new value
	myConditionHealth = GetValue(AvailableCondition3)
EndEvent

Function StartSpawnLockout()
	debug.Trace(self + "::: Turn on spawn lockout.")
	CancelTimer(SpawnLockoutTimerID)
	StartTimer(SpawnLockoutTimer, SpawnLockoutTimerID)
	SpawnLockout = true
EndFunction

Function TryToFireSpawn()
	;Get current number of active spawns
	currentActiveSpawn = (GetValue(DLC03HermitCrabActiveSpawn) as int)
	;Check against combat, lockout timer, spawn count and global
	if GetCombatState() == 1 && !isDead() && !SpawnLockout && currentActiveSpawn < MaxActiveSpawn && DLC03HermitCrabDropSpawn.GetValue() == 1
		FireSpawn()
	EndIf
EndFunction

Function FireSpawn()
	StartSpawnLockout()
	objectReference myTarget = placeAtMe(xMarker)
	objectReference objSelf = self as objectReference
	int i = 0
	;Set the random number to spawn
	int numToSpawn = RandomInt(SpawnNumberMin, SpawnNumberMax)
	debug.Trace(self + "::: Firing Back Babies >> " + numToSpawn)

	debug.Trace(self + "::: Playing RangedAttack anim")		
	self.PlayIdle(RangedAttack)
	Utility.Wait(2)

	;check if it is more than we are allowed to have active, if so, set to the max we can do
	;	This actorvalue should get lowered by the mirelurks when they die
	;	This does NOT actually change the value, the spawn change the value on the closest queen they can find
	currentActiveSpawn = (GetValue(DLC03HermitCrabActiveSpawn) as int)
	if (currentActiveSpawn + numToSpawn) > MaxActiveSpawn
		numToSpawn = MaxActiveSpawn - currentActiveSpawn
	endif

	;Here we actually fire the spell
	while i < numToSpawn
		;Move the xmarker
		myTarget.MoveTo(objSelf, afXOffset = (0 - Math.Sin(GetAngleZ()) * Offset), afYOffset = (0 - Math.Cos(GetAngleZ()) * Offset), afZOffset = 256.0)
		;Fire at the xmarker
		DLC03HermitCrabSpawnSpell.Cast(objSelf, myTarget)
				
		i += 1
		utility.wait(randomFloat(0.2, 0.9))
	endWhile
	CleanedUp = False
	myTarget.Delete()
	Debug.Trace(Self + ": DLC03HermitCrabActiveSpawn == " + GetValue(DLC03HermitCrabActiveSpawn))
EndFunction

Function SpawnBabiesDueToUnreachablePlayer()
	CancelTimer(SpawnTimerID)
	TryToFireSpawn()
EndFunction

bool Function FindParent(Actor CurrentSpawn)
	Debug.Trace(Self + ": FindParent called by >> " + CurrentSpawn)
	currentActiveSpawn = (GetValue(DLC03HermitCrabActiveSpawn) as int)
	if currentActiveSpawn < MaxActiveSpawn
		if mySpawn == none
			mySpawn = New Actor[0]
		Endif
		mySpawn.Add(CurrentSpawn)
		ModValue(DLC03HermitCrabActiveSpawn, 1.0)
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
	int i = mySpawn.Find(spawnToRemove)
	if i >= 0
		mySpawn.Remove(i, 1)

		;UnregisterForEvents
		UnRegisterForRemoteEvent(SpawnToRemove, "OnDeath")
		UnRegisterForRemoteEvent(SpawnToRemove, "OnUnload")

		;Then Mod the queens actor value so she can spawn more
		ModValue(DLC03HermitCrabActiveSpawn, -1.0)
		if GetValue(DLC03HermitCrabActiveSpawn) < 0.0
			SetValue(DLC03HermitCrabActiveSpawn, 0.0)
		Endif
	endif
	Debug.Trace(Self + ": DLC03HermitCrabActiveSpawn == " + GetValue(DLC03HermitCrabActiveSpawn))
EndFunction

;On the parent's death, do the clean up
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
		CancelTimer(SpawnLockoutTimerID)
		mySpawn = none
	EndIf
EndFunction