Scriptname DLC03:VRDataRetrieverScript extends Actor conditional

float property respawnTimeMin = 3.0 auto Const
float property respawnTimeMax = 10.0 auto Const

int property hitsToKill = 2 auto Const
{ how many hits to kill this? }

DLC03:MQ04Script Property myQuest auto Const mandatory
{ quest to notify when I die while retrieving data }

bool property bIsDataRetriever = true const auto 
{ if TRUE, picks up data retriever effects
  if FALSE, no effects }

FormList Property DLC03VRProjectileIgnoreList const auto mandatory
{ projectiles in this list will not count towards hit count }

int hitCount = 0 conditional

float zPosition = 0.0 ; record starting z-position for moving safe spot marker
float zPositionAllowed = 5.0 ; how much away from starting z is still ok for moving safe marker

float property hitsToKillChance = 0.3 auto const
{ if hitsToKill is set to 0 or less, roll this on each hit to see if I die }

Keyword property DLC03VRLastSafeSpot auto const 
{ optional - for data retrievers to link to safe spot marker }

int iRespawnTimerID = 1 const

float fSafeSpotTimerTime = 1.0 const 
int iSafeSpotTimerID = 2 const

group flags
	bool property bReportOnDeath = false auto
	bool property bReportStartCombat = false auto
	bool property bKillOnFall = true auto 
	{ TRUE = kill box kills me; FALSE = kill box moves me to last position (or nearest navmesh) }
endGroup

Event OnLoad()
	RegisterForHitEvent(self)
	if bKillOnFall == false && DLC03VRLastSafeSpot && GetLinkedRef(DLC03VRLastSafeSpot) != NONE
		ResetSafeSpotMarker()
	endif
	if bIsDataRetriever && Is3DLoaded()
		myQuest.MQ04.DLC03VRRetrieverFXS.Play(self)
	endif
EndEvent

Event OnInit()
	RegisterForHitEvent(self)
	debug.trace(self + " OnInit: zPosition=" + zPosition)
EndEvent

Event OnUnload()
	ReturnData()
EndEvent

Event OnDying(Actor akKiller)
	if bReportOnDeath
		myQuest.MQ04.StartVOScene(self, myQuest.MQ04.VOScene01_OnDeath, GetItemCount(myQuest.DLC03DataItem) > 0, hitCount > 0)
	endif
EndEvent

Event OnDeath(Actor akKiller)
    if bIsDataRetriever
        PlaceAtMe(myQuest.MQ04.DLC03VRDataRetrieverExplosion)
    endif
	ReturnData()
	startTimer(utility.randomFloat(respawnTimeMin, respawnTimeMax), iRespawnTimerID)
	Disable(true)
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iRespawnTimerID
		Reset()
		; enable only if memory is not complete
		if myQuest.GetStageDone(myQuest.iMemoryCompleteStage) == false
			Enable()
		endif
		; clear hitCount
		hitCount = 0
		RegisterForHitEvent(self)
	elseif aiTimerID == iSafeSpotTimerID
		ResetSafeSpotMarker()
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + " OnHit by " + akProjectile + ", " + akSource + ": hitCount=" + hitCount)
	; only care about projectiles not in the "ignore" list
	Form hitBy = akSource
	if hitBy == NONE
		hitBy = akProjectile
	endif

	int ignoreHitBy = DLC03VRProjectileIgnoreList.Find(hitBy)
	debug.trace(self + " hitBy=" + hitBy + ", ignoreHitBy=" + ignoreHitBy)

	if hitBy && ignoreHitBy == -1
		hitCount += 1
		debug.trace(self + " counting hit, hitCount=" + hitCount)
		if hitsToKill < 1
			; roll
			float randomRoll = utility.RandomFloat()
			if randomRoll <= hitsToKillChance
				Kill()
			endif
		elseif hitCount >= hitsToKill
			Kill()
		endif
	else
		debug.trace(self + " ignoring hit")
	endif
	RegisterForHitEvent(self)
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if bReportStartCombat
		debug.trace(self + " OnCombatStateChanged akTarget=" + akTarget + " aeCombatState=" + aeCombatState)
		if aeCombatState > 0
			myQuest.MQ04.StartVOScene(self, myQuest.MQ04.VOScene02_StartCombat)
		endif
	endif
EndEvent

; called on death, or when I unload
function ReturnData()
	if myQuest
		debug.trace(self + "ReturnData: data item count=" + GetItemCount(myQuest.DLC03DataItem))
		if GetItemCount(myQuest.DLC03DataItem) > 0
			; give data item back
			myQuest.DataGrab(self, false)
		endif
	endif
endFunction

function ResetSafeSpotMarker()
	if DLC03VRLastSafeSpot && IsDisabled() == false
		; make sure marker is still on navmesh
		ObjectReference mySafeMarker = GetLinkedRef(DLC03VRLastSafeSpot)
		if mySafeMarker
			; make sure on navmesh (in case about to fall)
			mySafeMarker.MoveToNearestNavmeshLocation()
		endif
		
		if IsDead() == false
			; if current position is >= original z position, move marker to me
			float currentZ = GetPositionz()
			; get z value for starting location
			if zPosition == 0.0
				zPosition = GetPositionZ()
			endif
			debug.trace(self + " ResetSafeSpotMarker: currentZ=" + currentZ + ", starting Z=" + zPosition)
			if math.abs(currentZ - zPosition) <= zPositionAllowed
				if mySafeMarker
					debug.trace(self + "	moving marker " + mySafeMarker + " to new safe spot")
					mySafeMarker.MoveTo(self)
					; make sure on navmesh (in case about to fall)
					mySafeMarker.MoveToNearestNavmeshLocation()
				endif
			endif
		endif
		StartTimer(fSafeSpotTimerTime, iSafeSpotTimerID)
	endif
endfunction 

function MoveToLastSafeSpot()
	ObjectReference mySafeMarker = GetLinkedRef(DLC03VRLastSafeSpot)
	debug.trace(self + " MoveToLastSafeSpot: mySafeMarker=" + mySafeMarker)
	if mySafeMarker
		MoveTo(mySafeMarker)
    else 
        ; if can't move to a safe spot, just kill me so I reset
        Kill()
	endif
endFunction