Scriptname MQ106_DisableFastTravelScript extends ObjectReference Hidden
{Disable Fast Travel while the player is on the roof of Fort Hagen. And also set weather to clear}

Quest property myQuest auto mandatory const
Int property myStage auto mandatory const

bool DoOnce
InputEnableLayer inputLayer

Event OnTriggerEnter(ObjectReference akActivator)
	;debug.notification("entered Trigger")
	if (akActivator == Game.GetPlayer())
		;if(myQuest.getStageDone(myStage) == False)
		inputLayer = InputEnableLayer.Create()
		inputLayer.EnableFastTravel(False)
		;else
		;	inputLayer.EnableFastTravel(True)
			;debug.notification("deleted from trigger enter")
		;	delete()
		;EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	;debug.notification("left Trigger")
	if (akActivator == Game.GetPlayer())
		inputLayer.EnableFastTravel(True)
		inputLayer = none
		if (myQuest.getStageDone(myStage) == True)
			;debug.notification("deleted")
			delete()
		EndIf
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