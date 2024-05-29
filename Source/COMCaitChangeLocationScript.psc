Scriptname COMCaitChangeLocationScript extends ReferenceAlias

GlobalVariable Property COMCait_CZComment Auto Const
Location Property CombatZoneLocation Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if COMCait_CZComment.GetValue() == 0
		if akNewLoc != CombatZoneLocation
			COMCait_CZComment.SetValue(1)
		endif
	endif
EndEvent