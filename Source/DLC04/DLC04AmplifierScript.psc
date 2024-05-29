Scriptname DLC04:DLC04AmplifierScript extends ObjectReference const

Event OnLoad()
	debug.trace(self + " OnLoad")
	CheckRadioState()
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	CheckRadioState()
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn")
	CheckRadioState()
EndEvent

function CheckRadioState()
    if IsPowered() == false
		debug.trace(self + "CheckPowerState: unpowered - block activation")
	    BlockActivation(abBlocked = true, abHideActivateText = true)
	    SetRadioOn(false)
	else 
		debug.trace(self + "CheckPowerState: powered - allow activation")
	    BlockActivation(abBlocked = false, abHideActivateText = false)
	    if GetopenState() >= 3
	    	SetRadioOn(true)
	    else 
	    	SetRadioOn(false)
	    endif
    endif
endFunction
