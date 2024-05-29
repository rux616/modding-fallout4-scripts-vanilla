Scriptname DLC03:DLC03MQ06aPlayerAliasScript extends ReferenceAlias

Location Property DLC03NucleusMemoryBanksLocation Auto Const Mandatory

Location Property DLC03AcadiaLocation Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

Location Property DLC03_POI_40Interior_Location Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;If player has begun fight with Confessor but hasn't stashed body
	;and leaves Memory Banks, set appropriate stage	
	if akOldLoc == DLC03NucleusMemoryBanksLocation && DLC03MQ06a.GetStageDone(95) && !DLC03MQ06a.GetStageDone(250)
		DLC03MQ06a.SetStage(760)
	endif

	;If the player has entered Martin's refuge, reflash the objective
	if akNewLoc == DLC03_POI_40Interior_Location && !DLC03MQ06a.GetStageDone(12) && DLC03MQ06a.GetStageDone(10)
		DLC03MQ06a.SetStage(12)
	endif

	;When player enters or exits Acadia location, disable Cole
	if (akNewLoc == DLC03AcadiaLocation || akOldLoc == DLC03AcadiaLocation) && !DLC03MQ06a.GetStageDone(13) && DLC03MQ06a.GetStageDone(10)
		DLC03MQ06a.SetStage(13)
	endif
EndEvent