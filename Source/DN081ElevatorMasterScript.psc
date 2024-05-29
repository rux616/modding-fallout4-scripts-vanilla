Scriptname DN081ElevatorMasterScript extends ObjectReference Hidden


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
EndGroup

Group No_Touchy CollapsedOnRef
	Keyword Property LinkCustom01 Auto
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

	; next block of properties are joel stuff.
	; search for "joel" to find other chunks relevant to this in case we need to strip it out.
	ActorValue Property elevatorDestinationFloor Auto Hidden
	scene property elevatorFloorAnnounceScene auto const
	Quest Property DNMasterQuest Auto Const
	ReferenceAlias Property elevatorAlias Auto Const
EndGroup



ObjectReference PlatformHelper
ObjectReference ElevatorPanel
ObjectReference ElevatorPanel02
ObjectReference CallButtonA
ObjectReference CallButtonB
ObjectReference OuterDoorA
ObjectReference OuterDoorB
ObjectReference InnerDoor
ObjectReference InnerMeter
ObjectReference OuterMeterA
ObjectReference OuterMeterB

Bool bElevatorIsMoving = FALSE
Bool bElevatorIsAtTop = FALSE
Bool bHasAlreadyLoaded = FALSE
Bool bBeingActivated = FALSE

int ElevatorLoopInstance

Event OnInit()

    PlatformHelper = GetLinkedRef()
    ElevatorPanel = GetLinkedRef(LinkCustom01)
    CallButtonA = GetLinkedRef(LinkCustom02)
    ElevatorPanel02 = GetLinkedRef(LinkCustom03)
    ;CallButtonB = GetLinkedRef(LinkCustom03)
    OuterDoorA = GetLinkedRef(LinkCustom04)
    OuterDoorB = GetLinkedRef(LinkCustom05)
    InnerDoor = GetLinkedRef(LinkCustom06)
    InnerMeter = GetLinkedRef(LinkCustom07)
    OuterMeterA = GetLinkedRef(LinkCustom08)
    OuterMeterB = GetLinkedRef(LinkCustom09)

	RegisterForRemoteEvent(ElevatorPanel, "OnActivate")
	RegisterForRemoteEvent(CallButtonA, "OnActivate")
	RegisterForRemoteEvent(ElevatorPanel02, "OnActivate")
EndEvent


Event OnLoad()


	if !bHasAlreadyLoaded
		if !bStartDeactivated
			InnerMeter.PlayAnimation("StartOn")
		else
			CallButtonA.Playanimation("StartOff")
			CallButtonB.Playanimation("StartOff")
		endif
		if GetLinkedRef(LinkCustom07).GetLinkedRef()
			if !bStartDeactivated
				GetLinkedRef(LinkCustom07).GetLinkedRef().PlayAnimation("StartOn")
			endif
		endif
	    if bStartAtTop
	    	if !bStartDeactivated
	    		OuterMeterA.PlayAnimation("StartOn")
	    	endif
	    	PlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	PlatformHelper.SetAnimationVariableFloat("fvalue", 1)
	    	PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = TRUE
	    else
	    	if !bStartDeactivated
	    		OuterMeterB.PlayAnimation("StartOn")
	    	endif
	    	PlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	PlatformHelper.SetAnimationVariableFloat("fvalue", 0)
	    	PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = FALSE
	    endif

	    bHasAlreadyLoaded = TRUE
	    PlatformHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)

	endif


EndEvent


Function MakeElevatorFunctional()
	bStartDeactivated = FALSE
	InnerMeter.PlayAnimation("StartOn")
	CallButtonA.Playanimation("Play02")
	CallButtonB.Playanimation("Play02")
	if GetLinkedRef(LinkCustom07).GetLinkedRef()
		GetLinkedRef(LinkCustom07).GetLinkedRef().PlayAnimation("StartOn")
	endif
    if bStartAtTop
    	OuterMeterA.PlayAnimation("StartOn")
    else
    	OuterMeterB.PlayAnimation("StartOn")
    endif

    bHasAlreadyLoaded = TRUE
    PlatformHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)

