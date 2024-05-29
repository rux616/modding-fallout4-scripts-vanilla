Scriptname BoSR03PlayerScript extends ReferenceAlias

Quest Property BoSR03 Auto Const
Location Property PrydwenLocation Auto Const
Alias Property BoSR03Squire Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == PrydwenLocation && BoSR03.GetStageDone(40) == 1
		BoSR03.SetStage(45)
	EndIf
EndEvent