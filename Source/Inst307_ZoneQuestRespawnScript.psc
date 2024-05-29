Scriptname Inst307_ZoneQuestRespawnScript extends Quest Hidden
{Inst307 Fight - Phase 1. Quest script for respawning Phase 1 Enemies.}
;
;This is a variant of DefaultQuestRespawnScript with some extensive modifications. Most of the data about what and where to
;respawn is maintained on the individual RefCollectionAliases (15 instances of Inst307_ZoneRefColRespawnScript, one per zone),
;so this one script can respawn an actor from any of the 15 collections.

Group Inst307Fight_Specific_Properties
	Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
	{The Inst307Fight Quest.}

	RefCollectionAlias property Phase1_ActiveActors Auto Const Mandatory
	{Inst307Fight's collection of Active Actors (the ones currently enabled)}

	Keyword property DMP_Patrol_WeaponOut Auto Const Mandatory
	{The Patrol_WeaponOut Keyword, which links some actors to their patrol routes.}

	Keyword property DMP_Combat_HoldPosition_128 Auto Const Mandatory
	{The HoldPosition_128 Keyword, which links most actors to their Hold Position Triggers.}

	Race property TurretTripodRace Auto Const Mandatory
	{Turret Race. We don't want to respawn turrets.}
EndGroup

Group Quest_Stages
	int Property startStage = 10 Auto Const
	{Quest stage that needs to be set for respawning to start}

	int Property doneStage = 200 Auto Const
	{Respawning will stop if this stage is set}
endGroup

Group Respawning_Values
	float Property respawnTimeMin = 0.0 Auto
	{Min time between death and respawn in seconds}

	float Property respawnTimeMax = 1.0 Auto
	{Max time between death and respawn in seconds}

	int Property minRespawnDistance = 512 Auto Const
	{If the player is within this distance of a respawn point, don't use it}
endGroup


;Called by the collection when an actor dies. Tries to respawn them, if appropriate.
Actor function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	Inst307_ZoneRefColRespawnScript respawnCollection = collectionToRespawn as Inst307_ZoneRefColRespawnScript

	;Perform error checking.
	if (respawnCollection == NONE)
		Debug.Trace(self + " TryToRespawnCollection called with invalid collection " + collectionToRespawn + " - doing nothing.", 2)
		return None
	elseif (actorToRespawn == NONE)
	 	Debug.Trace(self + " TryToRespawnCollection called with no actorToRespawn - doing nothing,", 2)
	 	return None
	elseif (actorToRespawn.GetActorBase().IsUnique())
		;Don't respawn unique actors.
		collectionToRespawn.RemoveRef(actorToRespawn)
	 	;Debug.Trace(self + " TryToRespawnCollection called with unique actor - removing " + actorToRespawn)
	 	return None
	 elseif actorToRespawn.GetRace() == TurretTripodRace
	 	;Don't respawn turrets. 
		collectionToRespawn.RemoveRef(actorToRespawn)
	 	;Debug.Trace(self + " TryToRespawnCollection called with turret - removing " + actorToRespawn)
	 	return None
	endif

 	;Debug.Trace(self + " TryToRespawnCollection called by collection=" + respawnCollection + ", actorToRespawn=" + actorToRespawn)
 	if ReadyToRespawn(collectionToRespawn)
		if respawnCollection.bRespawningOn
			return RespawnCollection(respawnCollection, actorToRespawn)
		else
			collectionToRespawn.RemoveRef(actorToRespawn)
 			;Debug.Trace(self + " Didn't respawn " + respawnCollection + " - collection no longer set to respawn")
		endif
	endif
	return None
endFunction

Actor function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	;Debug.Trace(self + " respawning at " + marker)

	;Only respawn if specified actor is actually dead.
	if actorToRespawn.IsDead()
		;Request a respawn marker from the Collection.
		ObjectReference marker = (collectionToRespawn as Inst307_ZoneRefColRespawnScript).GetRespawnMarker()

		Actor oldActor = actorToRespawn
		Actor newActor = marker.PlaceActorAtMe(actorToRespawn.GetActorBase()) 

		;Transfer linkedrefs from oldActor to newActor so they have the same patrols, hold positions, etc.
		newActor.SetLinkedRef(oldActor.GetLinkedRef())
		newActor.SetLinkedRef(oldActor.GetLinkedRef(DMP_Patrol_WeaponOut), DMP_Patrol_WeaponOut)
		newActor.SetLinkedRef(oldActor.GetLinkedRef(DMP_Combat_HoldPosition_128), DMP_Combat_HoldPosition_128)

		;Swap them in the collection.
		collectionToRespawn.RemoveRef(oldActor)
		collectionToRespawn.AddRef(newActor)

		;Push the new actor into the Active Actor collection, since the old one presumably was there.
		Phase1_ActiveActors.RemoveRef(oldActor)
		Phase1_ActiveActors.AddRef(newActor)

		;Debug.Trace(self + " Respawn done")
		return newActor
	else
		;Debug.Trace(self + " Didn't respawn - current actor isn't dead!")
		return None
	endif
endFunction


; internal utility function
; checks if respawn is valid
; if not, returns false
; if valid, increments respawn counter and waits random time before returning
bool function ReadyToRespawn(RefCollectionAlias collectionToRespawn)
	Inst307_ZoneRefColRespawnScript collection = collectionToRespawn as Inst307_ZoneRefColRespawnScript
	if (startStage == 0 || (startStage > 0 && GetStageDone(startStage))) && \
		(doneStage == 0 || (doneStage > 0 && !GetStageDone(doneStage))) && \
		(collection.myRespawnPool == 0 || (collection.myRespawnPool > 0 && collection.myRespawnCount < collection.myRespawnPool))
		collection.myRespawnCount = collection.myRespawnCount + 1
		;wait for respawn time
 		;Debug.Trace(self + " Waiting to respawn...", ShowTraces)
		Utility.Wait(Utility.RandomFloat(respawnTimeMin, respawnTimeMax))
 		return true
 	else
 		return false
 	endif
endFunction
