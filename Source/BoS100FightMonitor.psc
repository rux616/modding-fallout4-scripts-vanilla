Scriptname BoS100FightMonitor extends Quest
{A modified version of DefaultQuestRespawnScript that handles the BoS100 ghoul fight outside the police station.}

;BoS100 Quest Aliases of BoS Recon Team.
ReferenceAlias property Danse Auto Const
ReferenceAlias property Haylen Auto Const
ReferenceAlias property Rhys Auto Const

;BoS100 Quest Aliases of Ghouls.
ReferenceAlias property Ghoul01 Auto Const
ReferenceAlias property Ghoul02 Auto Const
ReferenceAlias property Ghoul03 Auto Const
ReferenceAlias property Ghoul04 Auto Const
ReferenceAlias property GhoulBoss Auto Const

;BoS100 Quest Aliases of the ghouls in College Square
RefCollectionAlias property CollegeSquareExteriorGhouls Auto

int property BossSpawnDeathCount = 12 Auto Const
{Number of ghouls that must be killed before the Boss will trigger.}

int property BossSpawnStageToSet = 50 Auto Const
{Stage to set when triggering the Boss.}


int property EndSecondWaveDeathCount = 17 Auto Const
{Number of ghouls that must be killed to end the fight.}

int property EndSecondWaveStageToSet = 90 Auto Const
{Stage to set when no further respawning should be allowed.}

int property EndFightStageToSet = 100 Auto Const
{Stage to set when all ghouls have been killed and the fight is over.}


ObjectReference[] Property RespawnMarkersNear Auto Const
{Array of primary respawn markers. Actors will prefer to respawn at these points if any are valid.}

ObjectReference[] Property RespawnMarkersFar Auto Const
{Array of secondary respawn markers. Actors will respawn at these points if none of the Primary markers are valid.}

ObjectReference Property RespawnMarkerFailsafe Auto Const
{Failsafe respawn point in case the player somehow has LOS on all of the other respawn points.}


float Property respawnTimeMin = 0.0 Auto
{Min time between death and respawn in seconds}

float Property respawnTimeMax = 0.1 Auto
{Max time between death and respawn in seconds}

