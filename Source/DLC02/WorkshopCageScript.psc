Scriptname DLC02:WorkshopCageScript extends workshopobjectscript

group cageProperties
	ActorBase property myCapturedActorBase auto const
	{ actor or leveled list to use for captured actor }

	FormList property myCapturedActorFormList auto const
	{ OPTIONAL - use this instead of myCapturedActorBase - will pick randomly from the form list }

	ActorBase property myCapturedActorBaseSpecial auto const
	{ OPTIONAL - special actor or leveled list to use if myCapturedActorSpecialChance is rolled }

	float property myCapturedActorSpecialChance = 0.05 auto const
	{ chance of capturing myCapturedActorBaseSpecial }

	ActorValue property myCapturedActorResource auto const
	{ actor value - resource - to add to cage when capture actor is in it }

	string property myNode = "CreatureNode01" auto const

	bool property HasCapturedActor auto hidden conditional
	{ TRUE after an actor is inside the cage - ready to be released }

	DLC02:DLC02WorkshopAttackStarterScript property DLC02WorkshopAttackStarter auto const mandatory
endGroup

float captureTimeStart = 0.0 			; set to GameDaysPassed when built, used to roll for capture
float maxCaptureTime = 5.0 const 		; used for capture roll - at maxCaptureTime (game days), 100% chance to capture

float lastCaptureCheck = 0.0				; timestamp of last time we checked for capture
float minCaptureCheckInterval = 0.25 const	; at least this many gamedays must pass before we check again

bool bIsPlayerSleeping = false  			; currently the only way to tell if player is sleeping is to roll our own

function CheckForCapture()
	if IsDestroyed() == false && IsPowered()
		debug.trace(self + "CheckForCapture: captureTimeStart=" + captureTimeStart)
		
		float currentTime = Utility.GetCurrentGameTime()

		; how long has passed since capture start?
		float captureTime = currentTime - captureTimeStart

		; has enough time passed since last check?
		float lastCheckTimePassed = currentTime - lastCaptureCheck
		if lastCaptureCheck == 0.0
			; never checked means just built - set last capture check to now but don't actually roll for capture
			debug.trace(self + " CheckForCapture: cage just built - initialize lastCaptureCheck")
			lastCaptureCheck = currentTime
		elseif lastCheckTimePassed >= minCaptureCheckInterval
			; capture chance:
			float captureChance = captureTime/maxCaptureTime
			float captureRoll = Utility.RandomFloat(0.0, 1.0)
			debug.trace(self + "CheckForCapture: captureTime=" + captureTime + ", captureChance=" + captureChance + ", captureRoll=" + captureRoll)
			if captureRoll <= captureChance
				CaptureActor()
			endif
			; update lastCaptureCheck
			lastCaptureCheck = currentTime
		else
			debug.trace(self + " CheckForCapture: last check was " + lastCheckTimePassed + " days ago, don't check again until " + minCaptureCheckInterval + " days have passed")
		endif
	endif
endFunction


; override parent function for special handling
bool function ModifyResourceDamage(ActorValue akActorValue, float aiDamageMod)
	;  ModifyResourceDamage is only called in 2 places:
	;	WorkshopParent.ResetWorkshop - we definitely want to ignore that (to not release the creature during the reset process)
	; 	WorkshopScript.RepairDamageToResource - auto repairing, which we also don't want to do
	float baseValue = GetBaseValue(akActorValue)
	bool returnVal = false

	if baseValue > 0
		if aiDamageMod > 0
			; positive damage - clear captured actor
			if HasCapturedActor
				returnVal = true ; actually damaged
				CaptureActor(false)
			endif
		endif
	endif

	return returnVal
endFunction

function HandleCreation(bool bNewlyBuilt = true)
	Parent.HandleCreation(bNewlyBuilt)
	if bNewlyBuilt
		CaptureActor(false)
	endif
    RegisterForPlayerSleep()
endFunction

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	Parent.OnDestructionStageChanged(aiOldStage, aiCurrentStage)
	if aiCurrentStage == 0
		; I've been repaired - ready to capture actor
		CaptureActor(false)
	endif
EndEvent

event OnLoad()
	debug.trace(self + " OnLoad")
	Parent.OnLoad()
	; if captured actor, make sure cage is in right state
	if HasCapturedActor
		CheckCageState()
	else
	; otherwise, roll for capture
		CheckForCapture()
	endif
	; register for sleep on load
    RegisterForPlayerSleep()
EndEvent

event OnUnload()
	debug.trace(self + " OnUnload")
	Parent.OnUnload()
	CheckForCapture()
	; unregister on unload so I don't persist
    UnregisterForPlayerSleep()
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	; when stored or scrapped, make sure to clear capture actor value
	CaptureActor(false)
    UnregisterForPlayerSleep()
EndEvent

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
    debug.trace(self + " OnPlayerSleepStart")
    bIsPlayerSleeping = true
    CheckForCapture()
EndEvent

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	bIsPlayerSleeping = false
    debug.trace(self + " OnPlayerSleepStop: HasCapturedActor=" + HasCapturedActor)
    ; wait for capture lock to clear (if sleep is interrupted while capturing an actor)
	int failsafeCount = 0
	while captureBusy && failsafeCount < 10
		debug.trace(self + "OnPlayerSleepStop: ... waiting for lock to clear... " + failsafeCount)
		utility.wait(1.0)
		failsafeCount += 1
	endWhile

	CheckCageState()
