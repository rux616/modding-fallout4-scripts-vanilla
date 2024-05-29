Scriptname DN131_RETriggerManagerScript extends ObjectReference Hidden
{Script for the Vertibird RE Trigger in Boston Common. Enables itself after Swan is killed and it unloads.}

Quest property DN131 Auto Const Mandatory
int property PrereqStage Auto Const Mandatory

Auto State Ready
	Event OnUnload()
		EnableIfReady()
	EndEvent
EndState

State Done
	Event OnUnload()
		;Do nothing.
	EndEvent
EndState

bool Function EnableIfReady()
	;Debug.Trace("DN131_RETriggerManagerScript TESTING.")
	if (DN131.GetStageDone(PrereqStage))
		;Debug.Trace("DN131_RETriggerManagerScript ENABLED TRIGGER.")
		Self.EnableNoWait()
		GoToState("Done")
	EndIf
EndFunction