Scriptname ElevatorMasterScript extends ObjectReference Hidden conditional


Group Required_Properties
	Bool Property bStartAtTop = TRUE Auto
	{If TRUE(DEFAULT) then this elevator is starting at the top.}

	Float Property TimeTakenToMove = 4.0 Auto
	{The time, in seconds, it takes for the elevator to move from point A to B.}
EndGroup

Group Optional_Properties
	int property bottomFloor = -99 Auto Const
	{Bottom floor number, which tells the announcer what to say when thish floor is reached (Default = -99, which just makes a garbled "BBBzzzttt Floor!")}

	int property upperFloor = -99 Auto Const
	{Top floor number, which tells the announcer what to say when thish floor is reached (Default = -99, which just makes a garbled "BBBzzzttt Floor!")}

	Bool Property bStartDeactivated = FALSE Auto
	{Whether this elevator starts "off" or not.  }

	Message Property DeactivatedMessage Auto
	{Message that shows up when any elevator button is pressed while it's deactivated.}

	Bool Property CloseInnerDoor = TRUE Auto
	{Inner door closes by default. Set this to FALSE to keep it from closing at all.}

	Bool Property ignoreOuterDoorAActivation = FALSE Auto
	{Activating elevator doors calls them by default. Set this to TRUE to ignore player activation of the upper door if it needs to be handled differently.}

	Bool Property ignoreOuterDoorBActivation = FALSE Auto
	{Activating elevator doors calls them by default. Set this to TRUE to ignore player activation of the lower door if it needs to be handled differently.}
EndGroup

Group No_Touchy CollapsedOnRef
	Keyword Property LinkCustom01 Auto ; This is the interior button panel.
	Keyword Property LinkCustom02 Auto
	Keyword Property LinkCustom03 Auto
	Keyword Property LinkCustom04 Auto
	Keyword Property LinkCustom05 Auto
	Keyword Property LinkCustom06 Auto
	Keyword Property LinkCustom07 Auto
	Keyword Property LinkCustom08 Auto
	Keyword Property LinkCustom09 Auto

	Sound Property ElevatorLoop Auto
	Sound Property ElevatorDing Auto
	Sound Property ElevatorDoorOpen Auto
	Sound Property ElevatorDoorClose Auto
	Sound Property ElevatorCallButtonClick Auto

	; next block of properties are joel stuff.
	; search for "joel" to find other chunks relevant to this in case we need to strip it out.
	ActorValue Property elevatorDestinationFloor Auto Hidden
	scene property elevatorFloorAnnounceScene auto const
	scene property elevatorGoingUpDownScene auto const
	Quest Property DNMasterQuest Auto Const
	ReferenceAlias Property elevatorAlias Auto Const
EndGroup

Bool bElevatorIsMoving = FALSE conditional
Bool bElevatorIsAtTop = FALSE conditional
Bool bHasAlreadyLoaded = FALSE
Bool bBeingActivated = FALSE
int ElevatorLoopInstance


STATE AlreadyLoaded
	EVENT OnLoad()
	    ;Do Nothing
	EndEvent
ENDSTATE

STATE Busy
	;do nothing
ENDSTATE

EVENT OnCellLoad()
	ElevatorSetupFunction()

EndEvent

EVENT OnUnload()
	UnregisterForDistanceEvents(self, Game.GetPlayer())

endEvent

Function ElevatorSetupFunction()

	ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
	ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
	ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
	ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)


	GoToState("AlreadyLoaded")
	RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnActivate")
	if GetLinkedRef(LinkCustom01).GetLinkedRef()
		RegisterForRemoteEvent(GetLinkedRef(LinkCustom01).GetLinkedRef(), "OnActivate")
	endif
	;debug.trace("Registering LinkCustom01")
	if CallButtonA
		RegisterForRemoteEvent(CallButtonA, "OnActivate")
	;debug.trace("Registering CallButtonA")
	endif

	if OuterDoorA
		OuterDoorA.BlockActivation()
		if (!ignoreOuterDoorAActivation)
			RegisterForRemoteEvent(OuterDoorA, "OnActivate")
			RegisterForRemoteEvent(OuterDoorA, "OnOpen")
			RegisterForRemoteEvent(OuterDoorA, "OnClose")
			debug.trace("Registering OuterDoorA")
		EndIf
	endif

	if CallButtonB
		RegisterForRemoteEvent(CallButtonB, "OnActivate")
	;debug.trace("Registering CallButtonB")
	endif

	if OuterDoorB
		OuterDoorB.BlockActivation()
		if (!ignoreOuterDoorBActivation)
			RegisterForRemoteEvent(OuterDoorB, "OnActivate")
			RegisterForRemoteEvent(OuterDoorB, "OnOpen")
			RegisterForRemoteEvent(OuterDoorB, "OnClose")
			debug.trace("Registering OuterDoorB")
		EndIf
	endif

	if !bHasAlreadyLoaded
		ObjectReference InnerDoor = GetLinkedRef(LinkCustom06)
		ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
		ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()

		if !bStartDeactivated
			if !InnerMeter.Is3DLoaded()
				InnerMeter.Waitfor3dLoad()

			endif
			InnerMeter.PlayAnimation("StartOn")
			if !CloseInnerDoor
				if !InnerDoor.Is3DLoaded()
					InnerDoor.Waitfor3dLoad()
				
				endif
				InnerDoor.SetOpen()
			endif

			OuterdoorA.BlockActivation(TRUE)
			OuterdoorB.BlockActivation(TRUE)

		else
			CallButtonA.Playanimation("StartOff")
			CallButtonB.Playanimation("StartOff")
		endif

		if InnerMeterLinkRef
			if !bStartDeactivated
				InnerMeterLinkRef.PlayAnimation("StartOn")
			endif
		endif

	    if bStartAtTop
			ObjectReference PlatformHelper = GetLinkedRef()

	    	if !bStartDeactivated
	    		GetLinkedRef(LinkCustom08).PlayAnimation("StartOn")
	    	endif

	    	PlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	PlatformHelper.SetAnimationVariableFloat("fvalue", 1)
	    	PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = TRUE
	    else
			ObjectReference PlatformHelper = GetLinkedRef()

	    	if !bStartDeactivated
	    		GetLinkedRef(LinkCustom09).PlayAnimation("StartOn")
	    	endif

			if !PlatformHelper.Is3DLoaded()
				PlatformHelper.Waitfor3dLoad()
				
			endif

	    	PlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	PlatformHelper.SetAnimationVariableFloat("fvalue", 0)
	    	PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = FALSE
	    endif

	    bHasAlreadyLoaded = TRUE
	endif

