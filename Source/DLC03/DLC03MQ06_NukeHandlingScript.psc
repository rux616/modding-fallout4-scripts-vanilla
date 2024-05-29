Scriptname DLC03:DLC03MQ06_NukeHandlingScript extends Quest

ObjectReference Property ExtNukeMarker Auto Const Mandatory
{Marker for sound source for exterior explosion}

ObjectReference Property NucleusExteriorEnableMarker Auto Const Mandatory
{Enable/disable marker for Nucleus exterior}

Sound Property NukeExplosionSound Auto Const Mandatory 
{Nuke explosion sound}

RefCollectionAlias Property Alias_NucleusCitizens Auto Const Mandatory
{Ref collection of all Nucleus citizens. Used to turn them all off/shut down quest}

ReferenceAlias Property InteriorNuke Auto Const Mandatory
{Reference to nuke in Nucleus interior}

ReferenceAlias Property EntranceBuilding Auto Const Mandatory
{The entrance building to the Nucleus. Dealing damage to it causes it to BOOM}

ReferenceAlias Property SubBayDoor Auto Const Mandatory
{The big sub bay door to Nucleus. Dealing damage to it causes it to BOOM}

float Property fFXTriggerDamage = 3.0 Auto Const
{Amount of damage dealt to sub bay door/entrance building to get them to explode}

float Property ExplosionNearDistance = 1000.0 Auto Const
{Distance for player to trigger strong rumble/explosion, etc.}

float Property ExplosionFarDistance = 2000.0 Auto Const
{Distance for player to trigger distant rumble/explosion, etc.}

float Property iOpenHatchTimerLength = 20.0 Auto Const
{Length of time for before nuke hatch begins opening}

float Property iNukeSceneTimerShortLength = 60.0 Auto Const
{Length of time for initial timer for nuke scene}

float Property iNukeLaunchTimerLength = 10.0 Auto Const
{Length of time before nuke should fire after nuke scene has ended}

float Property iNukeSceneTimerLongLength = 90.0 Auto Const
{Length of time for backup timer for nuke scene}

float Property iNukeLaunchCompletionLength = 6.0 Auto Const
{Length of time to wait before triggering the detonation if interior launch is active but object has unloaded}

float Property iPlayerKillTimerLength = 2.0 Auto Const
{Length of time to wait before attempting to kill the player again}

;Custom Event
CustomEvent NukeCountdownStarted
InputEnableLayer NukeDisableFastTravelLayer

;Local vars
int iOpenHatchTimerID = 1 Const
int iNukeSceneTimerShortID = 2 Const
int iNukeLaunchTimerShortID = 3 Const
int iNukeSceneTimerLongID = 4 Const
int iNukeLaunchTimerLongID = 5 Const
int iNukeLaunchCompletionID = 6 Const
int iPlayerKillTimerID = 7 Const
bool bInteriorNukeLaunched = false

Event OnTimer(int aiTimerID)
	if aiTimerID == iOpenHatchTimerID
		;Set stage to trigger the nuke hatch opening
		SetStage(130)
		
	elseif aiTimerID == iNukeSceneTimerShortID
		;If stage to close doors hasn't been set, set it now
		if !GetStageDone(140)
			SetStage(140)
		endif

		;Start timer to check for nuke launch
		StartTimer(iNukeLaunchTimerLength, iNukeLaunchTimerShortID)

	elseif aiTimerID == iNukeLaunchTimerShortID
		;If stage to fire nuke hasn't been set, set it now
		if !GetStageDone(150)
			SetStage(150)
		endif
	elseif aiTimerID == iNukeSceneTimerLongID
		;If stage to close doors hasn't been set, set it now and start next timer
		if !GetStageDone(140)
			SetStage(140)
		endif

		;Start timer to check for nuke launch
		StartTimer(iNukeLaunchTimerLength, iNukeLaunchTimerLongID)

	elseif aiTimerID == iNukeLaunchTimerLongID
		;If stage to fire nuke hasn't been set, set it now
		if !GetStageDone(150)
			SetStage(150)
		endif

	elseif aiTimerID == iNukeLaunchCompletionID
		;If stage to fire nuke hasn't been set, set it now
		if !bInteriorNukeLaunched
			FireInteriorExplosion()
		Endif
	elseif aiTimerID == iPlayerKillTimerID
		;Attempt to kill the player again. If they're not dead, start timer over.
		Actor PA = Game.GetPlayer()
		PA.Kill()
  		Game.FadeOutGame(True, False, 1.0, 1.0, True)

  		if !PA.IsDead()
  			StartTimer(iPlayerKillTimerLength, iPlayerKillTimerID)
  		endif
	endif
EndEvent

Function SendNukeCountdownEvent()
	SendCustomEvent("NukeCountdownStarted")
EndFunction

Function StartOpenHatchTimer()
	StartTimer(iOpenHatchTimerLength, iOpenHatchTimerID)
EndFunction

Function StartShortFailSafeNukeTimer()
	StartTimer(iNukeSceneTimerShortLength, iNukeSceneTimerShortID)
EndFunction

Function StartLongFailSafeNukeTimer()
	StartTimer(iNukeSceneTimerLongLength, iNukeSceneTimerLongID)
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	;Empty state definition
EndEvent

