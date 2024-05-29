Scriptname SpectacleIslandCircuitBreakerScript extends ObjectReference Const
{toggles global when power on/off}

GlobalVariable Property SpectacleIslandMirelurkSirenOn Auto Const Mandatory

Event OnLoad()
	UpdateSirenStatus()
EndEvent

Event OnPowerOff()
    UpdateSirenStatus()
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
    UpdateSirenStatus()
EndEvent

function UpdateSirenStatus()
	; make sure correct on load and on unload
	if IsPowered()
    	SpectacleIslandMirelurkSirenOn.SetValue(1.0)
    else
    	SpectacleIslandMirelurkSirenOn.SetValue(0.0)
    endif
endFunction