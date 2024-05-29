Scriptname DeaconUnloadScript extends Actor
{Script for making disappear when he's done watching}

Quest property qQuest auto const
Int property nStage auto const

Event OnUnload()
	if (qQuest.GetStageDone(nStage))
		Self.Disable()
	EndIf
EndEvent