EndFunction


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if !bStartDeactivated
		if !bElevatorIsMoving && !bBeingActivated
			BlockAllButtons()
			bBeingActivated = TRUE
			; Begin joel stuff - force me into the alias!
			elevatorAlias.clear()
			elevatorAlias.forceRefTo(self)
			; here ends this chunk of joel stuff.
			if akSender == ElevatorPanel || ElevatorPanel02
					; Panel activated, move elevator no matter where it is.
				ElevatorPanel.PlayAnimation("play01")
				if GetLinkedRef(LinkCustom01).GetLinkedRef()
					GetLinkedRef(LinkCustom01).GetLinkedref().PlayAnimation("play01")
				endif
				HandleElevatorDoor(OuterDoorA, 0)
				HandleElevatorDoor(OuterDoorB, 0)
				HandleElevatorDoor(InnerDoor, 0)
				if GetLinkedRef(LinkCustom06).GetLinkedRef()
					HandleElevatorDoor(GetLinkedRef(LinkCustom06).GetLinkedRef(), 0)
				endif
				utility.Wait(0.5)
				MoveElevator(1)
			elseif akSender == CallButtonA
				CallButtonA.PlayAnimation("play01")
				if bElevatorIsAtTop
						; Top call button activated, and elevator at top. Open doors.
					;int DingInstanceID = ElevatorDing.play(InnerDoor)  
					;Sound.SetInstanceVolume(DingInstanceID, 1)
					utility.Wait(0.5)
					CallButtonA.PlayAnimation("play01")
					HandleElevatorDoor(OuterDoorA, 1)
					utility.Wait(utility.RandomFloat(0.1, 0.3))
					if !GetLinkedRef(LinkCustom06).GetLinkedRef()
						HandleElevatorDoor(InnerDoor, 1)
					else
						HandleElevatorDoor(GetLinkedRef(LinkCustom06).GetLinkedRef(), 1)
					endif
					bBeingActivated = FALSE
					BlockAllButtons(FALSE)
					else
						; Top call button activated, and elevator at bottom. Move elevator.
					HandleElevatorDoor(OuterDoorA, 0)
					utility.Wait(utility.RandomFloat(0.1, 0.3))
					HandleElevatorDoor(OuterDoorB, 0)
					HandleElevatorDoor(InnerDoor, 0)
					if GetLinkedRef(LinkCustom06).GetLinkedRef()
						HandleElevatorDoor(GetLinkedRef(LinkCustom06).GetLinkedRef(), 0)
					endif
					utility.Wait(0.5)
					MoveElevator(0)
					CallButtonA.PlayAnimation("play01")
				endif
			elseif akSender == CallButtonB
				CallButtonB.PlayAnimation("play01")
				if !bElevatorIsAtTop
						; Bottom call button activated, and elevator at bottom. Open doors.
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
						; Bottom call button activated, and elevator at top. Move elevator.
					HandleElevatorDoor(OuterDoorA, 0)
					utility.Wait(utility.RandomFloat(0.1, 0.3))
					HandleElevatorDoor(OuterDoorB, 0)
					HandleElevatorDoor(InnerDoor, 0)
					if GetLinkedRef(LinkCustom06).GetLinkedRef()
						HandleElevatorDoor(GetLinkedRef(LinkCustom06).GetLinkedRef(), 0)
					endif
					utility.Wait(0.5)
					MoveElevator(0)
					CallButtonB.PlayAnimation("play01")
				endif
			endif
		else
			;Do Nothing
		endif
	else
		DeactivatedMessage.Show()
	endif
EndEvent


Function BlockAllButtons(bool bShouldBlock = TRUE)
	if bShouldBlock
		ElevatorPanel.BlockActivation()
		if GetLinkedRef(LinkCustom01).GetLinkedRef()
			GetLinkedRef(LinkCustom01).GetLinkedref().BlockActivation()
		endif
		ElevatorPanel02.BlockActivation()
		if GetLinkedRef(LinkCustom03).GetLinkedRef()
			GetLinkedRef(LinkCustom03).GetLinkedref().BlockActivation()
		endif
		CallButtonA.BlockActivation()
		CallButtonB.BlockActivation()
	else
		ElevatorPanel.BlockActivation(FALSE)
		if GetLinkedRef(LinkCustom01).GetLinkedRef()
			GetLinkedRef(LinkCustom01).GetLinkedref().BlockActivation(FALSE)
		endif
		ElevatorPanel02.BlockActivation(FALSE)
		if GetLinkedRef(LinkCustom03).GetLinkedRef()
			GetLinkedRef(LinkCustom03).GetLinkedref().BlockActivation(FALSE)
		endif
		CallButtonA.BlockActivation(FALSE)
		CallButtonB.BlockActivation(FALSE)
	endif
EndFunction


Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen)
		; If we are supposed to try to open this door...
	if bOpen
			; ...and the door is closed...
		if akDoor.GetOpenState() >= 3
				; ...then open the door.
			int DoorSoundInstance = ElevatorDoorOpen.play(akDoor)  
			Sound.SetInstanceVolume(DoorSoundInstance, 1)
			akDoor.SetOpen()
		else
			; ...don't open the door, it's already opened.
		endif
	else
		; If we are supposed to close this door...
		if akDoor.GetOpenState() <= 2
			; ...and the dore is open...
			int DoorSoundInstance = ElevatorDoorClose.play(akDoor)  
			Sound.SetInstanceVolume(DoorSoundInstance, 1)
			akDoor.SetOpen(FALSE)
		else
			; ...don't close the door, it's already closed.
		endif
	endif
