Scriptname V81AshesChangeLocation extends ReferenceAlias

Location Property ChestnutHillockReservoirLocation Auto Const
Quest Property V81_01 Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == ChestnutHillockReservoirLocation && V81_01.GetStageDone(1) == 1
		debug.trace(self + "Player changed location after Ashes has run off.")
		V81_01.SetStage(2)
	EndIf
EndEvent