Scriptname BoS100TransmitterScript extends DefaultAlias Const Hidden
{Sets a stage when the player enters the outer radius of this radio transmitter.}

Event OnPipboyRadioDetection(bool abDetected)
	;Debug.Trace(self + ": OnPipboyRadioDetection() called on BoSM01TransmitterScript script.")
	TryToSetStage()
EndEvent
