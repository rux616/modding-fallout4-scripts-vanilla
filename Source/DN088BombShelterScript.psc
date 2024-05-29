Scriptname DN088BombShelterScript extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto
{Link to TrapDoor}
Keyword Property LinkCustom02 const auto
{Link to SwitchOn}
Keyword Property LinkCustom03 const auto
{Link to GeneratorSoundMarker}

Sound Property GeneratorSound const auto
{Sound to play when activating the generator, then a moment after enable the looping sound}

Message Property DN088BombShelterLockedMessage const auto
{Message that says the door is locked}

bool HasLoaded


Event OnLoad()
    ObjectReference TrapDoor = GetLinkedRef(LinkCustom01)
   	ObjectReference SwitchOn = GetLinkedRef(LinkCustom02)
    ObjectReference GeneratorSoundMarker = GetLinkedRef(LinkCustom03)

    if !HasLoaded
    	HasLoaded == TRUE
    	TrapDoor.BlockActivation(TRUE)
    endif

    RegisterForRemoteEvent(TrapDoor, "OnActivate")
    RegisterForRemoteEvent(SwitchOn, "OnActivate")
EndEvent


Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)

	ObjectReference TrapDoor = GetLinkedRef(LinkCustom01)
   	ObjectReference SwitchOn = GetLinkedRef(LinkCustom02)
    ObjectReference GeneratorSoundMarker = GetLinkedRef(LinkCustom03)

	if akSender == TrapDoor
		if TrapDoor.IsActivationBlocked()
			DN088BombShelterLockedMessage.Show()
		endif
	endif

	if akSender == SwitchOn
		TrapDoor.BlockActivation(FALSE)
		int GeneratorSoundInstance = GeneratorSound.Play(SwitchOn)
		Game.ShakeCamera(Game.GetPlayer(), 0.5, 1)
		utility.Wait(1.5)
		GeneratorSoundMarker.EnableNoWait()
	endif
		
EndEvent