EndFunction


Function MoveElevator(bool bActivatedFromPanel)
	InnerMeter.PlayAnimation("Play01")
	if GetLinkedRef(LinkCustom07).GetLinkedRef()
		GetLinkedRef(LinkCustom07).GetLinkedRef().PlayAnimation("Play01")
	endif
	OuterMeterA.PlayAnimation("Play01")
	OuterMeterB.PlayAnimation("Play01")
	bElevatorIsMoving = TRUE
	if bElevatorIsAtTop
		;debug.trace("more Joel stuff.  Set my actor value (bottom floor) so that the scene conditions play the correct line.")
		setValue(elevatorDestinationFloor,bottomFloor)
		; end joel stuff
		ElevatorLoopInstance = ElevatorLoop.play(InnerDoor)  
		Sound.SetInstanceVolume(ElevatorLoopInstance, 1)
	    PlatformHelper.SetAnimationVariableFloat("fvalue", 0)
	    PlatformHelper.PlayAnimationAndWait("Play01", "done")
	    bElevatorIsAtTop = FALSE
	    Sound.StopInstance(ElevatorLoopInstance)
	    if bActivatedFromPanel
	    	ElevatorPanel.PlayAnimation("play01")
	    	if GetLinkedRef(LinkCustom01).GetLinkedRef()
				GetLinkedRef(LinkCustom01).GetLinkedref().PlayAnimation("play01")
			endif
	    endif
	    InnerMeter.PlayAnimation("Play02")
	    if GetLinkedRef(LinkCustom07).GetLinkedRef()
			GetLinkedRef(LinkCustom07).GetLinkedRef().PlayAnimation("Play02")
		endif
		OuterMeterB.PlayAnimation("Play02")
		OuterMeterA.PlayAnimation("Play01")
	    int DingInstanceID = ElevatorDing.play(InnerDoor)  
		Sound.SetInstanceVolume(DingInstanceID, 1)
		utility.Wait(0.5)
		; Joel stuff again - play the scene to announce floor we're arrived at!
		elevatorFloorAnnounceScene.start()
		; end of Joel stuff.
		HandleElevatorDoor(OuterDoorB, 1) 
		utility.Wait(utility.RandomFloat(0.1, 0.3))
		HandleElevatorDoor(InnerDoor, 1)
		utility.Wait(1.2)
		bBeingActivated = FALSE
		BlockAllButtons(FALSE)
	else
		; more Joel stuff.  Set my actor value so that the scene conditions play the correct line.
		setValue(elevatorDestinationFloor,UpperFloor)
		; end joel stuff
		ElevatorLoopInstance = ElevatorLoop.play(InnerDoor)  
		Sound.SetInstanceVolume(ElevatorLoopInstance, 1)
		PlatformHelper.SetAnimationVariableFloat("fvalue", 1)
	    PlatformHelper.PlayAnimationAndWait("Play01", "done")
	    bElevatorIsAtTop = TRUE
	    Sound.StopInstance(ElevatorLoopInstance)
	    if bActivatedFromPanel
	    	ElevatorPanel.PlayAnimation("play01")
	    	if GetLinkedRef(LinkCustom01).GetLinkedRef()
				GetLinkedRef(LinkCustom01).GetLinkedref().PlayAnimation("play01")
			endif
	    endif
	    InnerMeter.PlayAnimation("Play02")
	    if GetLinkedRef(LinkCustom07).GetLinkedRef()
			GetLinkedRef(LinkCustom07).GetLinkedRef().PlayAnimation("Play02")
		endif
		OuterMeterA.PlayAnimation("Play02")
		OuterMeterB.PlayAnimation("Play01")
	    int DingInstanceID = ElevatorDing.play(InnerDoor)  
		Sound.SetInstanceVolume(DingInstanceID, 1)
		utility.Wait(0.5)
		; Joel stuff again - play the scene to announce floor we're arrived at!
		elevatorFloorAnnounceScene.start()
		; end of Joel stuff.
		HandleElevatorDoor(OuterDoorA, 1)
		utility.Wait(utility.RandomFloat(0.1, 0.3))
		if !GetLinkedRef(LinkCustom06).GetLinkedRef()
			HandleElevatorDoor(InnerDoor, 1)
		else
			HandleElevatorDoor(GetLinkedRef(LinkCustom06).GetLinkedRef(), 1)
		endif
		utility.Wait(1.2)
		bBeingActivated = FALSE
		BlockAllButtons(FALSE)
	endif
	bElevatorIsMoving = FALSE

EndFunction