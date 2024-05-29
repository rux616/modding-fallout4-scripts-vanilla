Scriptname DLC03:DLC03BoatAnimScript extends ObjectReference Hidden

InputEnableLayer FastTravelInputLayer

InputEnableLayer Property ControlInputLayer auto


Int Property StartFadeTime = 12 auto
Int Property StartFadeTimerID =  10 auto const

ImageSpaceModifier Property HoldAtBlack const auto

ObjectReference Property OceanMovetoMarker const auto
ObjectReference Property OtherBoat const auto
ObjectReference	Property BoatCollision const auto
ObjectReference Property OceanMoveToMarkerCollision const auto
ObjectReference Property FollowerMoveToDepart const auto
ObjectReference Property FollowerMoveToArrive const auto

Bool Property DockOnLoad = TRUE auto
{If TRUE then the boat will be in the DOCKED position OnLoad().  If FALSE then it will be in the OCEAN position.}

Bool Property GoToOtherBoat = FALSE auto
Bool Property IsALTBoat	= FALSE auto
ObjectReference Property OtherBoatALT const auto
Bool Property IsIntro = FALSE Auto
{If TRUE, this boat will fire off all the special intro to Far Harbor scripting}

MusicType Property DLC03MUSSpecialBoatArrival Auto Const
Weather Property dlc03_radmistweather Auto Const
GlobalVariable Property GameHour Auto Const
Quest Property pDLC03FarHarborS03 Auto Const

Actor[] Property ActorsToEnable Auto

ObjectReference Property DLC03CompanionHoldMarker Auto Const
ObjectReference Property DLC03CompanionFarHarborMarker Auto Const

Event OnLoad()
	WaitFor3DLoad()
    if DockOnLoad
    	if IsALTBoat
    		self.Disable()
    	else
	    	GoToState("Docked")
	    	PlayAnimation("StartDock01")
	    	BoatCollision.DisableNoWait()
	    	OceanMoveToMarkerCollision.DisableNoWait()
	    endif
    else
    	GoToState("Ocean")
    	PlayAnimation("StartOcean01")
    	;Game.GetPlayer().MoveTo(OceanMovetoMarker)
    	;utility.Wait(0.5)
    	HoldAtBlack.ApplyCrossFade(0)
    	ImageSpaceModifier.RemoveCrossFade(3)
    	;Game.GetPlayer().MoveTo(OceanMovetoMarker)
    	;utility.Wait(0.5)
    	Activate(Game.GetPlayer())
    endif
EndEvent

Event OnUnload()
    OceanMoveToMarkerCollision.EnableNoWait()
EndEvent


auto STATE Docked
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Moving")

		Actor[] PlayerFollowers = Game.GetPlayerFollowers()
		int CurrentFollowerIndex = 0
		while (CurrentFollowerIndex < PlayerFollowers.Length)
			Debug.Trace(self + "| MOVING TO HOLDING CELL " + PlayerFollowers[CurrentFollowerIndex])
			PlayerFollowers[CurrentFollowerIndex].SetDoingFavor(FALSE)
			;PlayerFollowers[CurrentFollowerIndex].DisableNoWait()
			PlayerFollowers[CurrentFollowerIndex].moveto(DLC03CompanionHoldMarker)
			CurrentFollowerIndex += 1
		endWhile

	    PlayAnimation("Play01")
	   	BoatCollision.EnableNoWait()
	    StartTimer(StartFadeTime, StartFadeTimerID)
	    if GoToOtherBoat
	    	(OtherBoatALT as DLC03BoatAnimScript).DockOnLoad = FALSE
	    	(OtherBoatALT as DLC03BoatAnimScript).ActorsToEnable = PlayerFollowers
	    else
	    	(OtherBoat as DLC03BoatAnimScript).DockOnLoad = FALSE
	    	(OtherBoat as DLC03BoatAnimScript).ActorsToEnable = PlayerFollowers
	   	endif

	EndEvent
EndSTATE


STATE Ocean
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("Moving")	    
	    OceanMoveToMarkerCollision.EnableNoWait()

	    BoatCollision.EnableNoWait()

	    ;one-shot Far Harbor intro scripting
		If IsIntro
			IsIntro=False
			;play intro music, set weather, and set time of day
			DLC03MUSSpecialBoatArrival.Add()
			dlc03_radmistweather.ForceActive()
			GameHour.SetValueInt(3)
			BoatCollision.EnableNoWait()
			;wait for the loadscreen before we request save
			Utility.Wait(0.25)
			Game.RequestSave()
		EndIf

	    PlayAnimationAndWait("Play01", "Done")

		int CurrentFollowerIndex = 0
		while (CurrentFollowerIndex < ActorsToEnable.Length)
			Debug.Trace(self + "| MOVING TO FAR HARBOR " + ActorsToEnable[CurrentFollowerIndex])
			;ActorsToEnable[CurrentFollowerIndex].EnableNoWait()
			ActorsToEnable[CurrentFollowerIndex].moveto(FollowerMoveToDepart)
			CurrentFollowerIndex += 1
		endWhile

		ActorsToEnable.Clear()

	    BoatCollision.DisableNoWait()
	    OceanMoveToMarkerCollision.DisableNoWait()
	    DockOnLoad = TRUE
	    FastTravelInputLayer.EnableFastTravel(True)
		FastTravelInputLayer = none

		; Check to see if you're on the approach to Red Death Island - if so progress "The Great Hunt"
		if ( pDLC03FarHarborS03.GetStageDone(200) )
			pDLC03FarHarborS03.SetStage(250)
		endif

		GoToState("Docked")
	EndEvent
EndSTATE


STATE Moving

	Event OnBeginState(string asOldState)
		;ControlInputLayer = InputEnableLayer.Create()
		;ControlInputLayer.DisablePlayerControls(false, false, false, false, false, false, false, false, false, false, false)
	    FastTravelInputLayer = InputEnableLayer.Create()
		FastTravelInputLayer.EnableFastTravel(False)


	EndEvent

EndSTATE


Event OnTimer(int aiTimerID)
	if aiTimerID == StartFadeTimerID
    	HoldAtBlack.ApplyCrossFade(3)
    	utility.Wait(4)
    	FastTravelInputLayer.EnableFastTravel(True)
		FastTravelInputLayer = none
		;ControlInputLayer.EnablePlayerControls()
		;ControlInputLayer = None
		if GoToOtherBoat
			Game.GetPlayer().MoveTo((OtherBoatALT as DLC03BoatAnimScript).OceanMovetoMarker)
		else
			Game.GetPlayer().MoveTo((OtherBoat as DLC03BoatAnimScript).OceanMovetoMarker)
		endif
    endif
EndEvent