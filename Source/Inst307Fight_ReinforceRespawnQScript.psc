Scriptname Inst307Fight_ReinforceRespawnQScript extends defaultQuestRespawnScript Hidden
{Inst307 Fight - Phase 1. Quest script for respawning Phase 1 synth reinforcements.}
;
;This is a variant of defaultQuestRespawnScript, with some extensive modifications.
; - It can spawn a new actor on demand with the SpawnReinforcement function.
; - All of the actors it spawns (or respawns) are teleporting synths. They are spawned offscreen (at a marker in an inaccessible cell),
;   their properties set, and then they're moved to the Airport. Enabling them there triggers their teleport script's OnLoad event.
; - Instead of an array of spawn points, it just picks the next marker in a chain of potential spawn poitns.
; - It always respawns the LvlSynth_Institute ActorBase, irrespective of what the original actor was. (The original is often better.)

ActorBase property LvlSynth_Institute Auto Const
{ActorBase to respawn.}

ObjectReference property InterimSpawnPoint Auto Const
{Marker in an inaccessible cell to initially spawn the actors at.}

ObjectReference property RespawnSourceChain Auto
{First marker in a chain of potential spawn points.}

Keyword property LinkCustom01 Auto Const
{LinkCustom01 - Link between the RespawnSourceChain markers.}

ActorValue property TeleportRefCollOnLoad Auto Const
{Actor Value that, when set, causes synths to play their teleport effects when they teleport in.}

; call this when you want to try to respawn
function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	;Debug.Trace("TryToRespawnCollection respawning " + collectionToRespawn + ", pool is =" + respawnPool)
	Inst307Fight_ReinforceColRespawnScript respawnCollection = collectionToRespawn as Inst307Fight_ReinforceColRespawnScript
	if respawnCollection == NONE
		Game.Warning(self + " ERROR: collectionToRespawn " + collectionToRespawn + " is not a Inst307Fight_ReinforceColRespawnScript")
		return
	elseif actorToRespawn == NONE
	 	DefaultScriptFunctions.DefaultScriptTrace(self + " TryToRespawnCollection called with no actorToRespawn - doing nothing", ShowTraces)
	 	return
	endif
 	DefaultScriptFunctions.DefaultScriptTrace(self + " TryToRespawnCollection called by collection=" + respawnCollection + ", actorToRespawn=" + actorToRespawn, ShowTraces)
 	if ReadyToRespawn()
		if respawnCollection.bRespawningOn
			RespawnCollection(respawnCollection, actorToRespawn)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn " + respawnCollection + " - collection no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	; respawn new refToRespawn and force me into my alias collection
	ObjectReference marker = GetRespawnMarker()
		DefaultScriptFunctions.DefaultScriptTrace(self + " respawning at " + marker, ShowTraces)

	; only respawn if specified actor is actually dead
	if actorToRespawn.IsDead()
		; remove dead actor from collection
		collectionToRespawn.RemoveRef(actorToRespawn)
		; create new one and add to collection
		collectionToRespawn.AddRef(marker.PlaceAtMe( LvlSynth_Institute ) )
			DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn done", ShowTraces)
	else
			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn - current actor isn't dead!", ShowTraces)
	endif
endFunction

function TryToRespawnDead(RefCollectionAlias collectionToRespawn)
	int i = 0
	While (i < collectionToRespawn.GetCount())
		Actor current = collectionToRespawn.GetAt(i) as Actor
		if ((current != None) && (current.IsDead()))
			TryToRespawnCollection(collectionToRespawn, current)
			i = 0
		else
			i = i + 1
		endif
	EndWhile
endFunction


ObjectReference function GetRespawnMarker()
	return RespawnSourceChain.GetNthLinkedRef(Utility.RandomInt(0, 4), LinkCustom01)
endFunction

Actor function SpawnReinforcement(RefCollectionAlias reinforcementCollection, ActorBase aBase, int level, int spawnID)
	Actor a = InterimSpawnPoint.PlaceActorAtMe(aBase, level, None)
	reinforcementCollection.AddRef(a)
	a.Disable()
	a.SetValue(TeleportRefCollOnLoad, 1)
	ObjectReference destination = RespawnSourceChain.GetNthLinkedRef(spawnID, LinkCustom01)
	a.MoveTo(destination)
	a.Enable()
	return a
endFunction