Scriptname DN136_PrivateElevatorNEWScript extends ObjectReference Hidden conditional


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

	Sound Property ElevatorLoop Auto
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

EVENT OnLoad()
	ElevatorSetupFunction()
EndEvent

;EVENT OnUnload()
	;UnregisterForDistanceEvents(self, Game.GetPlayer())
;endEvent

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
	if CallButtonA
		RegisterForRemoteEvent(CallButtonA, "OnActivate")
	endif

	if OuterDoorA
		OuterDoorA.BlockActivation()
		if (!ignoreOuterDoorAActivation)
			RegisterForRemoteEvent(OuterDoorA, "OnActivate")
			RegisterForRemoteEvent(OuterDoorA, "OnOpen")
			RegisterForRemoteEvent(OuterDoorA, "OnClose")
		EndIf
	endif

	if CallButtonB
		RegisterForRemoteEvent(CallButtonB, "OnActivate")
	endif

	if OuterDoorB
		OuterDoorB.BlockActivation()
		if (!ignoreOuterDoorBActivation)
			RegisterForRemoteEvent(OuterDoorB, "OnActivate")
			RegisterForRemoteEvent(OuterDoorB, "OnOpen")
			RegisterForRemoteEvent(OuterDoorB, "OnClose")
		EndIf
	endif

	if !bHasAlreadyLoaded

		if !bStartDeactivated
			OuterdoorA.BlockActivation(TRUE)
			OuterdoorB.BlockActivation(TRUE)

		else
			CallButtonA.Playanimation("StartOff")
			CallButtonB.Playanimation("StartOff")
		endif

	    if bStartAtTop
			ObjectReference PlatformHelper = GetLinkedRef()

	    	PlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	PlatformHelper.SetAnimationVariableFloat("fvalue", 1)
	    	PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = TRUE
	    else
			ObjectReference PlatformHelper = GetLinkedRef()

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
	ObjectReference PlatFormHelper = GetLinkedRef()

	bStartDeactivated = FALSE
	CallButtonA.Playanimation("Play02")
	CallButtonB.Playanimation("Play02")

    bHasAlreadyLoaded = TRUE
    PlatFormHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)

EndFunction


Function MakeElevatorNonFunctional()

	ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
	ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
	ObjectReference PlatFormHelper = GetLinkedRef()

	bStartDeactivated = TRUE

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
	if akActionRef == Game.GetPlayer()
		GoToState("Busy")
		ObjectReference CallButtonA = GetLinkedRef(LinkCustom02)
		ObjectReference CallButtonB = GetLinkedRef(LinkCustom03)
		ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
		ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)
		ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom01)

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

				if akSender == ElevatorPanel
						; Panel activated, move elevator no matter where it is.
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove)
					;ElevatorPanel.PlayAnimation("play01")

					HandleElevatorDoor(OuterDoorA, 0)
					HandleElevatorDoor(OuterDoorB, 0)

					utility.Wait(0.5)
					MoveElevator(1)

				elseif (akSender == CallButtonA) || ((akSender == OuterDoorA) && (!bStartDeactivated))
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove / 2)
					;CallButtonA.PlayAnimation("play01")
					if bElevatorIsAtTop
						;Top call button activated, and elevator at top. Open doors.
						utility.Wait(0.5)
						;CallButtonA.PlayAnimation("play01")
						HandleElevatorDoor(OuterDoorA, 1)
						utility.Wait(utility.RandomFloat(0.1, 0.3))

						bBeingActivated = FALSE
						BlockAllButtons(FALSE)

					else
						;Top call button activated, and elevator at bottom. Move elevator.
						HandleElevatorDoor(OuterDoorA, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(OuterDoorB, 0)

						utility.Wait(0.5)
						MoveElevator(0)
						;CallButtonA.PlayAnimation("play01")
					endif

				elseif (akSender == CallButtonB) || ((akSender == OuterDoorB) && (!bStartDeactivated))
					GetLinkedRef().SetAnimationVariableFloat("fspeed", TimeTakenToMove / 2)
					;CallButtonB.PlayAnimation("play01")
					if !bElevatorIsAtTop
						;Bottom call button activated, and elevator at bottom. Open doors.
						utility.Wait(0.5)
						;CallButtonB.PlayAnimation("play01")
						HandleElevatorDoor(OuterDoorB, 1)	
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						bBeingActivated = FALSE
						BlockAllButtons(FALSE)
					else
						;Bottom call button activated, and elevator at top. Move elevator.
						HandleElevatorDoor(OuterDoorA, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(OuterDoorB, 0)

						utility.Wait(0.5)
						MoveElevator(0)
						;CallButtonB.PlayAnimation("play01")
					endif

				endif

			else
				;Do Nothing
			endif

		elseif bStartDeactivated
			DeactivatedMessage.Show()
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
			akDoor.SetOpen(FALSE)
		else
			; ...don't close the door, it's already closed.
		endif
	endif

EndFunction


Function MoveElevator(bool bActivatedFromPanel)
	;Function for moving the elevator, multiple if bElevatorIsAtTop statements present due to the timing of the elevator animations. Setting properties moved to another function for readability.

	ObjectReference OuterDoorA = GetLinkedRef(LinkCustom04)
	ObjectReference OuterDoorB = GetLinkedRef(LinkCustom05)
	ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom01)
	ObjectReference PlatFormHelper = GetLinkedRef()

	;Set my actor value (bottom floor) so that the scene conditions play the correct line.")
	bElevatorIsMoving = TRUE

	ElevatorLoopInstance = ElevatorLoop.play(game.GetPlayer())  
	Sound.SetInstanceVolume(ElevatorLoopInstance, 1)

	if bElevatorIsAtTop == True
		MoveElevatorFloorPlatHandler(bottomFloor, 0)
	else
		MoveElevatorFloorPlatHandler(UpperFloor, 1)
	endif

	PlatFormHelper.PlayAnimationAndWait("Play01", "done")
	Sound.StopInstance(ElevatorLoopInstance)
	utility.Wait(0.5)

	if bElevatorIsAtTop == FALSE
		MoveElevatorDoorHandler(DoorRef = OuterDoorB) 
	else 
		MoveElevatorDoorHandler(DoorRef = OuterDoorA) 
	endif

	utility.Wait(utility.RandomFloat(0.1, 0.3))

	utility.Wait(1.2)
	BlockAllButtons(FALSE)
	bBeingActivated = FALSE
	bElevatorIsMoving = FALSE
	GoToState("")


EndFunction


Function MoveElevatorFloorPlatHandler(int iFloor, int PlatformHelperAnimVar)

	ObjectReference PlatformHelper = GetLinkedRef()
    PlatFormHelper.SetAnimationVariableFloat("fvalue", PlatformHelperAnimVar)
   	bElevatorIsAtTop = PlatformHelperAnimVar

endFunction

Function MoveElevatorDoorHandler(ObjectReference DoorRef)

	HandleElevatorDoor(DoorRef, 1)
	HandleElevatorDoor(DoorRef, 1)

endFunction