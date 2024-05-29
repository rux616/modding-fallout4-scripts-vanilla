Scriptname MS11Script extends Quest Conditional

Int Property MandySkippedIntro Auto Const

Int Property MandySkipped Auto Conditional

Int Property nEngineSoundID01 Auto Conditional

Int Property nEngineSoundID02 Auto Conditional

Int Property nAuxPowerSoundID Auto Conditional
	
InputEnableLayer inputLayer

Group Ship_Launch_And_Destruction
	ImagespaceModifier Property DN029ConstitutionCrashImod Auto
	ReferenceAlias Property StartingStaticShip Auto
	ReferenceAlias Property PreLaunchStaticShip Auto
	ReferenceAlias Property PreLaunchEngine Auto
	ReferenceAlias Property LaunchShip Auto
	ReferenceAlias Property PostQuestEnableMarker01 Auto
	ReferenceAlias Property PostQuestEnableMarker02 Auto
	Referencealias Property PostQuestShip Auto
	Referencealias Property PostQuestShipForReal Auto
	ObjectReference Property FollowerCommentMarker Auto
	ObjectReference Property MS11USSConstitutionAttachRefEnableMarker Auto Const
	ObjectReference Property MS11PoseidonRadarEnableMarker Auto Const
EndGroup

Int FirstShipSwapTimerInstance = 10
Int SecondShipSwapToLaunchTimerInstance = 20
Int LaunchShipTimerInstance = 30

Keyword Property LinkCustom01 Auto


Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()
		; Kill the combat music
		pMUSzCombat.Remove()
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif
EndEvent

Function FirstShipSwap()
	inputLayer = InputEnableLayer.Create()
	debug.Trace(self + "Pre Launch Ship, and Engine, Enabled.")
	PreLaunchStaticShip.GetReference().EnableNoWait()
	PreLaunchEngine.GetReference().EnableNoWait()
	StartTimer(2, FirstShipSwapTimerInstance)
EndFunction


Function SecondShipSwapToLaunch()
	debug.Trace(self + "Launch Ship Enabled")
	;LaunchShip.GetReference().EnableNoWait()
	StartTimer(1.5, SecondShipSwapToLaunchTimerInstance)
EndFunction


Function LaunchShip()
	StartTimer(0.5, LaunchShipTimerInstance)
EndFunction


Event OnTimer(int aiTimerID)

    if aiTimerID == FirstShipSwapTimerInstance
    	debug.Trace(self + "Static Ship Disabled")
		StartingStaticShip.GetReference().DisableNoWait()
    	PreLaunchStaticShip.GetReference().PlayAnimation("Stage1")
    	utility.Wait(1)
    	PreLaunchStaticShip.GetReference().PlayAnimation("Stage2")

    elseif aiTimerID == SecondShipSwapToLaunchTimerInstance


    elseif aiTimerID == LaunchShipTimerInstance
    	utility.Wait(3)
    	Game.ShakeCamera(Game.GetPlayer(), 1, 1.5)
		Game.ShakeController(1, 1, 1.5)
    	debug.Trace(self + "FIRST Post Quest Enable Marker Disabled")
		PostQuestEnableMarker01.GetReference().DisableNoWait()
		debug.Trace(self + "Pre Launch Ship Disabled")
		StartingStaticShip.GetReference().DisableNoWait()
    	LaunchShip.GetReference().PlayAnimation("Stage2")
    	utility.Wait(0.5)
    	PreLaunchStaticShip.GetReference().DisableNoWait()
		PreLaunchEngine.GetReference().DisableNoWait()
		debug.Trace(self + "Launch Ship Start Animating")
		utility.Wait(1)
    	Game.ShakeCamera(Game.GetPlayer(), 0.3, 6)
		Game.ShakeController(0.3, 0.3, 6)
    	utility.Wait(5)
    	Game.ShakeCamera(Game.GetPlayer(), 0.3, 1)
		Game.ShakeController(0.3, 0.3, 1)
    	utility.Wait(10)
    	if Game.GetPlayer().GetDistance(LaunchShip.GetReference().GetLinkedRef()) < 3000
    		PostQuestEnableMarker02.GetReference().DisableNoWait()
    		PostQuestShip.GetReference().EnableNoWait()
    	endif
    	utility.Wait(9)
    	if Game.GetPlayer().GetDistance(LaunchShip.GetReference().GetLinkedRef()) > 3000
    		debug.Trace(self + "Player is far away from the ship, do distant stuff. " + Game.GetPlayer().GetDistance(LaunchShip.GetReference().GetLinkedRef()))
    		Game.ShakeCamera(Game.GetPlayer(), 0.1, 5)
			Game.ShakeController(0.1, 0.1, 5)
			;utility.Wait(2)
    		PostQuestShip.GetReference().EnableNoWait()
    		PostQuestEnableMarker02.GetReference().DisableNoWait()
    		MS11USSConstitutionAttachRefEnableMarker.DisableNoWait()
		MS11PoseidonRadarEnableMarker.DisableNoWait()
    		utility.Wait(4)
    		PostQuestShipForReal.GetReference().EnableNoWait()
			utility.Wait(16)
			debug.Trace(self + "SECOND Post Quest Enable Marker Disabled")
    		(LaunchShip.GetReference().GetLinkedRef(LinkCustom01) as MS11HandleDisablingShipScript).RegisterShipForDistanceDisable()
			;LaunchShip.GetReference().DisableNoWait()

			SetStage(975)  ; Post quest cleanup stage

			utility.Wait(2)
			FollowerCommentMarker.EnableNoWait()
    	else
    		debug.Trace(self + "Player is on the ship, do close up stuff. " + Game.GetPlayer().GetDistance(LaunchShip.GetReference().GetLinkedRef()))
    		Game.ShakeCamera(Game.GetPlayer(), 1, 5)
			Game.ShakeController(1, 1, 5)
			PostQuestShip.GetReference().EnableNoWait()
    		PostQuestEnableMarker02.GetReference().DisableNoWait()
			utility.Wait(1)
			Game.GetPlayer().Kill()
			utility.Wait(1)
    		DN029ConstitutionCrashImod.Apply()
    		;utility.Wait(1.6)
    		;inputLayer.DisablePlayerControls()
			;utility.Wait(4)
    		;PostQuestShip.GetReference().EnableNoWait()
			;Game.GetPlayer().MoveTo(LaunchShip.GetReference().GetLinkedRef())
			;inputLayer.EnablePlayerControls()
			;debug.Trace(self + "SECOND Post Quest Enable Marker Disabled")
			;utility.Wait(7)
			;LaunchShip.GetReference().DisableNoWait()

			;SetStage(975)  ; Post quest cleanup stage
    	endif

	endif

EndEvent
MusicType Property pMUSzCombat Auto Const

Int Property nCountdownWaiting Auto Conditional
