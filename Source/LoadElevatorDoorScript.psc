Scriptname LoadElevatorDoorScript extends ObjectReference


Group Required_Properties
{Properties that must be set}

	Int Property StartingFloor Auto Const
	{Floor that this specific door is on.}
	Int Property EndFloor Auto Const
	{Floor that this elevator will go to.}

EndGroup

Group Optional_Properties

	Bool Property PlayElevatorMusic = FALSE Auto Const
	{Whether this elevator should play music or not (Don't forget to set the opposite load door as well!)}

	Int Property FloorAudioOverride = -9999 Auto Const
	{The number for the actual audio line you want to be
 said from the "ElevatorFloorAnnounceScene" in DNMasterquest.
DEFAULT = -9999}

EndGroup

; next block of properties are joel stuff.
; search for "joel" to find other chunks relevant to this in case we need to strip it out.
;int property bottomFloor = -99 Auto Const
;int property upperFloor = -99 Auto Const



Group Advanced_Properties CollapsedOnRef
{Properties you probably shouldn't touch.}

	ReferenceAlias Property elevatorAlias Auto Const
	scene property elevatorFloorAnnounceScene auto const
	ActorValue Property elevatorDestinationFloor Auto Hidden

	GlobalVariable Property ElevatorMusicGlobal Auto Const

	Bool Property DoorIsInsideTransitionCell = FALSE Auto Const
	{Should almost always be FALSE, unless this
	is on a door that is IN the transition cell itself.}
	
	GlobalVariable Property LoadElevatorDown Auto Const
	{Global to check/set that tells this elevator
	which direction it should be going.}

	GlobalVariable Property LoadElevatorFloorCount Auto Const
	{Global to check/set that tells this elevator
	how many floors it should go.}

	Float Property DelayBeforeOpeningOuterDoor = 0.1 Auto Const
	{Time to wait to open outer door after inner door starts opening.}

	Bool Property ActivatedFromButton = FALSE Auto
	{Gets set if this door is activated from the call button, if so, it shouldn't say it's floor}

EndGroup


Event OnLoad()

	self.WaitFor3DLoad()
	elevatorAlias.clear()
	elevatorAlias.forceRefTo(self)
	if FloorAudioOverride == -9999
		setValue(elevatorDestinationFloor,StartingFloor)
	else
		setValue(elevatorDestinationFloor,FloorAudioOverride)
	endif

    OpenOuterDoor()

		; Register for activation on the Outer door.
	RegisterForRemoteEvent(GetLinkedRef(), "OnActivate")

	;GetLinkedRef().SetOpen(FALSE)
	
EndEvent

Event OnOpen(ObjectReference akActionRef)
    GetLinkedRef().SetOpen()
EndEvent

Event OnClose(ObjectReference akActionRef)
    GetLinkedRef().SetOpen(FALSE)
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef()
		if !GetLinkedRef().IsActivationBlocked()
			self.Activate(Game.GetPlayer())
			ActivatedFromButton = TRUE
		endif
	endif
EndEVENT

Event OnActivate(ObjectReference akActionRef)
	ObjectReference Player = Game.GetPlayer()
	if PlayElevatorMusic
		ElevatorMusicGlobal.SetValue(1)
	else
		ElevatorMusicGlobal.SetValue(0)
	endif
	;Debug.trace(akActionRef)
		; As long as we aren't a door inside the transition cell.
	if (!DoorIsInsideTransitionCell)
			; If this floor is higher than the end floor then...
	    if StartingFloor > EndFloor && akActionRef == Player
	    		; ...tell the elevator to go down, and by how many floors.
	    	;debug.trace("Setting LoadElevatorDown value to 1")
	    	LoadElevatorDown.SetValueInt(1)
	    	LoadElevatorFloorCount.SetValueInt(StartingFloor - EndFloor)
	    	debug.Trace(self + "Elevator is going DOWN " + LoadElevatorFloorCount.GetValueInt() + " floors.")
	    elseif StartingFloor < EndFloor && akActionRef == Player
	    		; ...tell the elevator to go up, and by how many floors.
	    	;debug.trace("Setting LoadElevatorDown value to 0")
	    	LoadElevatorDown.SetValueInt(0)
	    	LoadElevatorFloorCount.SetValueInt(EndFloor - StartingFloor)
	    	debug.Trace(self + "Elevator is going UP " + LoadElevatorFloorCount.GetValueInt() + " floors.")
	    endif
	endif

	if akActionRef != Game.GetPlayer()
		ActivatedFromButton = TRUE
	endif
	OpenOuterDoor()

EndEvent

Function OpenOuterDoor()

	if (GetLinkedRef())
		utility.wait(DelayBeforeOpeningOuterDoor)
	    if (self.GetOpenState() == 1) || (self.GetOpenState() == 2)
	    	GetLinkedRef().SetOpen()
	    	
	    	if ActivatedFromButton
	    		; Don't announce the floor
	    		ActivatedFromButton = FALSE

	    	else
	    		; Announce the floor
	    		elevatorFloorAnnounceScene.start()

	    	endif

	    elseif ((self.GetOpenState() == 3) || (self.GetOpenState() == 4)) && ActivatedFromButton
	    	GetLinkedRef().SetOpen(FALSE)

	    endif
	endif

EndFunction

Event OnUnload()
    GetLinkedRef().SetOpen(FALSE)
    self.SetOpen(FALSE)
EndEvent