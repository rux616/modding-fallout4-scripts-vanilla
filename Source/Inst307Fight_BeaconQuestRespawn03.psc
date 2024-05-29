Scriptname Inst307Fight_BeaconQuestRespawn03 extends defaultQuestRespawnScript Hidden
{Inst307 Fight - Phase 3. Quest script for respawning synths from the Institute Teleport Beacons.}
;
;This is mainly a named variant of defaultQuestRespawnScript, except that:
; - It uses the alias' myActorBase property instead of pulling the ActorBase from the dead actor.
; - It respawns actors at a small random offset from the beacon marker.

Group Beacon_Properties
	ReferenceAlias property myBeaconMarker auto
	{Marker representing the teleport beacon's location.}

	ReferenceAlias property myOffsetMarker auto
	{Marker used to test offsets from myBeaconMarker.}
EndGroup
ObjectReference myBeaconMarkerRef	;Local refs
ObjectReference myOffsetMarkerRef


function Respawn(ReferenceAlias aliasToRespawn)
	; respawn me and force me into my alias
	ObjectReference marker = GetRespawnMarker()
	DefaultScriptFunctions.DefaultScriptTrace(self + " respawning at " + marker, ShowTraces)

	; only respawn if current alias is actually dead
	if (aliasToRespawn == None)
		Debug.Trace("Inst307Fight_BeaconQuestRespawn03 received a NONE Alias")
	ElseIf ((aliasToRespawn.GetActorRef() == None) || (aliasToRespawn.GetActorRef().IsDead()))
		aliasToRespawn.ForceRefTo(marker.PlaceAtMe((aliasToRespawn as Inst307Fight_BeaconAliasRespawn03).myActorBase))
		DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn done", ShowTraces)
	else
		DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn - current actor isn't dead!", ShowTraces)
	endif
endFunction

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
 	DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn called by " + aliasToRespawn, ShowTraces)
	if (startStage == 0 || (startStage > 0 && GetStageDone(startStage))) && (doneStage == 0 || (doneStage > 0 && !GetStageDone(doneStage))) && (respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool))
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Waiting to respawn...", ShowTraces)
		Utility.Wait(Utility.RandomInt(respawnTimeMin, respawnTimeMax))
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Finding a respawn spot", ShowTraces)
		if (aliasToRespawn as Inst307Fight_BeaconAliasRespawn03).bRespawningOn
			Respawn(aliasToRespawn)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

ObjectReference function GetRespawnMarker()
	if (myBeaconMarkerRef == None || myOffsetMarkerRef == None)
		myBeaconMarkerRef = myBeaconMarker.GetRef()
		myOffsetMarkerRef = myOffsetMarker.GetRef()
	EndIf
	int tries = 0
	;Offset the spawn point from the beacon.
	While (tries < 5)
		myOffsetMarkerRef.MoveTo(myBeaconMarkerRef, Utility.RandomInt(-32, 32), Utility.RandomInt(-32, 32), 0, True)
		myOffsetMarkerRef.MoveToNearestNavmeshLocation()
		;Check for DirectLoS between the two markers to make sure we haven't offset through a wall or something.
		if (myOffsetMarkerRef.HasDirectLoS(myBeaconMarkerRef))
			return myOffsetMarkerRef
		endif
		tries = tries + 1
	EndWhile
	return myBeaconMarkerRef	
EndFunction