Auto State LocationCheckActive
	Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
		GoToState("LocationCheckBusy")
		;debug.trace("MQ06 Nuke Handling: Location change check.")
		if akSender == Game.GetPlayer()
			;debug.trace("MQ06 Nuke Handling: Player changed loc. Look for NPCs.")

			;Roll through Nucleus Citizen ref collection to see if NPCs have 3d. If they don't, disable them.
			int i = 0
			bool iActiveNPCs = false
			int iRefCount = Alias_NucleusCitizens.GetCount()

			while i < iRefCount

				Actor act = (Alias_NucleusCitizens.GetAt(i) as Actor)

				;debug.trace("MQ06 Nuke Handling: Checking citizen: "+ act)
				if !act.Is3dLoaded()
					;debug.trace("MQ06 Nuke Handling: Disabling "+ act)
					act.Disable()
				endif

				if !iActiveNPCs && !act.IsDisabled()
					;debug.trace("MQ06 Nuke Handling: Citizen not disabled: "+ act)
					iActiveNPCs = true
				endif

				i += 1
			endwhile

			;If there are no active NPCs left, shut down quest
			if !iActiveNPCs
				debug.trace("MQ06 Nuke Handling: No active citizens. SHUT IT DOWN. ")
				SetStage(500)
			endif

		endif

		;If we haven't shut down, 
		GoToState("LocationCheckActive")
	EndEvent
EndState

State LocationCheckBusy
	Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
		;Do nothing
	EndEvent
EndState

Function TriggerExteriorExplosion()
	ObjectReference SBD = SubBayDoor.GetRef()
	ObjectReference EB = EntranceBuilding.GetRef()

	;Check to see if sub bay is loaded and deal destruction appropriately
	if SBD.Is3DLoaded()
		RegisterForRemoteEvent(SBD, "OnDestructionStageChanged")
	else
		NucleusExteriorEnableMarker.Disable()
	endif

	SBD.DamageObject(fFXTriggerDamage)
	EB.DamageObject(fFXTriggerDamage)

	;Takes a couple of second for the damage to populate to the damage
	Utility.Wait(5.0)

	;Reenable player's fast travel
	EnablePlayerFastTravel()

	;Try to disable all the Nucleus citizenry
	int i = 0
	int iCount = Alias_NucleusCitizens.GetCount()
	bool bCitizensActive = false
	while i < iCount
		ObjectReference obj =  Alias_NucleusCitizens.GetAt(i)

		;If they're not loaded, disable 'em
		if !obj.Is3dLoaded()
			obj.Disable()
		else
			;If they are loaded, mark it
			if !bCitizensActive
				;debug.trace("MQ06 Nuke Handling: Citizen still active: "+ obj)
				bCitizensActive = true
			endif
		endif

  		i+=1
	endwhile

	;If there are citizens remaining, keep quest running and register player for change location event
	if bCitizensActive
		;debug.trace("MQ06 Nuke Handling: Register for change location event on player. ")
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	else
		;Otherwise, shut this thang down
		SetStage(500)
	endif

EndFunction

Function TriggerInteriorExplosion()
	;Register for failsafe timer for nuke launch
	StartTimer(iNukeLaunchCompletionLength, iNukeLaunchCompletionID)
	
	;Launch the nuke and wait for it to hit
	ObjectReference IntNuke = InteriorNuke.GetRef()
	RegisterForAnimationEvent(IntNuke, "MissileImpact")
	IntNuke.PlayAnimation("Launch")
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == InteriorNuke.GetRef() && asEventName == "MissileImpact"
		if !bInteriorNukeLaunched
			FireInteriorExplosion()
		Endif
	Endif
EndEvent

Function FireInteriorExplosion()
	if !bInteriorNukeLaunched
		bInteriorNukeLaunched = true
		Actor PA = Game.GetPlayer()

		;Sounds and booms
		NukeExplosionSound.Play(PA)
		;debug.trace("MQ06: Nuke rumble go!")
		game.ShakeCamera(none, 1.0, 4.0)
		game.ShakeController(0.85, 0.85, 4.0)

		;Kill the player
		PA.Kill()

		;Start player kill timer
  		if !PA.IsDead()
  			StartTimer(iPlayerKillTimerLength, iPlayerKillTimerID)
  		endif

  		;Reenable player fast travel
		EnablePlayerFastTravel()
  
		;Fade to white
  		Game.FadeOutGame(True, False, 1.0, 1.0, True)
  
		;Kill all the Nucleus citizenry
		int i = 0
		while i < Alias_NucleusCitizens.GetCount()
			Actor act =  (Alias_NucleusCitizens.GetAt(i) as Actor)
			ActorBase AB = act.GetActorBase()

			if AB.IsProtected()
				AB.SetProtected(false)
			endif

			act.Kill()
			i+=1
		endwhile
  	endif
EndFunction

int Function GetCoAAliveCount()
		;See how many of the Children of Atom are still alive and return that number
		int i = 0
		int iAliveCount = 0
		while i < Alias_NucleusCitizens.GetCount()
			Actor act =  (Alias_NucleusCitizens.GetAt(i) as Actor)
			if !act.IsDead() && !act.IsDisabled()
				iAliveCount +=1 
			endif
			i+=1
		endwhile

		return iAliveCount
EndFunction

Event ObjectReference.OnDestructionStageChanged(ObjectReference akSender, int aiOldStage, int aiCurrentStage)
	;When the sub bay actually changes state, disable all the stuff around it
	if akSender == SubBayDoor.GetRef() && aiCurrentStage == 2
		NucleusExteriorEnableMarker.Disable()
	endif
EndEvent

Function DisablePlayerFastTravel()
	NukeDisableFastTravelLayer = InputEnableLayer.Create()
	NukeDisableFastTravelLayer.EnableFastTravel(false)
EndFunction

Function EnablePlayerFastTravel()
	NukeDisableFastTravelLayer.EnableFastTravel(true)
	NukeDisableFastTravelLayer = none
EndFunction