Scriptname DLC04:DLC04_MonorailScript extends ObjectReference
{Script for the DLC04 Monorail System.}


Group Base_Properties
	Quest property DLC04MQ00 Auto Const Mandatory
	{DLC04MQ00}
	
	Quest property DLC04MQ01 Auto Const Mandatory
	{DLC04MQ01}

	Quest property DLC04MQ01Gauntlet Auto Const Mandatory
	{DLC04MQ01Gauntlet}

	GlobalVariable property DLC04_MonorailLoadActive Auto Const Mandatory
	{Are we in the process of loading via the monorail?}

	ReferenceAlias property Companion Auto Const Mandatory
	{Player's Companion, from DLC04MasterQuest.}

	ReferenceAlias property DogmeatCompanion Auto Const Mandatory
	{Dogmeat, from DLC04MasterQuest.}

	ObjectReference property DLC04_MonorailHoldingCellMarker Auto Const Mandatory
	{A marker to move the player's Companion to during the load.}

	ImagespaceModifier property HoldAtBlackImod Auto Const Mandatory
	{IMod: Holds the screen at black indefinitely.}

	ImagespaceModifier property FadefromBlackImod Auto Const Mandatory
	{IMod: Fades down from black over 1s.}

	Keyword property DLC04Monorail_LinkCompanionOnMonorailTravelMarker Auto Const Mandatory

	Weather property DLC04NukaWorldClear Auto Const Mandatory

	Scene property DLC04MQ01_010_PAGageNukaExpress Auto Const Mandatory

	ObjectReference property DLC04_NukaStationMonorailLoadoutTrigger Auto Const Mandatory

	GlobalVariable property REEnabled Auto Const Mandatory

	MusicType property MUSRevealShort Auto Const Mandatory
EndGroup

Group Reference_Properties
	DLC04:DLC04_MonorailScript property OtherMonorail Auto Const
	{The Monorail on the other side of the load from this one. There are two; one in the Transit Center and one in the Nuka-Worldspace}

	DLC04:DLC04_MonorailControlsScript property MyControls Auto Const
	{The Controls associated with this Monorail.}

	ObjectReference property MyPlayerWarpMarker Auto Const
	{Marker to move the player to when they load in via this Monorail.}

	ObjectReference property MyCompanionWarpMarker Auto Const

	ObjectReference property MyPlatformWarpMarker Auto Const

	ObjectReference property MyLoadDoor Auto Const
	{Load door to activate via script when we're ready to trigger the load.}

	bool property isInteriorMonorail Auto Const
	{Is this the interior monorail?}
EndGroup

Group Scene_Properties
	Scene property DepartureScene Auto Const
	{Scene to play on Departure.}

	Scene property TransitionScene Auto Const
	{Scene to play after loading into the cell on the monorail.}

	Scene property ArrivalScene Auto Const
	{Scene to play on Arrival.}
EndGroup

;Local refs.
InputEnableLayer inputLayer 			;InputEnableLayer used by this elevator to disable fast travel.

int TIMER_Powerup = 1 Const
int TIMER_CompleteMQ00 = 2 Const
int TIMER_FadeIMod = 3 Const


bool loadoutFadeCompleted = False


Auto State Ready
	;Called by DLC04_MonorailUpdaterScript, when a cell that cares about the state of the monorail loads.
	Function UpdateMonorailState()
		;Are we loading in via the monorail? If so, we start out moving. Read the global's value, then clear it.
		bool isMonorailLoadActive = DLC04_MonorailLoadActive.GetValue() > 0
		DLC04_MonorailLoadActive.SetValue(0)

		loadoutFadeCompleted = False

		;Determine where to start the monorail.
		if (isMonorailLoadActive && !isInteriorMonorail)
			;Nuka-World Monorail, starting in the tunnel.

			;We're moving. Switch to that state until we've finished.
			GoToState("Moving")

			Debug.Trace("Starting Monorail in Exterior")

			;Disable fast travel, at least until the animation has finished (longer, during MQ01).
			if (inputLayer == None)
				inputLayer = InputEnableLayer.Create()
			EndIf
			inputLayer.EnableFastTravel(False)

			;Lock movement and combat controls.
			inputLayer.EnableMovement(False)
			inputLayer.EnableFighting(False)
			inputLayer.EnableSneaking(False)
			if (Game.GetPlayer().IsWeaponDrawn())
				Game.GetPlayer().DrawWeapon()
			EndIf

			;Move the monorail into position in the tunnel.
			if (Self.WaitFor3DLoad())
				Self.PlayAnimation("StartAtStart01")
			Else
				Debug.Trace("ERROR: The 3D for " + Self + " didn't load.", 2)
			EndIf

			;Set the Controls to the Off state.
			MyControls.SetOff()

			;Move the player.
			Game.GetPlayer().MoveTo(MyPlayerWarpMarker)

			Debug.Trace("Done Warping Player")

			;Move their companion to the holding cell.
			MoveCompanion()

			;Change the IMod to begin fading in from black.
			Debug.Trace("Start Fadein")
			Game.FadeOutGame(False, True, 0, 1)
			StartTimer(2, TIMER_FadeIMod)

			if (DLC04MQ00.IsRunning())
				;Complete MQ00 as the park comes into view.
				StartTimer(5, TIMER_CompleteMQ00)
				;Force the weather to clear for the first trip in.
				DLC04NukaWorldClear.ForceActive()
			EndIf
			if (TransitionScene != None)
				TransitionScene.Start()
			EndIf

			Debug.Trace("Run Monorail Anim")

			;The Arrival scene will play when the player hits the trigger outside Nuka-Station.
			Self.RegisterForRemoteEvent(DLC04_NukaStationMonorailLoadoutTrigger, "OnTriggerEnter")

			;Run the Monorail animation.
			Self.PlayAnimationAndWait("Play01", "done")

			;Unlock movement and combat controls.
			inputLayer.EnableMovement(True)
			inputLayer.EnableFighting(True)
			inputLayer.EnableSneaking(True)

			;Move the player's companion to platform.
			ReleaseCompanion()

			int failsafe = 0
			While (DLC04MQ01_010_PAGageNukaExpress.IsPlaying() && (failsafe < 300))
				Utility.Wait(1)
				failsafe = failsafe + 1
			EndWhile

			;Re-Enable Random Encounters.
			;These are disabled by ControlLeverActivated, below, before loading into Nuka-World.
			REEnabled.SetValue(1)

			;If DLC04MQ01Gauntlet is running:
			; - We don't re-enable Fast Travel or reactivate the Control Lever at this point. The player is trapped in the Gauntlet until they've finished it.
			; - When DLC04MQ01Gauntlet shuts down, it calls ReenableMonorail to restore the Monorail to normal operation.
			;Otherwise:
			; - Re-enable Fast Travel
			; - Reactivate the control lever.
			if (DLC04MQ01Gauntlet.IsRunning())
				;When the Monorail arrives at the platform, advance MQ01.
				DLC04MQ01.SetStage(100)

				;And force an autosave, to keep the player from having to play through the Monorail ride again.
				Game.RequestAutosave()
			Else
				;Re-enable Fast Travel.
				inputLayer.EnableFastTravel(True)
				inputLayer = None

				;Turn the control lever back on.
				MyControls.SetOn()
			EndIf

			;Open the doors.
			Self.PlayAnimationAndWait("Play01", "done")

			;We've finished moving.
			GoToState("Ready")
		ElseIf (!isMonorailLoadActive && !isInteriorMonorail)
			;Nuka-World Monorail, starting at the station.

			;Move the monorail into position in the station.
			if (Self.WaitFor3DLoad())
				Self.PlayAnimation("StartAtEnd01")
			Else
				Debug.Trace("ERROR: The 3D for " + Self + " didn't load.", 2)
			EndIf

			;If DLC04MQ01Gauntlet is complete, the controls should be on.
			if (DLC04MQ01Gauntlet.IsCompleted())
				MyControls.SetOn()
			Else
				MyControls.SetOff()
			EndIf
		ElseIf (isMonorailLoadActive && isInteriorMonorail)
			;Transit Center Monorail, starting in the tunnel.

			;We're moving. Switch to that state until we've finished.
			GoToState("Moving")

			;Move the monorail into position in the tunnel.
			if (Self.WaitFor3DLoad())
				Self.PlayAnimation("StartAtEnd01")
			Else
				Debug.Trace("ERROR: The 3D for " + Self + " didn't load.", 2)
			EndIf

			;Set the Controls to the Off state.
			MyControls.SetOff()

			;Move the player into position.
			Game.GetPlayer().MoveTo(MyPlayerWarpMarker)
			
			;Move the Companion to the holding cell.
			MoveCompanion()

			;Change the IMod to begin fading in from black.
			Game.FadeOutGame(False, True, 0, 1)
			StartTimer(2, TIMER_FadeIMod)

			if (ArrivalScene != None)
				ArrivalScene.Start()
			EndIf

			;Run the Monorail animation.
			Self.PlayAnimationAndWait("Play01", "done")

			;Set the Controls to the On state.
			MyControls.SetOn()

			;Move the companion to platform.
			ReleaseCompanion()

			;Open the doors.
			;Do NOT call the extra Play01 on this side.

			;We've finished moving.
			GoToState("Ready")
		ElseIf (!isMonorailLoadActive && isInteriorMonorail)
			;Transit Center Monorail, starting at the platform.

			;Move the monorail into position at the platform.
			if (Self.WaitFor3DLoad())
				Self.PlayAnimation("StartAtStart01")
			Else
				Debug.Trace("ERROR: The 3D for " + Self + " didn't load.", 2)
			EndIf

			;If the player still needs to restore the power for MQ00, shut the doors and turn off the controls. Otherwise, turn on the controls.
			if (DLC04MQ00.GetStageDone(500))
				MyControls.SetOn()
			Else
				Self.PlayAnimation("StartOff01")
				MyControls.SetOff()
			EndIf
		Else
			Debug.Trace("Received UpdateMonorailState, but state was " + isMonorailLoadActive + ", " + isInteriorMonorail + ", so doing nothing.")
		EndIf
	EndFunction

	;Called by the MonorailControls, when the player activates the Controls while they're in the On state.
	Function ControlLeverActivated()
		;We're starting to move.
		GoToState("Moving")

		;Turn off the Controls.
		MyControls.SetOff()

		;Set the global to indicate that we're going to be loading out.
		DLC04_MonorailLoadActive.SetValue(1)

		if (!isInteriorMonorail)
			;Nuka-World Monorail, heading back to the tunnel.

			;Disable fast travel until the animation has finished.
			if (inputLayer == None)
				inputLayer = InputEnableLayer.Create()
			EndIf
			inputLayer.EnableFastTravel(False)

			if (TransitionScene != None && TransitionScene.IsPlaying())
				TransitionScene.Stop()
			EndIf
			if (ArrivalScene != None && ArrivalScene.IsPlaying())
				ArrivalScene.Stop()
			EndIf
			if (DepartureScene != None)
				DepartureScene.Start()
			EndIf

			;Run the Monorail animation.
			;Instead of waiting for "Done" in this case, we wait for the fadeout to finish, then cut out early.
			Self.PlayAnimation("Play01")

			int failsafe = 0
			While (!loadoutFadeCompleted && failsafe < 200)
				failsafe = failsafe + 1
				Utility.Wait(1)
			EndWhile
			if (!loadoutFadeCompleted)
				Debug.Trace("ERROR: Monorail never finished its loadout fade!", 2)
			EndIf

			;Turn the control lever back on.
			MyControls.ReenableOnUnload(True)

			;Cancel any running scenes.
			if (DepartureScene != None)
				DepartureScene.Stop()
			EndIf

			;Once the animation has finished, activte the load door to trigger the load.
			;When the player loads in, control transfers to the Monorail script on the other monorail.
			MyLoadDoor.Activate(Game.GetPlayer())

			;Disable the running scene.
			if (DepartureScene != None)
				DepartureScene.Stop()
			EndIf

			;Re-enable Fast Travel.
			inputLayer.EnableFastTravel(True)
			inputLayer = None

			;We've finished moving.
			GoToState("Ready")
		Else
			;Transit Center monorail, heading out.

			if (TransitionScene != None && TransitionScene.IsPlaying())
				TransitionScene.Stop()
			EndIf
			if (ArrivalScene != None && ArrivalScene.IsPlaying())
				ArrivalScene.Stop()
			EndIf
			if (DepartureScene != None)
				DepartureScene.Start()
			EndIf

			;Run the Monorail animation.
			Self.PlayAnimationAndWait("Play01", "done")

			;Disable Random Encounters.
			;We have to disable these before loading into Nuka-World (since most REs trigger on load).
			;We re-enable them when the Monorail arrives at Nuka-Station. The player's controls are locked
			;until then.
			REEnabled.SetValue(0)

			;Turn the control lever back on.
			MyControls.ReenableOnUnload(True)

			;Disable the running scene.
			if (DepartureScene != None)
				DepartureScene.Stop()
			EndIf

			;Once the animation has finished, move the player to the starting point in the other cell.
			;This then prompts that Monorail to update its state.
			MyLoadDoor.Activate(Game.GetPlayer())

			;We've finished moving.
			GoToState("Ready")
		EndIf
	EndFunction
EndState

State Moving
	;Do nothing.
EndState

Function UpdateMonorailState()
	Debug.Trace("ERROR: UpdateMonorailState was called on " + Self + " while it was in state " + GetState(), 2)
EndFunction

Function ControlLeverActivated()
	Debug.Trace("ERROR: MyControlsActivated was called on " + Self + " while it was in state " + GetState(), 2)
EndFunction


;Handle the Nuka-Station arrival scene.
Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActionRef)
	if ((ArrivalScene != None) && (!DLC04MQ01_010_PAGageNukaExpress.IsPlaying() && ((TransitionScene == None) || (!TransitionScene.IsPlaying()))))
		ArrivalScene.Start()
	EndIf
	UnregisterForAllRemoteEvents()
EndEvent



Function LoadoutTriggerFadeFinished()
	loadoutFadeCompleted = True
EndFunction

;Power Up the Monorail after a brief delay.
Function PowerUpMonorailNoWait()
	StartTimer(2.5, TIMER_Powerup)
EndFunction

;Power up the Monorail.
Function PowerUpMonorail()
	;Re-enable Fast Travel.
	Debug.Trace("Got PowerUpMonorail")
	if (inputLayer != None)
		inputLayer.EnableFastTravel(True)
		inputLayer = None
	EndIf

	;Turn the controls on.
	MyControls.SetOn()

	if (isInteriorMonorail)
		Self.PlayAnimationAndWait("Play01", "done")
	EndIf
EndFunction

;Are we moving?
bool Function IsMoving()
	return GetState() == "Moving"
EndFunction

;Move the player's companion, if any, to the holding cell.
Function MoveCompanion()
	Actor a = Companion.GetActorRef()
	if ((a != None) && (!a.IsDead()))
		Debug.Trace("MONORAIL: Moving Companion to: " + MyCompanionWarpMarker)
		a.MoveTo(MyCompanionWarpMarker)
		a.SetLinkedRef(MyCompanionWarpMarker, DLC04Monorail_LinkCompanionOnMonorailTravelMarker)
		a.EvaluatePackage()
	EndIf
	a = DogmeatCompanion.GetActorRef()
	if ((a != None) && (!a.IsDead()))
		Debug.Trace("MONORAIL: Warping Dogmeat to: " + DLC04_MonorailHoldingCellMarker)
		a.MoveTo(DLC04_MonorailHoldingCellMarker)
	EndIf
EndFunction

Function ReleaseCompanion()
	Actor a = Companion.GetActorRef()
	if ((a != None) && (!a.IsDead()))
		a.SetLinkedRef(None, DLC04Monorail_LinkCompanionOnMonorailTravelMarker)
		a.EvaluatePackage()
		if (a.GetDistance(Game.GetPlayer()) > 5000)
			Debug.Trace("MONORAIL: Warping Companion to: " + MyPlatformWarpMarker)
			a.MoveTo(MyPlatformWarpMarker)
		EndIf
	EndIf
	a = DogmeatCompanion.GetActorRef()
	if ((a != None) && (!a.IsDead()))
		a.EvaluatePackage()
		Debug.Trace("MONORAIL: Warping Dogmeat to: " + MyPlatformWarpMarker)
		a.MoveTo(MyPlatformWarpMarker)
	EndIf
EndFunction

Event OnTimer(int timerID)
	if (timerID == TIMER_Powerup)
		PowerUpMonorail()
	ElseIf (timerID == TIMER_CompleteMQ00)
		DLC04MQ00.SetStage(520)
	ElseIf (timerID == TIMER_FadeIMod)
		MoveCompanion()
		;Fade in.
		HoldAtBlackImod.PopTo(FadefromBlackImod, 1.0)
		;Wait for the Imod to fade out.
		Utility.Wait(1)
		;Just for safety, be absolutely sure both Imods get removed. 
		HoldAtBlackImod.Remove()
		FadefromBlackImod.Remove()
	EndIf
EndEvent