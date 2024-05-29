Scriptname BoS302_DisableFastTravelTrigger extends ObjectReference Hidden

InputEnableLayer inputLayer 	;InputEnableLayer for this trigger.

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		inputLayer = InputEnableLayer.Create()
		inputLayer.EnableFastTravel(False)
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		inputLayer.EnableFastTravel(True)
		inputLayer = None
	EndIf
EndEvent

;patch 1.3 89109 - since the inputlayer isn't a property, I need to make a local function to turn it off from a remote script
Function RemoveInputLayer()
	If inputLayer
		inputLayer.EnableFastTravel(True)
		inputLayer = None
	EndIf
EndFunction

;patch 1.3 89109 - failsafe remove the input layer if the trigger unloads
Event OnUnload()
	RemoveInputLayer()
EndEvent