int Property minRespawnDistance = 2048 Auto Hidden
{If the player is within this distance of a respawn point, don't use it.}

ActorValue property Aggression Auto Const
{Aggression AV.}

ActorValue property Health Auto Const
{Health AV.}

Keyword property BoS100FightGhoulKeyword Auto Const
{Keyword on all ghouls in the fight.}

;Local copies of player and BoS Soldier refs.
Actor playerRef
Actor DanseRef
Actor RhysRef
Actor HaylenRef

int deathCount = 0		;How many ghouls have been killed?
int respawnCount = 0 	;How many ghouls have respawned?

;To improve pacing and minimize frustrating behaviors (ghouls fleeing, becoming stuck, etc.), we force-kill the last ghoul or two in each wave if the player doesn't have LoS to them.
int firstWaveForceKillLeft = 2
int secondWaveForceKillLeft = 2
float forceKillDelayCount = 0.0
float forceKillDelay = 2.0

;Maintain an array of all ghouls that have spawned for this fight so we can clean them up later
;and keep track of which any that may be raised by a Glowing One. Restricted to [50].
Actor[] property AllGhouls Auto
int indexAllGhouls = 0

;Status bools
bool hasStartedFightMonitor = False
bool timerRunning = False

;Counters for how many times Danse and Haylen can be hit before dropping to bleedout.
;int DanseHitCounter
;int DanseHitMax = 8
;int HaylenHitCounter
;int HaylenHitMax = 6

;Initialization.
Event OnInit()
	AllGhouls = new Actor[50]
	playerRef = Game.GetPlayer()
EndEvent


;Initially, the quest will spawn an infinite number of ghouls, manually cleaning up the oldest ones (disabling and deleting their corpses) when the count exceeds 10 to prevent the Boss from
;raising an overwhelming number of enemies. The BoS Recon Team is Protected, so they'll be fine.
;
;When the player approaches the fight and attacks one of the Ghouls or enters the trigger zone, this function is called, causing us to start tracking deaths 'for real'.
Function StartFightMonitor()
	;Debug.Trace("Fight Monitor Started")
	hasStartedFightMonitor = True

	;Store off local refs to the BoS Actors.
	DanseRef = Danse.GetActorRef()
	HaylenRef = Haylen.GetActorRef()
	RhysRef = Rhys.GetActorRef()

	;Register for events on the ghouls.
	;Debug.Trace("StartFightMonitor initial registration.")
	RegisterGhoul(Ghoul01.GetActorRef())
	RegisterGhoul(Ghoul02.GetActorRef())
	RegisterGhoul(Ghoul03.GetActorRef())
	RegisterGhoul(Ghoul04.GetActorRef())
	RegisterGhoul(GhoulBoss.GetActorRef())
	;Debug.Trace("StartFightMonitor initial registration done.")

	;Register for events on Danse and Haylen.
	RegisterForRemoteEvent(DanseRef, "OnLoad")
	RegisterForRemoteEvent(DanseRef, "OnUnload")

	;Set NoBleedoutRecovery for this fight.
	;DanseRef.SetNoBleedoutRecovery(True)
	HaylenRef.SetNoBleedoutRecovery(True)
	RhysRef.SetNoBleedoutRecovery(True)

	int danseHealth = DanseRef.GetValue(Health) as int
	int danseTargetHealth = (DanseRef.GetBaseValue(Health) * 0.75)  as int
	if (danseHealth <= 0)
		DanseRef.RestoreValue(Health, danseTargetHealth)
	Else
		int danseMod = (-1 * (danseHealth - danseTargetHealth)) as int
		if (danseMod < 0)
			DanseRef.DamageValue(Health, -1 * danseMod)
		Else
			DanseRef.RestoreValue(Health, -1 * danseMod)
		EndIf
	EndIf

	int haylenHealth = HaylenRef.GetValue(Health) as int
	int haylenTargetHealth = (HaylenRef.GetBaseValue(Health) * 0.75)  as int
	if (haylenHealth <= 0)
		HaylenRef.RestoreValue(Health, haylenTargetHealth)
	Else
		int haylenMod = (-1 * (haylenHealth - haylenTargetHealth)) as int
		if (haylenMod < 0)
			HaylenRef.DamageValue(Health, -1 * haylenMod)
		Else
			HaylenRef.RestoreValue(Health, -1 * haylenMod)
		EndIf
	EndIf

	RhysRef.DamageValue(Health, RhysRef.GetValue(Health) - 10)

	;Debug.Trace("Danse: " + DanseRef.GetValue(Health) + "/" + DanseRef.GetBaseValue(Health))
	;Debug.Trace("Haylen: " + HaylenRef.GetValue(Health) + "/" + HaylenRef.GetBaseValue(Health))
	;Debug.Trace("Rhys: " + RhysRef.GetValue(Health) + "/" + RhysRef.GetBaseValue(Health))
	;RegisterForHitEvent(DanseRef, BoS100FightGhoulKeyword)
	;RegisterForHitEvent(HaylenRef, BoS100FightGhoulKeyword)
	;Wound Danse, Rhys, and Haylen.
	;DanseRef.DamageValue(Health, DanseRef.GetValue(Health) / 3)
	;HaylenRef.DamageValue(Health, HaylenRef.GetValue(Health) / 3)
	;RhysRef.DamageValue(Health, RhysRef.GetValue(Health) - 10)

	;Start a timer to poll for the ForceKill condition.
	timerRunning = True
	StartTimer(0.5, 0)
EndFunction


;Register for death events on the ghouls so we can track the death count.
Function RegisterGhoul(Actor ghoul)
	;Register for death event.
	RegisterForRemoteEvent(ghoul, "OnDeath")

	;Set the ghouls to Very Aggressive.
	ghoul.SetValue(Aggression, 2)

	;Record the ghoul in the AllGhouls index for later reference and cleanup.
	if (ghoul != None)
		AddToAllGhouls(ghoul)
	EndIf

	;If this ghoul happens to be dead at the moment of registration, respawn it.
	if (ghoul.IsDead())
		ReferenceAlias myAlias
		if (ghoul == Ghoul01.GetActorRef())
			myAlias = Ghoul01
		ElseIf (ghoul == Ghoul02.GetActorRef())
			myAlias = Ghoul02
		ElseIf (ghoul == Ghoul03.GetActorRef())
			myAlias = Ghoul03
		ElseIf (ghoul == Ghoul04.GetActorRef())
			myAlias = Ghoul04
		EndIf	
		;Debug.Trace("Registration respawn for " + myAlias)
		if (myAlias != None)
			GhoulOnDeath(ghoul, ghoul)
			TryToRespawn(myAlias)
		EndIf
	EndIf
EndFunction

;Add the ghoul to the All Ghouls list.
Function AddToAllGhouls(Actor ghoul)
	if (AllGhouls.Length == indexAllGhouls)
		AllGhouls.Add(ghoul)
	Else
		AllGhouls[indexAllGhouls] = ghoul
	EndIf
	indexAllGhouls = indexAllGhouls + 1
EndFunction


;Danse: Stop the timer if the player leaves the area.
Event ObjectReference.OnUnload(ObjectReference akSender)
	if (akSender == DanseRef && timerRunning)
		timerRunning = False
		CancelTimer()
	EndIf
EndEvent

;Danse: Restart the timer when the player returns.
Event ObjectReference.OnLoad(ObjectReference akSender)
	if (akSender == DanseRef && !timerRunning)
		timerRunning = True
		StartTimer(0.5)
	EndIf
EndEvent

;Danse & Haylen: Forward OnHit events to HandleBoSOnHitEvent.
;Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
;  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
;	HandleBoSOnHitEvent(akTarget as Actor, akAggressor as Actor)
;	RegisterForHitEvent(akTarget, BoS100FightGhoulKeyword)
;EndEvent

;Function HandleBoSOnHitEvent(Actor target, Actor aggressor)
	;Debug.Trace("ONHIT RECEIVED: " + target + ", " + aggressor)
	;Debug.Trace("SUPPORTING: " + (target != None) + (aggressor != None) + (Self.GetStage() < 100) + (aggressor.HasKeyword(BoS100FightGhoulKeyword)))
	;if ((target != None) && (aggressor != None) && (Self.GetStage() < 100) && (aggressor.HasKeyword(BoS100FightGhoulKeyword)))
		;if (target == DanseRef)
			;Debug.Trace("DANSE HIT! " + DanseHitCounter)
			;DanseHitCounter = DanseHitCounter + 1
			;int currentHealth = DanseRef.GetValue(Health) as Int
			;if ((DanseHitCounter == DanseHitMax) || (currentHealth <= 0))
				;if (currentHealth > 0)
					;DanseRef.DamageValue(Health, currentHealth - 1)
				;EndIf
				;DanseRef.SetNoBleedoutRecovery(True)
				;Debug.Trace("DANSE GOES DOWN")
			;EndIf
		;ElseIf (target == HaylenRef)
			;Debug.Trace("HAYLEN HIT!")
			;HaylenHitCounter = HaylenHitCounter + 1
			;int currentHealth = HaylenRef.GetValue(Health) as Int
			;if ((HaylenHitCounter == HaylenHitMax)  || (currentHealth <= 0))
				;if (currentHealth > 0)
					;HaylenRef.DamageValue(Health, currentHealth - 1)
				;EndIf
				;HaylenRef.SetNoBleedoutRecovery(True)
				;Debug.Trace("HAYLEN GOES DOWN")
			;EndIf
		;Else
			;Debug.Trace("Unrecognized OnHit event.", 2)
		;EndIf
	;EndIf
;EndFunction


;When Registered ghouls die, increment the death counter.
Event Actor.OnDeath(Actor akSender, Actor akKiller)
	GhoulOnDeath(akSender, akKiller)
EndEvent

Function GhoulOnDeath(Actor akSender, Actor akKiller)
	ReferenceAlias myAlias
	if (akSender == Ghoul01.GetActorRef())
		myAlias = Ghoul01
	ElseIf (akSender == Ghoul02.GetActorRef())
		myAlias = Ghoul02
	ElseIf (akSender == Ghoul03.GetActorRef())
		myAlias = Ghoul03
	ElseIf (akSender == Ghoul04.GetActorRef())
		myAlias = Ghoul04
	EndIf		
	;Debug.Trace("Recieved OnDeath for " + akSender + " by " + akKiller + " from Alias " + myAlias)
	deathCount = deathCount + 1
	forceKillDelayCount = 0
	;Debug.Trace("Ghoul " + deathCount + " died.")
EndFunction


;Handle timer events.
;ID 0 = Main Timer, which is looking for state changes, stages that need to bs set, forceKill situations.
;ID 1-4 = The corresponding ghoul is ready to respawn.
Event OnTimer (int timer)
	if (timer == 0)
		;Debug.Trace("Timer Loop: deathCount=" + deathCount)
		;Debug.Trace("College Square Ghouls are: " + CollegeSquareExteriorGhouls)
		if ((!GetStageDone(BossSpawnStageToSet)) && !GetStageDone(100) && (deathCount < BossSpawnDeathCount))
			;Phase 1: Check whether we should force kill the last couple of ghouls.
			if (deathCount >= (BossSpawnDeathCount - firstWaveForceKillLeft))
				;Debug.Trace("Waiting for final enemies to die...")
				if (forceKillDelayCount < forceKillDelay)
					;Debug.Trace("Wait...")
					forceKillDelayCount = forceKillDelayCount + 0.5
					StartTimer(0.5)
				Else
					;Debug.Trace("Force Kill.")
					ForceKillGhouls()
					forceKillDelayCount = 0
					SetStage(BossSpawnStageToSet)
					;Debug.Trace("Returned from Force Kill")
				EndIf
			Else
				StartTimer(0.5)
			EndIf
		ElseIf (!GetStageDone(BossSpawnStageToSet))
			;Phase 1: First wave of ghouls are dead. Spawn the boss.
			forceKillDelayCount = 0
			SetStage(BossSpawnStageToSet)
			;DON'T restart the timer here. Restart it after the boss spawns.
		Else
			;Phase 2:
			;Make sure ALL of the ghouls are dead before setting the end stage. Since a Glowing One may be involved, we have to look not only at the ghouls in the aliases,
			;but at all of the ones that spawned before and might have been resurrected.
			int livingGhouls = GetCountOfLivingGhouls()
			;Debug.Trace("Living Ghouls=" + livingGhouls)
			if (livingGhouls == 0 && Danse.GetActorRef().GetCombatState() == 0 && Haylen.GetActorRef().GetCombatState() == 0 && Rhys.GetActorRef().GetCombatState() == 0)
				;Phase 2: Done.
				;Kill any ghouls in College Square who have aggro'd on the player to avoid interruptions in Danse's scene.
				;Debug.Trace("Wrapping Up")
				;Debug.Trace("College Square Ghouls are: " + CollegeSquareExteriorGhouls)
				int i = 0
				Actor collegeGhoul
				Actor player = Game.GetPlayer()
				float distanceToDanse = player.GetDistance(DanseRef)
				While (i < CollegeSquareExteriorGhouls.GetCount())
					collegeGhoul = CollegeSquareExteriorGhouls.GetAt(i) as Actor
					;Debug.Trace("CHECK: " + collegeGhoul)
					if (collegeGhoul.IsInCombat() && !player.HasDetectionLOS(collegeGhoul) && (player.GetDistance(collegeGhoul) > distanceToDanse))
						;Debug.Trace("CHECK-KILL: " + collegeGhoul)
						collegeGhoul.Kill()
					EndIf
					i = i + 1
				EndWhile
				;Allow Danse and Haylen to recover.
				DanseRef.SetNoBleedoutRecovery(False)
				HaylenRef.SetNoBleedoutRecovery(False)
				RhysRef.SetNoBleedoutRecovery(False)
				SetStage(EndFightStageToSet)
				;Debug.Trace("Done")
			ElseIf (livingGhouls <= secondWaveForceKillLeft && GhoulBoss.GetActorRef().IsDead())
				;Phase 2: Check whether we should force kill the last couple of ghouls.
				;Debug.Trace("Waiting for final enemies to die...")
				;Debug.Trace("College Square Ghouls are: " + CollegeSquareExteriorGhouls)
				if (forceKillDelayCount < forceKillDelay)
					;Debug.Trace("Wait...")
					forceKillDelayCount = forceKillDelayCount + 0.5
				Else
					;Debug.Trace("Force Kill.")
					ForceKillGhouls()
				EndIf
				StartTimer(0.5)
			Else
				StartTimer(0.5)
			EndIf
		EndIf
	ElseIf (timer == 1)
		FinishRespawning(Ghoul01)
	ElseIf (timer == 2)
		FinishRespawning(Ghoul02)
	ElseIf (timer == 3)
		FinishRespawning(Ghoul03)
	ElseIf (timer == 4)
		FinishRespawning(Ghoul04)
	EndIf	
EndEvent


;When called by quest stage BossSpawnStageToSet, triggers the Boss.
Function SpawnBoss()
	;Allow Danse and Haylen to recover if they're in bleedout.
	DanseRef.SetNoBleedoutRecovery(False)
	DanseRef.RestoreValue(Health, 100)
	HaylenRef.SetNoBleedoutRecovery(False)
	HaylenRef.RestoreValue(Health, 100)
	;HaylenRef.SetNoBleedoutRecovery(False)
	;DanseHitCounter = 0

	;Decide where to spawn him.
	;Debug.Trace("Testing Locations for the Boss")
	ObjectReference marker = GetRespawnMarker(RespawnMarkersNear)
	if (marker == RespawnMarkerFailsafe)
		marker = GetRespawnMarker(RespawnMarkersFar)
	EndIf

	;Spawn the boss.
	;Debug.Trace("Spawning the Boss")
	Actor boss = GhoulBoss.GetActorRef()
	;boss.StartDeferredKill()
	boss.MoveTo(marker)
	boss.Enable()
	boss.EvaluatePackage()

	;Spawn supporting ghouls.
	respawnTimeMax = 0
	TryToRespawn(Ghoul01)
	TryToRespawn(Ghoul02)
	TryToRespawn(Ghoul03)
	TryToRespawn(Ghoul04)

	;From this point forward, ghouls no longer respawn.
	SetStage(EndSecondWaveStageToSet)

	;Reinstate NoBleedoutRecovery on Danse and Haylen again.
	;DanseRef.SetNoBleedoutRecovery(True)
	HaylenRef.SetNoBleedoutRecovery(True)
	;HaylenHitCounter = 0

	;Debug.Trace("SpawnBoss function starting timer")
	StartTimer(0.5)
EndFunction


;When the player enters the courtyard, we reduce the respawn radius to intensify the combat.
Function ReduceRespawnRadius()
	minRespawnDistance = 800
EndFunction


;Utility function: Return a count of all living ghouls in AllGhouls. That will include the ghouls in the aliases,
;plus any ghouls raised by a Glowing One (if applicable)
int Function GetCountOfLivingGhouls()
	int i = 0
	int ghoulCount
	While (i < indexAllGhouls)
		;Debug.Trace("GetCountOfLivingGhouls at " + i + ": " + AllGhouls[i])
		if (AllGhouls[i] != None && !AllGhouls[i].IsDead())
			ghoulCount = ghoulCount + 1
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("GetCountOfLivingGhouls="+ghoulCount)
	return ghoulCount
EndFunction

;Utility function: Cycle through AllGhouls and kill all of the ghouls therein.
;Exceptions: Don't kill the Boss, or a ghoul in the player's LoS.
Function ForceKillGhouls()
	int i = 0
	Actor boss = GhoulBoss.GetActorRef()
	While (i < indexAllGhouls)
		Actor current = AllGhouls[i]
		;Debug.Trace("ForceKill current =" + current)
		if (current != None && !current.IsDead() && current != boss && !playerRef.HasDetectionLOS(current))
			current.Kill()
			;Debug.Trace("Forcekilled " + i)
		EndIf
		i = i + 1
		;Debug.Trace("ForceKill " + i)
	EndWhile
EndFunction

;Utility function: Disable and delete all ghouls in AllGhouls. Used for cleanup once the player has left the area.
Function CleanupGhouls()
	int i = 0
	While (i < indexAllGhouls)
		if (AllGhouls[i] != None)
			AllGhouls[i].DisableNoWait()
			AllGhouls[i].Delete()
			AllGhouls[i] = None
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Called by the BoS100AliasRespawnScript when ghouls die and try to respawn. First half of the process.
;This differs from the default script in that it uses a timer so the ghouls can respawn in parallel instead of having to wait while each dead ghoul blocks the function in turn.
Function TryToRespawn(ReferenceAlias aliasToRespawn)
 	;Debug.Trace(self + " Respawn called by " + aliasToRespawn)
 	;Debug.Trace("TryToRespawn and respawnCount=" + respawnCount + "; " + EndSecondWaveDeathCount)
	if ((!GetStageDone(BossSpawnStageToSet) && (respawnCount + 4 < BossSpawnDeathCount)) || \
		(GetStageDone(BossSpawnStageToSet) && (respawnCount + 4 < EndSecondWaveDeathCount)))
		
		;Track respawn count if the player has enteerd is running (but not before).
		if (hasStartedFightMonitor)
			respawnCount = respawnCount + 1
		EndIf

		;Wait for the respawn time, if relevant.
		if (respawnTimeMax > 0)
 			;Debug.Trace(self + " Waiting to respawn...")
 			int myID = 0
 			if (aliasToRespawn == Ghoul01)
 				myID = 1
 			ElseIf (aliasToRespawn == Ghoul02)
 				myID = 2
 			ElseIf (aliasToRespawn == Ghoul03)
 				myID = 3
  			ElseIf (aliasToRespawn == Ghoul04)
 				myID = 4
 			EndIf
 			StartTimer(Utility.RandomFloat(respawnTimeMin, respawnTimeMax), myID)
 		Else
 			FinishRespawning(aliasToRespawn)
 		EndIf
 	;Else
 		;Debug.Trace("TryToRespawn for " + aliasToRespawn + " failed conditions and will not respawn.")
 	EndIf
 EndFunction

;Called when the ghouls try to respawn. Second half of the process.
function FinishRespawning(ReferenceAlias aliasToRespawn)
	;Debug.Trace(self + " Finding a respawn spot")
	if (aliasToRespawn as BoS100AliasRespawnScript).bRespawningOn
		Respawn(aliasToRespawn)
	;else
 		;Debug.Trace(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn")
	endif
EndFunction


;Handles the actual respawning, at the request of FinishRespawning (above).
function Respawn(ReferenceAlias aliasToRespawn)
	;Only respawn if current alias is actually dead
	Actor oldGhoul = aliasToRespawn.GetActorRef()
	if oldGhoul.IsDead()

		;During the infinite respawning period before the player arrives, be conservative about which corpses we keep around.
		if (!hasStartedFightMonitor)
			;Keep the first 10.
			if (indexAllGhouls < 10)
				;Debug.Trace("Keeping corpse " + indexAllGhouls)
				AllGhouls[indexAllGhouls] = oldGhoul
				indexAllGhouls = indexAllGhouls + 1
			;Keep 10-20 if the player can see the body.
			ElseIf (indexAllGhouls >= 10 && indexAllGhouls < 20 && playerRef.HasDetectionLOS(oldGhoul))
				;Debug.Trace("Keeping corpse " + indexAllGhouls)
				AllGhouls[indexAllGhouls] = oldGhoul
				indexAllGhouls = indexAllGhouls + 1
			;Beyond that, we have to start disabling corpses, or a Glowing One's resurrection ability could get out of hand.
			Else
				;Debug.Trace("Disabling corpse " + indexAllGhouls)
				oldGhoul.Disable(True)
			EndIf
		EndIf

		;Pick a respawn marker.
		ObjectReference marker = GetRespawnMarker(RespawnMarkersNear)
		if (marker == RespawnMarkerFailsafe)
			marker = GetRespawnMarker(RespawnMarkersFar)
		EndIf

		;Respawn the actor.
		Actor newGhoul = marker.PlaceAtMe(aliasToRespawn.GetActorRef().GetActorBase()) as Actor
		aliasToRespawn.ForceRefTo(newGhoul)

		;After the player arrives, register all ghouls and keep their corpses.
		if (hasStartedFightMonitor)
			RegisterGhoul(newGhoul)
			newGhoul.StartCombat(DanseRef)
			newGhoul.EvaluatePackage()
		EndIf
 		;Debug.Trace(self + " Respawn done")
	;else
 		;Debug.Trace(self + " Didn't respawn - current actor isn't dead!")
	endif
endFunction


ObjectReference function GetRespawnMarker(ObjectReference[] markers)
	;Randomly decide where to start looking.
	int tryIndex = Utility.RandomInt(0, markers.Length - 1)
	;Debug.Trace(self + " rolling for respawn spot... " + tryIndex)

	;Find a spot the player can't see.
	ObjectReference marker	;The marker we'll return to respawn at.
	int loopCount = 0	;We'll use this to make sure we only loop through once.
	while loopCount < markers.Length
		if markers[tryIndex] != None && playerRef.HasDetectionLOS(markers[tryIndex]) == False && playerRef.GetDistance(markers[tryIndex]) > minRespawnDistance
			;Player doesn't have LOS on this marker, and is outside min distance - pick it.
			return markers[tryIndex]
		else
			loopCount = loopCount + 1
			;Increment index.
			if tryIndex >= markers.Length - 1
				;We're at the end, start over.
				tryIndex = 0
			else
				tryIndex = tryIndex + 1
			endif
		endif
	endWhile
	;We didn't find a marker, so return the failsafe.
	return RespawnMarkerFailsafe
endFunction