endFunction


Function MakeElevatorFunctional()

	ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
	ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
	ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)
	ObjectReference PlatFormHelper = GetLinkedRef()

	bStartDeactivated = FALSE
	InnerMeter.PlayAnimation("StartOn")
	CallButtonA.Playanimation("Play02")
	CallButtonB.Playanimation("Play02")

	if InnerMeterLinkRef
		InnerMeterLinkRef.PlayAnimation("StartOn")
	endif

    if bStartAtTop
    	OuterMeterA.PlayAnimation("StartOn")

    else
    	OuterMeterB.PlayAnimation("StartOn")

    endif

    bHasAlreadyLoaded = TRUE
    PlatFormHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)

EndFunction


Function MakeElevatorNonFunctional()

	ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
	ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
	ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)
	ObjectReference PlatFormHelper = GetLinkedRef()

	bStartDeactivated = TRUE
	InnerMeter.PlayAnimation("StartOff")
	CallButtonA.Playanimation("StartOff")
	CallButtonB.Playanimation("StartOff")

	if InnerMeterLinkRef
		InnerMeterLinkRef.PlayAnimation("StartOff")
	endif

    if bStartAtTop
    	OuterMeterA.PlayAnimation("StartOff")
    else
    	OuterMeterB.PlayAnimation("StartOff")
    endif

    bHasAlreadyLoaded = TRUE
    PlatFormHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)

