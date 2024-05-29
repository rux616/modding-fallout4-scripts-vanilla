Scriptname DN019_DisableFastTravelTrigger extends ObjectReference
{Disable Fast Travel while the player is in the office}

InputEnableLayer inputLayer

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		debug.trace(self + " TURN OFF FAST TRAVEL")
		inputLayer = InputEnableLayer.Create()
		inputLayer.EnableFastTravel(False)
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		debug.trace(self + " TURN ON FAST TRAVEL")
		inputLayer.EnableFastTravel(True)
		inputLayer = none
	EndIf
EndEvent

Event OnUnload()
	debug.trace(self + " OnUnload")
	; failsafe
    if inputLayer
		inputLayer.EnableFastTravel(True)
		inputLayer = none
	endif    	
	Disable()
EndEvent