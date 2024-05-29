Scriptname DLC06:WorkshopObjectDeathScript extends ObjectReference
{NPCs assigned to this might die}

float property DeathPercentChance = 5.0 auto const 
{ chance an NPC will die }

float property DeathCheckInterval = 1.0 auto const 
{ how often to roll for death (in days) }

float property TryToKillTimerGameHours = 1.0 auto const 
int property TryToKillTimerID = 1 auto const 

float property WaitToKillTimerGameHoursMin = 0.1 auto const 
float property WaitToKillTimerGameHoursMax = 0.3 auto const 
int property WaitToKillTimerID = 2 auto const 

int property RollForDeathTimerID = 3 auto const 

ActorValue property DLC06WorkshopRatingMortalityChanceLastCheck auto const mandatory
{ use to timestamp actor }

ActorValue property DLC06WorkshopReadyToKill auto const mandatory
{ use to flag object when ready to kill owning actor }

bool bReadyToKill = false ; when true, no need to roll - waiting to kill user

Event OnLoad()
	debug.trace(self + " OnLoad:")
	StartWaitToKillTimer()
    RegisterForPlayerWait()
    RegisterForPlayerSleep()
EndEvent

Event OnUnload()
	debug.trace(self + " OnUnload:")
	RollForDeath()
    UnregisterForPlayerWait()
    UnregisterForPlayerSleep()
endEvent

Event OnPlayerWaitStop(bool abInterrupted)
	StartWaitToKillTimer()
endEvent 

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	StartWaitToKillTimer()
endEvent 

; NOTE: two different timers to get around the wait issue (where game time timers immediately complete when started immediately after player wait/sleep)
; this is called first
function StartWaitToKillTimer()
	float randomRoll = utility.RandomFloat(3, 10)
	debug.trace(self + " StartWaitToKillTimer: wait " + randomRoll + " seconds")
	StartTimer(randomRoll, WaitToKillTimerID)
endFunction 

; this one is called after StartWaitToKillTimer completes
function StartRollForDeathTimer()
	float randomRoll = utility.RandomFloat(WaitToKillTimerGameHoursMin, WaitToKillTimerGameHoursMax)
	debug.trace(self + " StartRollForDeathTimer: wait " + randomRoll + " game hours")
	StartTimerGameTime(randomRoll, RollForDeathTimerID)
endFunction 

function RollForDeath()
	; get my actor
	Actor myActor = GetActorRefOwner()
	debug.trace(self + " RollForDeath: myActor=" + myActor)
	if myActor 
		float lastCheck = myActor.GetValue(DLC06WorkshopRatingMortalityChanceLastCheck)
		float currentTime = Utility.GetCurrentGameTime()
		float numberOfRolls = (currentTime - lastCheck) / DeathCheckInterval
		debug.trace(self + " 	numberOfRolls=" + numberOfRolls)
		float readyToKill = GetValue(DLC06WorkshopReadyToKill)

		if readyToKill > 0
    		debug.trace(self + " 	waiting to kill " + myActor)
    		TryToKill()
		elseif numberOfRolls >= 1
			; time stamp this check
			myActor.SetValue(DLC06WorkshopRatingMortalityChanceLastCheck, currentTime)	
			int i = 0
			while i < numberOfRolls && myActor.IsDead() == false 		
				; roll for settler death
				int dieRoll = Utility.RandomInt()
				debug.trace(self + " 	dieRoll=" + dieRoll)
				if dieRoll <= DeathPercentChance 
		    		debug.trace(self + " 	marked for death: " + myActor)
		    		TryToKill()
				endif
				i += 1
			endWhile
		endif
	endif
endFunction 

function TryToKill()
	debug.tracestack(self + " TryToKill")
	; get my actor
	Actor myActor = GetActorRefOwner()
	if myActor && myActor.IsEssential() == false
		debug.trace(self + " TryToKill: myActor=" + myActor)
		if myActor.GetSitState() > 0 && myActor.GetSleepState() == 0 && IsFurnitureInUse()
			debug.trace(self + " TryToKill: KILL")
			myActor.SetProtected(false)
			myActor.Kill()
			SetValue(DLC06WorkshopReadyToKill, 0)
		else 
			debug.trace(self + " TryToKill: " + myActor + " not on furniture - wait an hour")
			SetValue(DLC06WorkshopReadyToKill, 1)
			; run timer to try again later
			StartWaitToKillTimer()
		endif
	endif
endFunction

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
	if aiTimerID == WaitToKillTimerID
		StartRollForDeathTimer()
	endif
endEvent 

Event OnTimerGameTime(int aiTimerID)
	debug.trace(self + " OnTimerGameTime " + aiTimerID)
	if aiTimerID == TryToKillTimerID
		TryToKill()
	elseif aiTimerID == RollForDeathTimerID
		RollForDeath()
	endif
endEvent