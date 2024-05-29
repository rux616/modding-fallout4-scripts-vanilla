Scriptname DN084_DisableFastTravelTriggerScript extends ObjectReference Hidden
{Trigger on the roof of Mass Fusion. Disables fast travel while the player is on the roof during the first part of the quest.}

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

Function FastTravelFailsafe()
	inputLayer.EnableFastTravel(True)
	inputLayer = None
EndFunction