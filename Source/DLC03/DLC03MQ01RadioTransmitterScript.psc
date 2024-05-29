Scriptname DLC03:DLC03MQ01RadioTransmitterScript extends ReferenceAlias

Auto State WaitingForTrigger
	Event OnPipboyRadioDetection(bool abDetected)
		gotostate("hasbeenTriggered	")
		Debug.Trace(self + ": OnPipboyRadioDetection() called on DLC03MQ01RadioTransmitterScript script.")
		GetOwningQuest().SetStage(10)
	EndEvent
EndState

State hasbeenTriggered
	;empty state
EndState