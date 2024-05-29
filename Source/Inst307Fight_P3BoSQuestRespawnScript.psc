Scriptname Inst307Fight_P3BoSQuestRespawnScript extends defaultQuestRespawnScript Hidden
{Inst307 Fight - Phase 3. Quest script for respawning Phase 3 BoS enemies.}
;
;This is mainly a named variant of defaultQuestRespawnScript, except that:
; - It uses the alias' myActorBase property instead of pulling the ActorBase from the dead actor.
; - It takes a RefCollectionAlias of potential spawn points (then stores them in an array for faster reference).

RefCollectionAlias property Phase23_BoSSpawnMarkers auto
{RefCollectionAlias of potential respawn points.}

ObjectReference[] property MyRespawnMarkers auto		;Array of potential respawn points (derived from the RefCollectionAlias).


; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
 	DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn called by " + aliasToRespawn, ShowTraces)
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Waiting to respawn...", ShowTraces)
		Utility.Wait(Utility.RandomInt(respawnTimeMin, respawnTimeMax) )
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Finding a respawn spot", ShowTraces)
		if (aliasToRespawn as Inst307Fight_P3BoSAliasRespawnScript).bRespawningOn
			Respawn(aliasToRespawn)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

; this will always respawn (ignores all the checks and waits)
; (this is what TryToRespawn calls when ready to respawn)
function Respawn(ReferenceAlias aliasToRespawn)
	; respawn me and force me into my alias
	ObjectReference marker = GetRespawnMarker()
		DefaultScriptFunctions.DefaultScriptTrace(self + " respawning at " + marker, ShowTraces)

	; only respawn if current alias is actually dead
	if aliasToRespawn.GetActorRef().IsDead()
		aliasToRespawn.ForceRefTo(marker.PlaceAtMe( (aliasToRespawn as Inst307Fight_P3BoSAliasRespawnScript).myActorBase ) )
			DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn done", ShowTraces)
	else
			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn - current actor isn't dead!", ShowTraces)
	endif
endFunction

ObjectReference function GetRespawnMarker()
	if (MyRespawnMarkers == None)
		int i = 0
		MyRespawnMarkers = new ObjectReference[Phase23_BoSSpawnMarkers.GetCount()]
		While (i < MyRespawnMarkers.Length)
			MyRespawnMarkers[i] = Phase23_BoSSpawnMarkers.GetAt(i)
			i = i + 1
		EndWhile
	EndIf

	; totally unnecessary but nice randomization of which point to choose
	int tryIndex = Utility.RandomInt(0, MyRespawnMarkers.Length - 1)
	DefaultScriptFunctions.DefaultScriptTrace(self + " rolling for respawn spot... " + tryIndex, ShowTraces)

	; find a spot the player can't see
	actor playerActor = Game.GetPlayer() as actor
	ObjectReference marker	; the marker we'll return to respawn at

	int loopCount = 0	; we'll use this to make sure we only loop through once
	while loopCount < MyRespawnMarkers.Length
		if playerActor.HasDetectionLOS(MyRespawnMarkers[tryIndex]) == False && playerActor.GetDistance(MyRespawnMarkers[tryIndex]) > minRespawnDistance
			; player doesn't have LOS on this marker, and is outside min distance - pick it
			return MyRespawnMarkers[tryIndex]
		else
			loopCount = loopCount + 1
			; increment index
			if tryIndex >= MyRespawnMarkers.Length - 1
				; we're at the end, start over
				tryIndex = 0
			else
				tryIndex = tryIndex + 1
			endif
		endif
	endWhile

	; we didn't find a marker so use the failsafe
	return RespawnMarkerFailsafe
endFunction