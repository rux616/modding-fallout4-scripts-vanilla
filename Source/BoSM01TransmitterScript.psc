Scriptname BoSM01TransmitterScript extends DefaultAlias Const Hidden
{Script on the BoSM01 Distress Pulser Trransmitter Aliases. Sets a stage when the player first enters their range, and calls BoSM01 to update its objectives as appropriate.}

Group BoSM01_Properties
	BoSM01QuestScript property BoSM01 Auto Const Mandatory
	{BoSM01}
EndGroup

Event OnPipboyRadioDetection(bool abDetected)
	;Debug.Trace(self + ": OnPipboyRadioDetection() called on BoSM01TransmitterScript.")
	;Set the stage associated with this transmitter.
	TryToSetStage()

	;If the player is still in the first phase of the quest, make sure we're updating the pulser objectives.
	if (!BoSM01.GetStageDone(90))
		BoSM01.UpdatePulserObjectives()
	EndIf
EndEvent