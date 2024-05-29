Scriptname DLC04:DLC04RideActivatorScript extends ToggleButtonScript


GlobalVariable Property DLC04NukaWorldPowerOnGlobal Auto Const Mandatory


Event OnCellAttach()
	Debug.Trace(self + ": OnCellAttach")
    if DLC04NukaWorldPowerOnGlobal.GetValue() == 1
    	(self as ToggleButtonScript).SetActive(true)
    else
    	if startsActive
    		(self as ToggleButtonScript).SetActive(true)
    	else
    		(self as ToggleButtonScript).SetActive(false)
    	endif
    endif
EndEvent

State Inactive
	Event OnActivate(ObjectReference akActionRef)
		SetBusy(True)
		PlayAnimationAndWait(animationName, "End")
		ToggleButtonInactiveMessage.Show()
		SetBusy(False, False)
	EndEvent
EndState

Event OnLoad()
	;Block follower activation if desired.
	Self.SetNoFavorAllowed(playerActivationOnly)
	;Set initial state.
EndEvent