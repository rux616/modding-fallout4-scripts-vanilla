Scriptname BoSPoliceStationChangeLocationScript extends ReferenceAlias

ReferenceAlias Property PASoldier Auto Const
ReferenceAlias Property FieldScribe Auto Const
Quest Property BoSScene_PoliceStation Auto Const
Location Property CambridgePDLocation Auto Const
int Property iPrereqStage Auto Const
int Property iStageToSet Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;debug.trace(self + "Change location event go!")
	if BoSScene_PoliceStation.GetStageDone(iPrereqStage)
		;debug.trace(self + "Prereq stage done.")
		if akNewLoc != CambridgePDLocation 
			;debug.trace(self + "Changed loc isn't Cambridge PD. New loc: " + akNewLoc)
			if !PASoldier.GetRef().Is3dLoaded() && !FieldScribe.GetRef().Is3dLoaded()
				;debug.trace(self + "Soldiers aren't 3D loaded. Shut this thang down.")
				BoSScene_PoliceStation.SetStage(iStageToSet)
			endif
		endif
	endif
EndEvent