Scriptname DN084_GlassElevatorScript extends ObjectReference Hidden
{Script for the DN084 Glass Elevator system.}

;The glass elevators in Mass Fusion are a special case, as they incorporate features of both load and non-load elevators.
;Essentially, they move up (or down) within the interior (exterior) until they carry the player into an autoload. On the other side
;of the autoload, the player teleports in on a duplicate glass elevator when then starts moving, creating a 'continuous' elevator.
;
;There are actually four glass elevators: one pair for the interior, and one pair for the exterior. These pairs are needed
;for timing purposes: if the player leaves the interior with the elevator at the bottom of the shaft, this script may not have time to
;call the elevator's reset animation event before the elevator geometry unloads, which means the elevator may not be in position to 'catch'
;the player the next time they take the elevator down from the top again (or vice versa). By having duplicates, we can make sure there is
;absolutely always an elevator in place to handle the transition.

Group Fixed_Quest_Properties
	Quest property DN084 Auto Const Mandatory
	{DN084}

	DN084_OverridesQuestScript property DN084_Overrides Auto Const Mandatory
	{DN084 Descent Overrides quest. Handles packaging for Followers on the elevator.}

	GlobalVariable property DN084_ElevatorLoadActive Auto Const Mandatory
	{Are we loading between cells while on the elevator? 1=True, 0=False}

	ReferenceAlias property Companion Auto Const Mandatory
	{Player's Companion, from Followers quest.}

	ReferenceAlias property DogmeatCompanion Auto Const Mandatory
	{Dogmeat, from Followers quest.}

	ReferenceAlias	property QuestCompanion Auto Const Mandatory
	{The DN084 Quest Companion, if any.}
EndGroup

Group Fixed_Elevator_Properties
	;Standard elevator link keywords. All of these autofill.
	Keyword property LinkCustom01 Auto Const Mandatory ;Link to chain of actor movement markers.
	Keyword property LinkCustom02 Auto Const Mandatory ;Link to door.
	Keyword property LinkCustom03 Auto Const Mandatory ;Link to the alternate elevator.
	Keyword property LinkCustom04 Auto Const Mandatory ;Link to the elevator's call button.
	Keyword property LinkCustom05 Auto Const Mandatory ;Link to the elevator's ID Card Reader
	Keyword property LinkCustom06 Auto Const Mandatory ;Link to the elevator's load collision barrier.
	Keyword property LinkCustom07 Auto Const Mandatory ;Link to the elevator cage door at the top of the exterior elevator shaft.

	Scene property ElevatorFloorAnnounceScene Auto Const Mandatory
	{Scene on DNMasterQuest that announces the elevator floor.}

	Scene property ElevatorGoingUpDownScene Auto Const Mandatory
	{Scene on DNMasterQuest that announces going up/down.}

	ReferenceAlias property ElevatorAlias Auto Const Mandatory
	{Alias on DNMasterQuest, used for the floor announcement scene.}

	GlobalVariable property LoadElevatorDown Auto Const Mandatory
	{Global that determines whether the elevator says it's going up or down.}

	ActorValue property ElevatorDestinationFloor Auto Const Mandatory
	{AV representing the elevator's floor. Used by ElevatorFloorAnnounceScene.}

	Message property DN084_ElevatorOutOfPowerMessage Auto Const Mandatory
	{Elevator Out of Power message.}

	ObjectReference property DN084_ElevatorDisableFastTravelTriggerRef Auto Const Mandatory
	{Trigger that, if the player is inside it when it enables, disables fast travel. Used to block fast travel for exterior elevators going down.}

	ImagespaceModifier property HoldAtBlackImod Auto Const Mandatory
	{IMod: Holds at black indefinitely.}

	ImagespaceModifier property FadefromBlackImod Auto Const Mandatory
	{IMod: Fades down from black over 1s.}
EndGroup

Group Local_Properties
	bool property isElevator1 Auto Const
	{Is this the '1' elevator in each pair? Used to resolve failsafe situations where both elevators are active for some reason.}

	bool property isInteriorElevator Auto Const
	{Is this an interior elevator or an exterior elevator?}

	bool property isActiveElevator Auto
	{Is this the active elevator of its pair?}
	;For each pair of elevators, one elevator is active and the other inactive. These states flip on cell detach.
	;The active elevator one is the one that we're currently using (or will use next).

	bool property isImodTimerActive Auto Hidden
	{Is the Imod Fade Timer still active?}

	bool property isMidlevelQuickstart Auto Hidden
	{Is the DN084 Midlevel Quickstart currently running? This cheats some of the elevator behavior.}

	bool property isQuestDescent Auto Hidden
	{Is the elevator on its quest-specific descent to the midlevel or ground floor? Used as a package condition on DN084_Overrides.}

	ObjectReference property myCallButton Auto Hidden
	{Ref to this elevator's call button. Obtained via LinkCustom04.}

	IDCardReaderScript property myIDCardReader Auto Hidden
	{Ref to this elevator's card reader. Obtained via LinkCustom05.}
EndGroup

;Local refs.
bool hasInitialized				;Are we ready to initialize?
float elevatorAnimationStartTime	;Start timestamp of the elevator's current animation. Used by the call button to calculate how much time it should take the elevator to get back down.
bool isElevatorLoadActive		;Is this elevator making its entry trip (from the load to its destination?). Not *quite* the same as the global (DN084_ElevatorLoadActive), since that has to zero out early.
bool has3DLoadedSuccessfully = True			;Did the elevator's 3D load successfully?
bool hasOnAttachFinished = False				;Has the OnAttach event finished executing?
ObjectReference myDoor 						;Ref to the elevator's door. Obtained via LinkCustom02.
ObjectReference myCageDoor					;Ref to the cage door at the top of the exterior elevator shaft. Obtained via LinkCustom07. None for interior elevators.
ObjectReference myLoadCollisionBarrier			;Ref to a collision prim that blocks prevents the player from falling/flying into the autoload without the elevator. Obtained via LinkCustom06.
DN084_GlassElevatorScript myAlternateElevator	;Ref to this elevator's partner.
InputEnableLayer inputLayer 					;InputEnableLayer used by this elevator to disable fast travel. Created on initialization.

Event OnCellDetach()
	;Clear our variables.
	myDoor = None
	myCageDoor = None
	myCallButton = None
	myIDCardReader = None
	myLoadCollisionBarrier = None
	myAlternateElevator = None
	has3DLoadedSuccessfully = True
	hasOnAttachFinished = False
	elevatorAnimationStartTime = 0
	UnregisterForAllEvents()

	;For safety, when an elevator detaches, always make sure it isn't responsible for disabling Fast Travel.
	if (inputLayer != None)
		inputLayer.EnableFastTravel(True)
		inputLayer = None
	EndIf

	;Unregister for events that won't matter anymore.
	Self.UnregisterForAllEvents()
	
	;OnCellDetach, flip which elevator is active and which is inactive.
	if (Self.IsDisabled())
		;Inactive becomes active.
		Self.GoToState("Ready")
		Self.EnableNoWait()
		Self.isActiveElevator = True
	Else
		;Active becoems inactive.
		Self.DisableNoWait()
		Self.isActiveElevator = False
	EndIf
EndEvent

Event OnCellAttach()
	Debug.Trace("DN084 Elevators: OnCellAttach received.")

	float failsafe = 100
	While (!Self.GetParentCell().IsLoaded())
		Utility.Wait(0.1)
		failsafe = failsafe - 1
	EndWhile
	if (!Self.GetParentCell().IsLoaded())
		Debug.Trace("DN084 ELEVATOR ERROR: " + Self + " was waiting for cell load but timed out.")
	EndIf

	Debug.Trace("Initializing DN084 Elevator... " + Self + ", " + Self.GetLinkedRef(LinkCustom07))
	myDoor = Self.GetLinkedRef(LinkCustom02)
	myAlternateElevator = Self.GetLinkedRef(LinkCustom03) as DN084_GlassElevatorScript
	myCallButton = Self.GetLinkedRef(LinkCustom04)
	myIDCardReader = Self.GetLinkedRef(LinkCustom05) as IDCardReaderScript
	myLoadCollisionBarrier = Self.GetLinkedRef(LinkCustom06)
	myCageDoor = Self.GetLinkedRef(LinkCustom07)
	elevatorAnimationStartTime = 0
	Debug.Trace(self + " ID Card Reader is: " + myIDCardReader)
	RegisterForRemoteEvent(myCallButton, "OnActivate")

	;Check for failsafe issues.
	if ((myDoor == None) || (myAlternateElevator == None) || (myCallButton == None) || (myIDCardReader == None))
		Debug.Trace("DN084 ELEVATOR FAILSAFE: A variable was not initialized!", 2)
	EndIf
	if (isActiveElevator && myAlternateElevator.isActiveElevator && !isElevator1)
		;Failsafe case: Both elevators are somehow active. So we give 01 precedence.
		Debug.Trace("DN084 ELEVATOR FAILSAFE: Both elevators were active!", 2)
		Self.isActiveElevator = False
	EndIf
	if (!isActiveElevator && !myAlternateElevator.isActiveElevator && isElevator1)
		;Failsafe case: Both elevators are somehow inactive. So we give 01 precedence.
		Debug.Trace("DN084 ELEVATOR FAILSAFE: Both elevators were inactive!", 2)
		Self.isActiveElevator = True
	EndIf

	if (!isActiveElevator && myAlternateElevator.isActiveElevator)
		;Disable the elevator.
		Debug.Trace("DN084 Elevators: " + Self + " is inactive; disable it.")
		if (DN084_ElevatorLoadActive.GetValue() > 0)
			;A load is in progress, so don't do anything to disturb it.
			Self.DisableNoWait()
			Self.RegisterForAnimationEvent(myAlternateElevator, "done")
		Else
			ResetElevator()
		EndIf
	ElseIf (Self.GetState() == "Ready")
		;Don't do ANYTHING if the elevator is busy or disabled for Save/Load safety.
		;Make sure all of the elevator components are loaded before we continue.
		Self.WaitFor3DLoad()
		myDoor.WaitFor3DLoad()
		myCageDoor.WaitFor3DLoad()
		myCallButton.WaitFor3DLoad()
		myIDCardReader.WaitFor3DLoad()
		Debug.Trace("DN084 Elevators: " + Self + " waited for all objects to load.")

		;Enable the elevator.
		Debug.Trace("DN084 Elevators: " + Self + " is active; enable it.")
		Self.EnableNoWait()
		;Is this a load? Record the global's value, then clear it.
		isElevatorLoadActive = DN084_ElevatorLoadActive.GetValue() > 0
		DN084_ElevatorLoadActive.SetValue(0)
		;Wait for the elevator and card reader to finish loading so we can call animation events on them.
		has3DLoadedSuccessfully = Self.WaitFor3DLoad()
		has3DLoadedSuccessfully = has3DLoadedSuccessfully && myIDCardReader.WaitFor3DLoad()

		;Determine where to start the elevator.
		if (isElevatorLoadActive && !isInteriorElevator)
			;Exterior load, going up.
			Debug.Trace("DN084 Elevators: " + Self + " Exterior Load Active, going up.")
			GoToState("Busy")
			;Disable fast travel until the elevator releases the player.
			if (inputLayer == None)
				inputLayer = InputEnableLayer.Create()
			EndIf
			inputLayer.EnableFastTravel(False)
			;Close the cage door.
			myCageDoor.SetOpen(False)
			;This elevator should already be at its start position, but reset just in case.
			Self.PlayAnimation("StartDefault")
			;Make sure the doors are closed.
			Debug.Trace("DN084 SetOpenCheck: A")
			myDoor.SetOpen(False)
			;Set ID Card Reader to green (used, unactivatable).
			Debug.Trace("READER: " + myIDCardReader + " StartGreen")
			myIDCardReader.StartGreen()
			;Change the IMod to begin fading in from black.
			isImodTimerActive = True
			StartTimer(1, 1)
			StartTimer(4, 2)
			;Animate up.
			Self.SetAnimationVariableFloat("fspeed", 25)
			Self.PlayAnimationAndWait("ExtUp01", "done")
			;Announce arrival.
			ElevatorAlias.Clear()
			ElevatorAlias.ForceRefTo(myIDCardReader)
			myIDCardReader.SetValue(ElevatorDestinationFloor, -106)
			ElevatorFloorAnnounceScene.start()
			;Open the doors.
			Debug.Trace("DN084 SetOpenCheck: B")
			myDoor.SetOpen(True)
			Utility.Wait(0.25)
			myCageDoor.SetOpen(True)
			;Reset the ID Card Reader
			Debug.Trace("READER: " + myIDCardReader + " Reset")
			myIDCardReader.ResetIDCardReader()
			;Re-enable Fast Travel
			if (inputLayer != None)
				inputLayer.EnableFastTravel(True)
				inputLayer = None
			EndIf
			;Load complete.
			isElevatorLoadActive = False
			Debug.Trace("DN084 Elevators: " + Self + " Exterior Load completed.")
			GoToState("Ready")
		ElseIf (isElevatorLoadActive && isInteriorElevator)
			;Interior load, going down.
			Debug.Trace("DN084 Elevators: " + Self + " Interior Load Active, going down.")
			GoToState("Busy")
			;This elevator should already be at its start position, but reset just in case.
			;Self.PlayAnimation("StartDefault")
			Debug.Trace("DN084 SetOpenCheck: C")
			myDoor.SetOpen(False)
			;Set ID Card Reader to green.
			Debug.Trace("READER: " + myIDCardReader + " StartGreen")
			myIDCardReader.StartGreen()
			;Begin fading down from black.
			isImodTimerActive = True
			StartTimer(1, 1)
			StartTimer(4, 2)
			;Animate down.
			if (!DN084.GetStageDone(200) && !DN084.GetStageDone(360) && !DN084.GetStageDone(500))
				;Start the descent sequence.
				DN084.SetStage(200)
				DN084_Overrides.SetDescentSequenceOverride(True)
				Debug.Trace("Starting Descent")
				;Elevator descends to the midlevel.
				Self.SetAnimationVariableFloat("fspeed", 72)
				if (isMidlevelQuickstart)
					;If we're quickstarting to the midlevel, just snap the elevator there.
					Self.SetAnimationVariableFloat("fspeed", 1)
				EndIf
				Self.PlayAnimationAndWait("BattleDown01", "BattleDownDone01")
				;When we reach the midlevel, start the ambush.
				GoToState("Disabled")
				Debug.Trace("Starting Scene")
				DN084.SetStage(229)
				Utility.Wait(1)
				Debug.Trace("Opening Door")
				;Open the door.
				Debug.Trace("DN084 SetOpenCheck: D")
				myDoor.SetOpen(True)
				DN084_Overrides.SetDescentSequenceOverride(False)
				isQuestDescent = False
				;Set the call button to the Green lockdown state.
				myCallButton.GoToState("Green")
				;DON'T reset the ID Card Reader.
			Else
				;The elevator descends normally to the ground floor.
				Self.SetAnimationVariableFloat("fspeed", 45)
				Self.PlayAnimationAndWait("IntDown01", "done")
				;Announce arrival.
				ElevatorAlias.Clear()
				ElevatorAlias.ForceRefTo(myIDCardReader)
				myIDCardReader.SetValue(ElevatorDestinationFloor, 0)
				ElevatorFloorAnnounceScene.start()
				;When we reach the ground floor, open the door.
				Debug.Trace("DN084 SetOpenCheck: E")
				myDoor.SetOpen(True)
				;Reset ID Card Reader
				Debug.Trace("READER: " + myIDCardReader + " Reset")
				myIDCardReader.ResetIDCardReader()
				GoToState("Ready")
			EndIf
			;Load complete.
			isElevatorLoadActive = False
			Debug.Trace("DN084 Elevators: " + Self + " Interior Load completed.")
		ElseIf (isInteriorElevator)
			;Interior elevator. Not a load, so it generally starts at the bottom.
			;Decide whether the elevator needs to move.
			if (DN084.GetStageDone(260))
				;Stage 500 sets Stage 260 as part of its cleanup, so we don't need to check for that here.
				Debug.Trace("DN084 Elevators: " + Self + " Starting on Ground")
				Self.PlayAnimation("StartIntGroundLevel")
				Debug.Trace("DN084 SetOpenCheck: F")
				myDoor.SetOpen(True)
				Debug.Trace("READER: " + myIDCardReader + " Reset")
				myIDCardReader.ResetIDCardReader()
				isElevatorLoadActive = False
			Else
				;The elevator doesn't move to the ground floor pre-quest.
				Debug.Trace("DN084 Elevators: " + Self + " ignoring the player pre-quest.")
			EndIf
		Else ;(!isInteriorElevator)
			;Exterior elevator. Not a load, so it generally starts at the top.
			Debug.Trace("DN084 Elevators: " + Self + " Starting at Top")
			Self.PlayAnimation("StartExtUp01")
			Debug.Trace("DN084 Elevators: " + Self + " opening door in next line. " + myDoor + ", " + myCageDoor)
			Debug.Trace("DN084 SetOpenCheck: G")
			myDoor.SetOpen(True)
			myCageDoor.SetOpen(True)
			Debug.Trace("READER: " + myIDCardReader + " Reset")
			myIDCardReader.ResetIDCardReader()
			isElevatorLoadActive = False
		EndIf
	EndIf
	hasOnAttachFinished = True
EndEvent


Auto State Ready
	Event OnLoad()
		if (!has3DLoadedSuccessfully && hasOnAttachFinished)
			has3DLoadedSuccessfully = True
			ReadyElevator()
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		Debug.Trace("In OnActivate " + akActivator)
		Debug.Trace("MyCallButton Is " + myCallButton)
		if (akActivator == myIDCardReader)
			Debug.Trace("STATUS: " + Self.isActiveElevator + ", " + myAlternateElevator + ", " + myAlternateElevator.isActiveElevator)
			Debug.Trace("DN084 Elevators: " + Self + " Activated")
			GoToState("Busy")
			;Perform a failsafe check. If the other elevator is also active at this point (which should be impossible, but...),
			;quickly disable it to avoid any conflicts between the two.
			if (myAlternateElevator.isActiveElevator)
				;Failsafe case: Both elevators are somehow active. Quickly disable the other one.
				Debug.Trace("GLASS ELEVATOR FAILSAFE OnActivate: Both elevators were active!", 2)
				myAlternateElevator.isActiveElevator = False
				myAlternateElevator.ResetElevator()
				myAlternateElevator.DisableNoWait()
			EndIf
			if (isInteriorElevator)
				Debug.Trace("DN084 Elevators: " + Self + " activated in the Interior.")
				if (!DN084.GetStageDone(280))
					;If the descent sequence is running, and the elevator was stopped at the midlevel, resume from there.
					;Stage 500 sets this stage as part of its cleanup, so we don't need to test for that here.
					Debug.Trace("DN084 Elevators: " + Self + " resuming descent.")
					;Descent has resumed.

					DN084.SetStage(280)
					DN084_Overrides.SetDescentSequenceOverride(True)
					;Close doors.
					Debug.Trace("DN084 SetOpenCheck: H")
					myDoor.SetOpen(False)
					;Announce going down.
					ElevatorAlias.Clear()
					ElevatorAlias.ForceRefTo(myIDCardReader)
					LoadElevatorDown.SetValue(1)
					ElevatorGoingUpDownScene.Start()
					Utility.Wait(1.5)
					;Animate down.
					Self.SetAnimationVariableFloat("fspeed", 20)
					Self.PlayAnimationAndWait("BattleDown02", "done")
					;Announce arrival.
					ElevatorAlias.Clear()
					ElevatorAlias.ForceRefTo(myIDCardReader)
					myIDCardReader.SetValue(ElevatorDestinationFloor, 0)
					ElevatorFloorAnnounceScene.start()
					;Open the door.
					Debug.Trace("DN084 SetOpenCheck: I")
					myDoor.SetOpen(True)
					;Reset ID Card Reader
					myIDCardReader.ResetIDCardReader()
					GoToState("Ready")
					;Clear the Overrides.
					DN084_Overrides.SetDescentSequenceOverride(False)
					Debug.Trace("DN084 Elevators: " + Self + " finished moving.")
				Else
					;Otherwise, the player activated the elevator at the ground floor. Ascend into the autoload.
					Debug.Trace("DN084 Elevators: " + Self + " going up.")
					;Close doors.
					Debug.Trace("DN084 SetOpenCheck: J")
					myDoor.SetOpen(False)
					;Announce going up.
					ElevatorAlias.Clear()
					ElevatorAlias.ForceRefTo(myIDCardReader)
					LoadElevatorDown.SetValue(0)
					ElevatorGoingUpDownScene.Start()
					Utility.Wait(1.5)
					;We'll hit the autoload, so make sure the other elevator is ready to receive us.
					;-- Now set by DN084_GlassElevatorLoadoutScript
					;Remove the collision prim so we can push the player into the autoload.
					myLoadCollisionBarrier.DisableNoWait()
					;Record the animation start time for use by the call button.
					elevatorAnimationStartTime = Utility.GetCurrentRealTime()
					;Animate up.
					Self.SetAnimationVariableFloat("fspeed", 45)
					Self.PlayAnimationAndWait("IntUp01", "done")
					;...the player will hit the autoload, and the other elevator takes over.
				EndIf
			Else
				;The player activated the elevator in the exterior. Descend into the autoload.
				Debug.Trace("DN084 Elevators: " + Self + " going down.")
				;Close doors.
				myCageDoor.SetOpen(False)
				Utility.Wait(0.25)
				Debug.Trace("DN084 SetOpenCheck: K")
				myDoor.SetOpen(False)
				;Turn on the Disable Fast Travel Trigger, and start a timer to turn it back off.
				DN084_ElevatorDisableFastTravelTriggerRef.EnableNoWait()
				StartTimer(2, 3)
				;Announce going down.
				ElevatorAlias.Clear()
				ElevatorAlias.ForceRefTo(myIDCardReader)
				LoadElevatorDown.SetValue(1)
				ElevatorGoingUpDownScene.Start()
				Utility.Wait(1.5)
				;We'll hit the autoload, so make sure the other elevator is ready to receive us.
				;-- Now set by DN084_GlassElevatorLoadoutScript
				;Remove the collision prim so we can push the player into the autoload.
				myLoadCollisionBarrier.DisableNoWait()
				;Record the time for use by the call button.
				elevatorAnimationStartTime = Utility.GetCurrentRealTime()
				;Animate down.
				Self.SetAnimationVariableFloat("fspeed", 35)
				Self.PlayAnimationAndWait("ExtDown01", "done")
				;...the player will hit the autoload, and the other elevator takes over.
				if (inputLayer != None)
					inputLayer.EnableFastTravel(True)
					inputLayer = None
				EndIf
			EndIf
		ElseIf (akActivator == myCallButton)
			;If the player presses the call button while the elevator is in the Ready state, we shouldn't
			;have to do anything-- the elevator should already be in position with its doors open.
			;
			;However, we have some failsafes here for safety:
			Debug.Trace("DN084 Elevators: " + Self + " MyCallButton activated in Ready State, checking failsafes.")

			;Failsafe: Make absolutely sure the elevator is in position.
			if (isInteriorElevator)
				if (!DN084.GetStageDone(260))
					;Do nothing. The elevator is stuck at the top and unresponsive in this case.
					return
				Else
					if (!DN084.GetStageDone(280))
						;The elevator is still on the midlevel, so we have to animate it down.
						Activate(myIDCardReader)
						return
					Else
						;Otherwise, this is the 'normal' failsafe.
						Self.PlayAnimation("StartIntGroundLevel")
						elevatorAnimationStartTime = 0
					EndIf
				EndIf
			Else
				Self.PlayAnimation("StartExtUp01")
				elevatorAnimationStartTime = 0
			EndIf

			;Failsafe: Make absolutely sure the doors are open.
			if (myDoor.GetOpenState() != 1)
				myDoor.SetOpen(True)
			EndIf
			Utility.Wait(0.25)
			if (myCageDoor.GetOpenState() != 1)
				myCageDoor.SetOpen(True)
			EndIf
		EndIf
	EndEvent
EndState

;The elevator is currently moving.
State Busy
	Event OnActivate(ObjectReference akActivator)
		Debug.Trace("DN084 Elevators: " + Self + " in Call Button OnActivate")
		Debug.Trace("::" + akActivator + ", " + myCallButton + ", " + !isElevatorLoadActive + ", " + Self.GetState())
		;The elevators have a call button in case the player slips out of the doors before they close (etc.).
		;Call buttons only work if the elevator is moving (DN084_ElevatorLoadActive.GetValue()=1 as a proxy for this)
		;and isn't on its initial load into the cell (!isElevatorLoadActive).
		if ((akActivator == myCallButton) && (!isElevatorLoadActive) && (elevatorAnimationStartTime > 0))
			Debug.Trace("DN084 Elevators: " + Self + " has been called.")
			Self.GoToState("Called")
			;Re-enable the collision prim.
			myLoadCollisionBarrier.EnableNoWait()
			;Determine how long the call animation will be. Because the elevator animation is *long*, we cheat and shorten this a bit.
			float timeDifference = Utility.GetCurrentRealTime() - elevatorAnimationStartTime
			if (timeDifference < 10)
				Debug.Trace("DN084 Elevators: " + Self + " setting call time to " + timeDifference)
				Self.SetAnimationVariableFloat("fcallspeed", timeDifference * 0.75)
			Else
				Debug.Trace("DN084 Elevators: " + Self + " setting call time to 7.5")
				Self.SetAnimationVariableFloat("fcallspeed", 7.5)
			EndIf
			;Clear the animation start time.
			elevatorAnimationStartTime = 0
			;Play the elevator call animation.
			if (isInteriorElevator)
				Self.PlayAnimationAndWait("CallDown01", "done")
			Else
				Self.PlayAnimationAndWait("CallUp01", "CallButton01")
			EndIf
			;Announce arrival.
			ElevatorAlias.Clear()
			ElevatorAlias.ForceRefTo(myIDCardReader)
			if (isInteriorElevator)
				myIDCardReader.SetValue(ElevatorDestinationFloor, 0)
			Else
				myIDCardReader.SetValue(ElevatorDestinationFloor, -106)
			EndIf
			ElevatorFloorAnnounceScene.start()
			;Re-enable fast travel if it was disabled.
			DN084_ElevatorDisableFastTravelTriggerRef.Disable()
			if (inputLayer != None)
				inputLayer.EnableFastTravel(True)
				inputLayer = None
			EndIf
			;Open the door.
			Debug.Trace("DN084 SetOpenCheck: L")
			myDoor.SetOpen(True)
			Utility.Wait(0.25)
			myCageDoor.SetOpen(True)
			;Call complete.
			isElevatorLoadActive = False
			DN084_ElevatorLoadActive.SetValue(0)
			Debug.Trace("DN084 Elevators: " + Self + " Elevator Call completed.")
			GoToState("Ready")
			;Reset ID Card Reader
			myIDCardReader.ResetIDCardReader()
		EndIf
	EndEvent
EndState

;The player has pressed the elevator's call button.
State Called
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing
		Debug.Trace("DN084 Elevators: " + Self + " in Called State, ignoring.")
	EndEvent
EndState

;The elevator is out of power. Used during the descent sequence.
State Disabled
	Event OnActivate(ObjectReference akActivator)
		;Play Fail Anim/SFX
		DN084_ElevatorOutOfPowerMessage.Show()
		Debug.Trace("DN084 Elevators: " + Self + " disabled.")
	EndEvent
EndState

;Make sure the elevator is in position. Effectively presses the elevator call button via script.
Function ReadyElevator()
	Debug.Trace("DN084 Elevators: " + Self + " Try to ReadyElevator.")
	if (isActiveElevator && hasOnAttachFinished && (GetState() == "Ready"))
		Debug.Trace("DN084 Elevators: " + Self + " ReadyElevator succeeded.")
		Self.Activate(myCallButton)
	EndIf
EndFunction

;Arrange the player's followers in the elevator, keeping them back from the doors to give the player a little room.
;These moves occur while the screen is blacked out from the transition IMod, so the moves are safely hidden.
Function PositionElevatorActors()
	Actor a
	ObjectReference nextLink = Self.GetLinkedRef(LinkCustom01)
	Debug.Trace("DN084 Elevators: " + Self + " moving player to " + nextLink)
	;Game.GetPlayer().MoveTo(nextLink)
	nextLink = nextLink.GetLinkedRef(LinkCustom01)
	a = Companion.GetActorRef()
	Debug.Trace("DN084 Elevators: " + Self + " moving " + a + " to " + nextLink)
	if (a != None)
		a.MoveTo(nextLink)
		a.WaitFor3DLoad()
		a.MoveTo(nextLink)
	EndIf
	nextLink = nextLink.GetLinkedRef(LinkCustom01)
	a = DogmeatCompanion.GetActorRef()
	Debug.Trace("DN084 Elevators: " + Self + " moving " + a + " to " + nextLink)
	if (a != None)
		a.MoveTo(nextLink)
		a.WaitFor3DLoad()
		a.MoveTo(nextLink)
	EndIf
	nextLink = nextLink.GetLinkedRef(LinkCustom01)
	a = QuestCompanion.GetActorRef()
	Debug.Trace("DN084 Elevators: " + Self + " moving " + a + " to " + nextLink)
	if (a != None)
		a.MoveTo(nextLink)
		a.WaitFor3DLoad()
		a.MoveTo(nextLink)
	EndIf
EndFunction


;When the cell loads, if a load is in progress, the inactive elevator in each pair registers for the "done" event on its counterpart.
;Once the other elevator has finished moving, its partner catches the event and resets to its starting position then, since that's a safe moment
;where it won't be observed.
Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	Debug.Trace("DN084 Elevators: " + Self + " received an animation event.")
	if ((akSource == myAlternateElevator) && (asEventName == "done"))
		ResetElevator()
	EndIf
EndEvent


;Reset the inactive elevator to its starting position, to make sure it's ready next time the cell loads.
Function ResetElevator()
	Self.Enable()
	Self.PlayAnimationAndWait("StartDefault","done")
	Self.DisableNoWait()
	Debug.Trace("DN084 Elevators: " + Self + " was reset.")
EndFunction


;Disable fast travel as requested by DN084_ElevatorDisableFastTravelScript.
Function DisableFastTravel()
	if (inputLayer == None)
		inputLayer = InputEnableLayer.Create()
	EndIf
	inputLayer.EnableFastTravel(False)
EndFunction


Event OnTimer(int timerID)
	if (timerID == 1)
		;Arrange the player and companions while the screen is at black.
		PositionElevatorActors()
		StartTimer(0, 2)
	ElseIf (timerID == 2)
		if (isImodTimerActive == True)
			isImodTimerActive = False
			;Fade in.
			HoldAtBlackImod.PopTo(FadefromBlackImod, 1.0)
			;Wait for the Imod to fade out.
			Utility.Wait(1)
			;Just for safety, be absolutely sure both Imods get removed. 
			HoldAtBlackImod.Remove()
			FadefromBlackImod.Remove()
			Debug.Trace("Removed")
		EndIf
	ElseIf (timerID == 3)
		DN084_ElevatorDisableFastTravelTriggerRef.Disable()
	EndIf
EndEvent