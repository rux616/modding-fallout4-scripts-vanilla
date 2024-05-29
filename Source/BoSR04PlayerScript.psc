Scriptname BoSR04PlayerScript extends ReferenceAlias

Quest Property BoSR04 Auto Const
Location Property PrydwenLocation Auto Const
Alias Property BoSR04Scribe Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == PrydwenLocation && BoSR04.GetStageDone(60) == 1
		BoSR04.SetStage(65)
	EndIf
EndEvent