Scriptname DN131_CommonsRetreatRefColScript extends RefCollectionAlias Const Hidden
{Script on the DN131_Commons RetreatRefCollection, which contains all of the Actors that hit the Commons entry trigger. This collection repackages them to keep them out of the Commons.}

ActorValue property DN131_CommonsTriggerTimestamp Auto Const Mandatory
{Each actor in the collection has an AV with a timestamp of when they were put into the collection.}

Keyword property WeaponTypeUnarmed Auto Const Mandatory
{Unarmed weapon type keyword.}

Keyword property WeaponTypeMelee1H Auto Const Mandatory
{Melee 1H weapon type keyword.}

Keyword property WeaponTypeMelee2H Auto Const Mandatory
{Melee 2H weapon type keyword.}

Keyword property EMSystemLinkToTurf Auto Const Mandatory
{EMS Turf link.}

Keyword property EMSystemLinkToSleep Auto Const Mandatory
{EMS Sleep link.}

int property maxRetreatTime = 60 Auto Const
{After maxRetreatTime, actors are removed from the collection and allowed to resume their normal behavior.}


;Add actors to the collection on request from DN131_CommonsTriggerScript.
Function AddRetreatActor(Actor akRetreatActor)
	;Timestamp the actor.
	akRetreatActor.SetValue(DN131_CommonsTriggerTimestamp, Utility.GetCurrentRealTime())
	;Add them to the collection.
	Self.AddRef(akRetreatActor)
	;Register for hit events against actors in the collection.
	Self.RegisterForHitEvent(Self, Game.GetPlayer())
	;Start a timer to remove actors from the collection after maxRetreatTime. 
	StartTimer(1)
EndFunction

;Remove actors from the collection when maxRetreatTime expires.
Event OnTimer(int timerID)
	Debug.Trace("COMMON: Timer check.")
	int i = 0
	While (i < Self.GetCount())
		Actor retreatActor = Self.GetAt(i) as Actor
		Debug.Trace("For " + retreatActor + " " + (retreatActor.GetValue(DN131_CommonsTriggerTimestamp) + maxRetreatTime) + ", " +  Utility.GetCurrentRealTime())
		if ((retreatActor == None) || HasTimestampExpired(retreatActor, maxRetreatTime) || ReadyToReturnToEMS(retreatActor))
			Debug.Trace("Releasing for timer.")
			Self.RemoveRef(retreatActor)
		Else
			;Release melee actors if necessary. (This doesn't remove them, just quashes the package override.)
			CheckMeleeActors(retreatActor, False)
			i = i + 1
		EndIf
	EndWhile
	if (Self.GetCount() > 0)
		StartTimer(5)
	EndIf
EndEvent

Function AdjustAllTimers()
	int i = 0
	While (i < Self.GetCount())
		Actor retreatActor = Self.GetAt(i) as Actor
		float retreatActorTimer = retreatActor.GetValue(DN131_CommonsTriggerTimestamp)
		float timeElapsed = Utility.GetCurrentRealTime() - retreatActorTimer
		if (timeElapsed > 20)
			retreatActor.SetValue(DN131_CommonsTriggerTimestamp, 0.0)
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Remove actors from the collection on death.
Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	Self.RemoveRef(akSenderRef)
EndEvent

;Remove actors from the collection when they unload.
Event OnUnload(ObjectReference akSenderRef)
	Self.RemoveRef(akSenderRef)
EndEvent

;Release melee actors from their override packages if (1) At least 10s has passed, (2) They have LoS on the player, and (3) They're relatively close to the player or have been hit in combat.
;This is ugly, but it prevents melee actors from just standing around and ignoring combat until they die.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	CheckMeleeActors(akTarget as Actor, True)
	;Re-register for hit events.
	Self.RegisterForHitEvent(Self)
EndEvent

Function CheckMeleeActors(Actor retreatActor, bool wasHitInCombat)
	Actor player = Game.GetPlayer()
	Debug.Trace("Check Melee: " + (retreatActor.GetValue(DN131_CommonsTriggerTimestamp) + 10) + "," + Utility.GetCurrentRealTime() + "," + player.HasDetectionLoS(retreatActor) + "," + wasHitInCombat + "," + player.GetDistance(retreatActor))
	if (IsMeleeActor(retreatActor))
		Debug.Trace("--Is Melee")
		if (HasTimestampExpired(retreatActor, 5) && player.HasDetectionLoS(retreatActor) && (wasHitInCombat || (player.GetDistance(retreatActor) < 768)))
			Debug.Trace("Releasing melee: " + retreatActor)
			retreatActor.SetValue(DN131_CommonsTriggerTimestamp, -1)
		EndIf
	EndIf
EndFunction

bool Function IsMeleeActor(Actor retreatActor)
	Weapon retreatActorWeapon = retreatActor.GetEquippedWeapon()
	return (retreatActorWeapon == None || retreatActorWeapon.HasKeyword(WeaponTypeUnarmed) || retreatActorWeapon.HasKeyword(WeaponTypeMelee1H) || retreatActorWeapon.HasKeyword(WeaponTypeMelee2H))
EndFunction

;Check whether the timestamp has expired (more time has passed than some specified offset).
bool Function HasTimestampExpired(Actor retreatActor, float timeUntilExpired)
	return ((retreatActor.GetValue(DN131_CommonsTriggerTimestamp) + timeUntilExpired) < Utility.GetCurrentRealTime())
EndFunction

bool Function ReadyToReturnToEMS(Actor retreatActor)
	EMSystemTurfScript retreatActorTurf = retreatActor.GetLinkedRef(EMSystemLinkToTurf) as EMSystemTurfScript
	return (!retreatActor.IsInCombat()) && (retreatActorTurf != None) && (!retreatActorTurf.EncounterActive)
EndFunction