EndFunction


Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
	ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)

	if akSender == OuterDoorA
		OuterDoorA.BlockActivation(TRUE,TRUE)
	endif

	if akSender == OuterDoorB
		OuterDoorB.BlockActivation(TRUE,TRUE)
	endif
EndEvent


Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
	ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)

	if akSender == OuterDoorA
		OuterDoorA.BlockActivation(TRUE,FALSE)
	endif

	if akSender == OuterDoorB
		OuterDoorB.BlockActivation(TRUE,FALSE)
	endif
EndEvent


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	debug.trace("Activated: " + akSender + " by: " + akActionRef)
	
	if akActionRef == Game.GetPlayer()
		GoToState("Busy")
		ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
		ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
		ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
		ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)
		ObjectReference InnerDoor = GetLinkedRef(LinkCustom06)
		ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom01)
		ObjectReference ElevatorPanelLinkRef = ElevatorPanel.GetLinkedRef()
		ObjectReference InnerDoorLinkRef = InnerDoor.GetLinkedRef()

		Bool bIgnoreDoorActivation = FALSE
	

		if (akSender == OuterDoorA) && (Math.ABS(OuterDoorA.GetHeadingAngle(game.getPlayer())) < 90)
			bIgnoreDoorActivation = TRUE
			OuterDoorA.SetOpen()
		endif

		if (akSender == OuterDoorB) && (Math.ABS(OuterDoorB.GetHeadingAngle(game.getPlayer())) < 90)
			bIgnoreDoorActivation = TRUE
			OuterDoorB.SetOpen()
		endif

		if !bStartDeactivated && !bIgnoreDoorActivation

			if !bElevatorIsMoving && !bBeingActivated
				BlockAllButtons()
				bBeingActivated = TRUE
				; Begin joel stuff - force my interior button panel into the alias!
				elevatorAlias.clear()
				elevatorAlias.forceRefTo(self)
				; here ends this chunk of joel stuff.

				if akSender == ElevatorPanel || akSender == ElevatorPanelLinkRef
						; Panel activated, move elevator no matter where it is.
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove)
					ElevatorPanel.PlayAnimation("play01")

					if ElevatorPanelLinkRef
						ElevatorPanelLinkRef.PlayAnimation("play01")
					endif

					HandleElevatorDoor(OuterDoorA, 0)
					HandleElevatorDoor(OuterDoorB, 0)
					HandleElevatorDoor(InnerDoor, 0)

					if InnerDoorLinkRef
						HandleElevatorDoor(InnerDoorLinkRef, 0)
					endif

					utility.Wait(0.5)
					MoveElevator(1)

				elseif (akSender == CallButtonA) || ((akSender == OuterDoorA) && (!bStartDeactivated))
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove / 2)
					CallButtonA.PlayAnimation("play01")
					int ElevatorCallButtonClickInstance = ElevatorCallButtonClick.play(CallButtonA)  
					Sound.SetInstanceVolume(ElevatorCallButtonClickInstance, 1)
					if bElevatorIsAtTop
						;Top call button activated, and elevator at top. Open doors.
						;int DingInstanceID = ElevatorDing.play(InnerDoor)  
						;Sound.SetInstanceVolume(DingInstanceID, 1)
						utility.Wait(0.5)
						CallButtonA.PlayAnimation("play01")
						HandleElevatorDoor(OuterDoorA, 1)
						utility.Wait(utility.RandomFloat(0.1, 0.3))

						if !InnerDoorLinkRef
							HandleElevatorDoor(InnerDoor, 1)
						else
							HandleElevatorDoor(InnerDoorLinkRef, 1)
						endif

						bBeingActivated = FALSE
						BlockAllButtons(FALSE)

					else
						;Top call button activated, and elevator at bottom. Move elevator.
						HandleElevatorDoor(OuterDoorA, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(OuterDoorB, 0)
						HandleElevatorDoor(InnerDoor, 0)

						if InnerDoorLinkRef
							HandleElevatorDoor(InnerDoorLinkRef, 0)
						endif

						utility.Wait(0.5)
						MoveElevator(0)
						CallButtonA.PlayAnimation("play01")
					endif

				elseif (akSender == CallButtonB) || ((akSender == OuterDoorB) && (!bStartDeactivated))
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove / 2)
					CallButtonB.PlayAnimation("play01")
					int ElevatorCallButtonClickInstance = ElevatorCallButtonClick.play(CallButtonB)  
					Sound.SetInstanceVolume(ElevatorCallButtonClickInstance, 1)
					if !bElevatorIsAtTop
						;Bottom call button activated, and elevator at bottom. Open doors.
						;int DingInstanceID = ElevatorDing.play(InnerDoor)  
						;Sound.SetInstanceVolume(DingInstanceID, 1)
						utility.Wait(0.5)
						CallButtonB.PlayAnimation("play01")
						HandleElevatorDoor(OuterDoorB, 1)	
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(InnerDoor, 1)
						bBeingActivated = FALSE
						BlockAllButtons(FALSE)
					else
						;Bottom call button activated, and elevator at top. Move elevator.
						HandleElevatorDoor(OuterDoorA, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(OuterDoorB, 0)
						HandleElevatorDoor(InnerDoor, 0)

						if InnerDoorLinkRef
							HandleElevatorDoor(InnerDoorLinkRef, 0)
						endif

						utility.Wait(0.5)
						MoveElevator(0)
						CallButtonB.PlayAnimation("play01")
					endif

				endif

			else
				;Do Nothing
			endif

		elseif bStartDeactivated

			DeactivatedMessage.Show()
			debug.trace(DeactivatedMessage)
			;debug.trace("Show deactivated message.")		
		endif

		if bIgnoreDoorActivation == TRUE
			bIgnoreDoorActivation = FALSE
		endif
	endif

EndEvent


Function BlockAllButtons(bool bShouldBlock = TRUE)

	ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom01)
	ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
	ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)

	if bShouldBlock
		ElevatorPanel.BlockActivation()

		if ElevatorPanel.GetLinkedRef()
			ElevatorPanel.GetLinkedref().BlockActivation()
		endif

		CallButtonA.BlockActivation()
		CallButtonB.BlockActivation()
	else
		ElevatorPanel.BlockActivation(FALSE)

		if ElevatorPanel.GetLinkedRef()
			ElevatorPanel.GetLinkedref().BlockActivation(FALSE)
		endif

		CallButtonA.BlockActivation(FALSE)
		CallButtonB.BlockActivation(FALSE)
	endif

