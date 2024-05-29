Scriptname CIS_EnterNewLocation_CompanionScript extends ReferenceAlias

Scene Property SceneToStartOnLocationChange const auto

LocationAlias Property LocationToFillOnLocationChange const auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	debug.trace(self + "OnLocationChange() akNewLoc:" + akNewLoc)	

	if akNewLoc
		if akOldLoc == None || (akNewLoc.IsChild(akOldLoc) == false && akOldLoc.IsChild(akNewLoc) == false) 
		   	LocationToFillOnLocationChange.ForceLocationTo(akNewLoc)
			SceneToStartOnLocationChange.start()
		endif
	endif

EndEvent