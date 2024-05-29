Scriptname DLC03:ADV023TurnWindmillOffScript extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto	;Rotate Helper
Keyword Property LinkCustom02 const auto	;Sound Marker

Sound Property TurnOffSound const auto	;Sound to play when the windmill is turned off

Function StopWindmill()
	utility.Wait(0.1)
    GetLinkedRef(LinkCustom02).DisableNoWait()
    int instanceID = TurnOffSound.play(GetLinkedRef(LinkCustom01))
	Sound.SetInstanceVolume(instanceID, 1)
	Game.ShakeCamera(Game.GetPlayer(), 0.25, 1)
	Game.ShakeController(0.25, 0.25, 1)

    Utility.Wait(0.5)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 4)

    Utility.Wait(0.25)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 7)

    Utility.Wait(0.25)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 10)

    Utility.Wait(0.25)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 13)

    Utility.Wait(0.25)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 16)

    Utility.Wait(0.25)

    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fSpinDuration01", 50000)
EndFunction