EndFunction


Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen)

	ObjectReference InnerDoor = GetLinkedRef(LinkCustom06)
		; If we are supposed to try to open this door...
	if bOpen
		;...and the door is closed...
		if akDoor.GetOpenState() >= 3
				; ...then open the door.
			akDoor.SetOpen()
		else
			; ...don't open the door, it's already opened.
		endif
	else
		; If we are supposed to close this door...
		if akDoor.GetOpenState() <= 2
			; ...and the door is open...
			; If we are trying to close the inner door, and we aren't supposed to, then don't
			if (akDoor == InnerDoor) && !CloseInnerDoor
				;Do Nothing
			else
				akDoor.SetOpen(FALSE)
			endif
		else
			; ...don't close the door, it's already closed.
		endif
	endif

EndFunction


Function MoveElevator(bool bActivatedFromPanel)
	;Function for moving the elevator, multiple if bElevatorIsAtTop statements present due to the timing of the elevator animations. Setting properties moved to another function for readability.

	ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)
	ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
	ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)
	ObjectReference InnerDoor = GetLinkedRef(LinkCustom06)
	ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom01)
	ObjectReference ElevatorPanelLinkRef = ElevatorPanel.GetLinkedRef()
	ObjectReference PlatFormHelper = GetLinkedRef()

	;Set my actor value (bottom floor) so that the scene conditions play the correct line.")
	bElevatorIsMoving = TRUE

	InnerMeter.PlayAnimation("Play01")
	if InnerMeterLinkRef
		InnerMeterLinkRef.PlayAnimation("Play01")
	endif

	OuterMeterA.PlayAnimation("Play01")
	OuterMeterB.PlayAnimation("Play01")

	ElevatorLoopInstance = ElevatorLoop.play(InnerDoor)  
	Sound.SetInstanceVolume(ElevatorLoopInstance, 1)

	;Play the "Going Down/Up" Scene Line
	elevatorGoingUpDownScene.start()
	utility.wait(0.2)

	if bElevatorIsAtTop == True
		MoveElevatorFloorPlatHandler(bottomFloor, 0)
	else
		MoveElevatorFloorPlatHandler(UpperFloor, 1)
	endif

	PlatFormHelper.PlayAnimationAndWait("Play01", "done")
	Sound.StopInstance(ElevatorLoopInstance)

	if bActivatedFromPanel
	    ElevatorPanel.PlayAnimation("play01")

	    if ElevatorPanelLinkRef
			ElevatorPanelLinkRef.PlayAnimation("play01")
		endif

	endif

	InnerMeter.PlayAnimation("Play02")

	if InnerMeterLinkRef
		InnerMeterLinkRef.PlayAnimation("Play02")
	endif

	if bElevatorIsAtTop == FALSE
		MoveElevatorMeterHandler(Meter1 = OuterMeterA, Meter2 = OuterMeterB)
	else
		MoveElevatorMeterHandler(Meter1 = OuterMeterB, Meter2 = OuterMeterA)
	endif

	int DingInstanceID = ElevatorDing.play(InnerDoor)  
	Sound.SetInstanceVolume(DingInstanceID, 1)
	utility.Wait(0.5)

	;play the scene to announce floor we're arrived at!
	elevatorFloorAnnounceScene.start()

	if bElevatorIsAtTop == FALSE
		MoveElevatorDoorHandler(DoorRef = OuterDoorB) 
	else 
		MoveElevatorDoorHandler(DoorRef = OuterDoorA) 
	endif

	utility.Wait(utility.RandomFloat(0.1, 0.3))
	ObjectReference InnerDoorLinkRef = InnerDoor.GetLinkedRef()

	if bElevatorIsAtTop == FALSE
		MoveElevatorDoorHandler(DoorRef = InnerDoor)
	elseif !InnerDoorLinkRef
			MoveElevatorDoorHandler(DoorRef = InnerDoor)
		else
			MoveElevatorDoorHandler(DoorRef = InnerDoorLinkRef)
	endif

	utility.Wait(1.2)
	BlockAllButtons(FALSE)
	bBeingActivated = FALSE
	bElevatorIsMoving = FALSE
	GoToState("")


EndFunction


Function MoveElevatorFloorPlatHandler(int iFloor, int PlatformHelperAnimVar)

	setValue(elevatordestinationfloor, iFloor)
	ObjectReference PlatformHelper = GetLinkedRef()
    PlatFormHelper.SetAnimationVariableFloat("fvalue", PlatformHelperAnimVar)
   	bElevatorIsAtTop = PlatformHelperAnimVar

endFunction

Function MoveElevatorDoorHandler(ObjectReference DoorRef)

	HandleElevatorDoor(DoorRef, 1)
	HandleElevatorDoor(DoorRef, 1)

endFunction

Function MoveElevatorMeterHandler(ObjectReference Meter1, ObjectReference Meter2)

	Meter1.PlayAnimation("Play01")
	Meter2.PlayAnimation("Play02")

endFunction

