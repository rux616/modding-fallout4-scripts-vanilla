Scriptname DN130_CambridgePDUnloadCheck extends ObjectReference Hidden
{Script on DN130_LoadUnloadMarker. If the player has been kicked out of the Brotherhood, when this unloads, update DN130.}

Quest property DN130 auto const
{DN130, the Cambridge PD quest.}

Location property CambridgePDLocation auto const
{The Cambridge PD Location.}

Auto State Waiting
	Event OnUnload()
		Debug.Trace("DN130_CambridgePDUnloadCheck")
		if ((DN130.GetStageDone(11) || DN130.GetStageDone(13)) && (Game.GetPlayer().GetCurrentLocation() != CambridgePDLocation))
			Debug.Trace("DN130_CambridgePDUnloadCheck Passed")
			GoToState("Done")
			DN130.SetStage(12)
		EndIf
	EndEvent
EndState

State Done
	Event OnUnload()
		;Do nothing.
	EndEvent
EndState