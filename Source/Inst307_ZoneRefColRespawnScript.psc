Scriptname Inst307_ZoneRefColRespawnScript extends RefCollectionAlias Hidden
{Inst307 Fight - Phase 1. RefCollectionAlias script for respawning Phase 1 Enemies.}
;
;This is a variant of DefaultCollectionAliasRespawnScript with some extensive modifications.
;Again, there are 15 Phase 1 zones, which means 15 RefCollectionAliases of enemies (one per zone). This script lives on each of them.
;
;Unlike the default collection respawn script, most of the respawn data is being kept on the individual RefCollectionAliases,
;which all share a common quest script they use to respawn. (Inst307_ZoneQuestRespawnScript)

Group Inst307Fight_Specific_Properties
	Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
	{Inst307Fight}

	RefCollectionAlias property myRespawnMarkers Auto Const Mandatory
	{RefCollection of Respawn Markers.}

	bool property isPerimeterZone Auto Const
	{If this is one of the zones around the edge of the base (0,2,7,8), we need to register for and report hit events for BreakoffPerimeterCombat.}

	int property myRespawnPool Auto
	{How many actors should we respawn from this collection?}

	int property myRespawnCount Auto Hidden
	{How many actors have we respawned?}

	int property minRespawnDistance = 512 Auto Const
	{If the player is within this distance of a respawn point, don't use it}
EndGroup

Group Optional_Properties
	bool Property bRespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

;Called when Inst307Fight starts up to perform the initial hit event registration.
Function InitZoneRefCollection()
	if (isPerimeterZone)
		Actor player = Game.GetPlayer()
		int i = 0
		int refcolCount = Self.GetCount()
		While (i < refcolCount)
			RegisterForHitEvent(Self.GetAt(i), player)
			i = i + 1
		EndWhile
	EndIf
EndFunction

;Report hit events to Inst307Fight's ReportPerimeterEnemyHit
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Inst307Fight.ReportPerimeterEnemyHit()
	RegisterForHitEvent(akTarget, Game.GetPlayer())
EndEvent

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	if (myRespawnPool > 0 && (myRespawnCount < myRespawnPool))
		;Debug.Trace("Respawning actor OnDeath " + Self)
		if bRespawningOn
			Inst307_ZoneQuestRespawnScript myQuest = (Inst307Fight as Quest) as Inst307_ZoneQuestRespawnScript
			Actor newActor = myQuest.TryToRespawnCollection(self, akSenderRef as Actor)
			if (isPerimeterZone && (newActor != None))
				RegisterForHitEvent(newActor, Game.GetPlayer())
			EndIf
		endif
	endif
endEvent


ObjectReference function GetRespawnMarker()
	int tryIndex = Utility.RandomInt(0, myRespawnMarkers.GetCount() - 1)

	; find a spot the player can't see
	Actor player = Game.GetPlayer()

	int loopCount = 0	; we'll use this to make sure we only loop through once
	int respawnMarkerCount = myRespawnMarkers.GetCount()
	while loopCount < respawnMarkerCount
		ObjectReference testRef = myRespawnMarkers.GetAt(tryIndex)

		if ((player.HasDetectionLOS(testRef) == False) && (player.GetDistance(testRef) > minRespawnDistance))
			; player doesn't have LOS on this marker, and is outside min distance - pick it
			return testRef
		else
			loopCount = loopCount + 1
			; increment index
			if tryIndex >= respawnMarkerCount - 1
				; we're at the end, start over
				tryIndex = 0
			else
				tryIndex = tryIndex + 1
			endif
		endif
	endWhile

	; we didn't find a marker so use the failsafe
	return myRespawnMarkers.GetAt(tryIndex)
endFunction