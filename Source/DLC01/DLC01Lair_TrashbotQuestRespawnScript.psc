Scriptname DLC01:DLC01Lair_TrashbotQuestRespawnScript extends DefaultQuestRespawnScript
{Variant of DefaultQuestRespawnScript, used for the Trashbots in the Mechanist Battle. Unique functionality is called out below.}

Group DLC01Lair_TrashbotProperties
	ObjectReference property DLC01_TrackSystemSpawnPoint Auto Const Mandatory
	{Trashbots initially spawn at the TrackSystemSpawnPoint marker in a holding cell.}

	EncounterZone property DLC01LairZone Auto Const Mandatory
	{Encounter Zone to pull the Trashbots' level from.}

	DLC01:DLC01Lair_Dispatcher property DLC01FC_Dispatcher Auto Const Mandatory
	{The Dispatcher helper object the Mechanist Battle uses to assign robots to spawning methods.}

	int property respawnCountToSetStage = 10 Auto Const
	int property respawnCountStageToSet = 1295 Auto Const
EndGroup


Function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	;Debug.Trace(self + " respawning at " + marker)
	;only respawn if specified actor is actually dead
	if actorToRespawn.IsDead()
		;remove dead actor from collection
		collectionToRespawn.RemoveRef(actorToRespawn)
		;create new one and add to collection
		Actor newActor = DLC01_TrackSystemSpawnPoint.PlaceActorAtMe(actorToRespawn.GetActorBase(), 0, DLC01LairZone)
		collectionToRespawn.AddRef(newActor)
		;-- UNIQUE: All of the robot spawn methods require the robot to start unconscious.
		newActor.SetUnconscious(True)
		;-- UNIQUE: Pass the robot to the Dispatcher, which assigns it to a Track, Lift, or Pipe and sends it into the room.
		DLC01FC_Dispatcher.DispatchActorToNearestSpawner(newActor)
		;Debug.Trace(self + " Respawn done. " + newActor + " dispatched.")
	Else
		;Debug.Trace(self + " Didn't respawn - current actor isn't dead!")
	EndIf

	;Debug.Trace("TrashbotQuestRespawnScript respawnCount="+respawnCount)
	if (respawnCount >= respawnCountToSetStage)
		;Debug.Trace("TrashbotQuestRespawnScript sets stage " + respawnCountStageToSet)
		Self.SetStage(respawnCountStageToSet)
	EndIf
endFunction

function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	defaultCollectionAliasRespawnScript respawnCollection = collectionToRespawn as defaultCollectionAliasRespawnScript
	if respawnCollection == NONE
		Game.Warning(self + " ERROR: collectionToRespawn " + collectionToRespawn + " is not a defaultCollectionAliasRespawnScript")
		return
	elseif actorToRespawn == NONE
	 	;Debug.Trace(self + " TryToRespawnCollection called with no actorToRespawn - doing nothing")
	 	return
	endif
 	;Debug.Trace(self + " TryToRespawnCollection called by collection=" + respawnCollection + ", actorToRespawn=" + actorToRespawn)
 	if ReadyToRespawn()
		if respawnCollection.bRespawningOn
			RespawnCollection(respawnCollection, actorToRespawn)
		else
 			;Debug.Trace(self + " Didn't respawn " + respawnCollection + " - collection no longer set to respawn")
		endif
	endif
endFunction

;-- UNIQUE: Skip all of the Respawn marker tests in the Parent and just return the spawn point marker.
ObjectReference function GetRespawnMarker()
	return DLC01_TrackSystemSpawnPoint
EndFunction