EndEvent


bool captureBusy = false ; thread lock
function CaptureActor(bool bIsCaptured = true)
	debug.trace(self + " CaptureActor " + bIsCaptured)
	int failsafeCount = 0
	while captureBusy && failsafeCount < 10
		debug.trace(self + " ... waiting for lock to clear... " + failsafeCount)
		utility.wait(1.0)
		failsafeCount += 1
	endWhile

	; lock
	captureBusy = true

	bool wasAlreadyCaptured = HasCapturedActor

	if bIsCaptured
		if IsDestroyed() == false
			if myCapturedActorResource
				SetValue(myCapturedActorResource, 1.0)
			endif
			if wasAlreadyCaptured == false
				; state change
				WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)
				debug.trace(self + " 	workshopRef=" + workshopRef + ", workshopID=" + workshopID)
				if workshopRef && myCapturedActorResource
					; attack values are Variable type not Resource type, so have to modify them directly
					WorkshopParent.ModifyResourceData(myCapturedActorResource, workshopRef, 1.0)
				endif

				; set player ownership so enemies will attack the cage
				SetFactionOwner(WorkshopParent.PlayerFaction)
			endif
			HasCapturedActor = true
			CheckCageState()
		endif
	else
		captureTimeStart = Utility.GetCurrentGameTime()
		if myCapturedActorResource
			SetValue(myCapturedActorResource, 0)
		endif
		if wasAlreadyCaptured == true
			; state change
			WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)
			debug.trace(self + " 	workshopRef=" + workshopRef + ", workshopID=" + workshopID)
			if myCapturedActorResource
				; attack values are Variable type not Resource type, so have to modify them directly
				WorkshopParent.ModifyResourceData(myCapturedActorResource, workshopRef, -1.0)
			endif
		endif
		HasCapturedActor = false
	endif
	; clear lock
	captureBusy = false
endFunction

function HandleDestruction()
	OpenCage()
	Parent.HandleDestruction()
endFunction

function HandlePowerStateChange(bool bPowerOn = true)
	if bPowerOn == false && HasCapturedActor
		SetDestroyed(true)
		DamageObject(9999.0)
	endif
	Parent.HandlePowerStateChange(bPowerOn)
endFunction

function OpenCage()
	debug.trace(self + " OpenCage: HasCapturedActor=" + HasCapturedActor)
	if HasCapturedActor
		WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)

		; for now very simple - create actor
		ActorBase actorBaseToCreate
		FormList formListToCreate = myCapturedActorFormList
		ActorBase actorBaseToUse = myCapturedActorBase

		; roll for special
		if myCapturedActorBaseSpecial
			if Utility.RandomFloat(0.0, 1.0) <= myCapturedActorSpecialChance
				actorBaseToUse = myCapturedActorBaseSpecial
				formListToCreate = NONE
			endif
		endif

		if formListToCreate
			; pick randomly from form list
			int randomPick = Utility.RandomInt(0, formListToCreate.GetSize()-1)
			actorBaseToCreate = formListToCreate.GetAt(randomPick) as ActorBase
		else
			actorBaseToCreate = actorBaseToUse
		endif

		; clear ownership so actor is allowed to sit in cage
		SetFactionOwner(NONE)

		; create non-temp actor (will call Delete() on untamed/non-domestic animal actors)
		; place at holding marker in cell with special encounter zone so LVL uses player's level, not encounter zone level
		Actor capturedActor = DLC02WorkshopAttackStarter.DLC02CageSpawnMarker.PlaceActorAtMe(actorBaseToCreate, 4, DLC02WorkshopAttackStarter.DLC02PlayerLevelZone) as Actor
		capturedActor.Disable()

		; move to cage node
		capturedActor.MoveToNode(self, myNode)
		; link to cage for initial sit package
		capturedActor.SetLinkedRef(self)
		capturedActor.Enable()
		debug.trace(self + " OpenCage: capturedActor=" + capturedActor)
		CaptureActor(false)

		; wait a bit to do the rest to give actor time to init into furniture
		utility.wait(0.5)

		bool bShouldAddToWorkshop = true ; add creatures to workshop by default

		; if a tameable actor, see if they are tamed as they come out of cage
		DLC02TamedActorScript tamedActor = capturedActor as DLC02TamedActorScript
		if tamedActor
			if tamedActor.CheckForTame(workshopRef)
				tamedActor.StopCombatAlarm()
			endif
		else
			; normal workshop NPC - just add to workshop (always non-hostile)
			if capturedActor is WorkshopNPCScript
				debug.trace(self + " OpenCage - workshopNPC - add to workshop")
				WorkshopParent.AddActorToWorkshopPUBLIC(capturedActor as WorkshopNPCScript, workshopRef, bResetMode = true)
			endif
		endif
		; unlink to cage
		capturedActor.SetLinkedRef(NONE)
	endif
endFunction

function CheckCageState()
	debug.trace(self + " CheckCageState: bIsPlayerSleeping=" + bIsPlayerSleeping)
	; make sure cage is in closed anim state
	if HasCapturedActor
		PlayAnimation("TurnOffNoTransition")
	endif

	if bIsPlayerSleeping == false ; don't open cage while player sleeping - actor ends up in bad state
		; if not powered with captured creature, open
		if HasCapturedActor && IsPowered() == false
			HandlePowerStateChange(false)
		endif
	endif
endFunction

