Scriptname DLC03:DLC03MQ06_WindFarmPlayerAliasScript extends ReferenceAlias Const

Location Property DLC03WindFarmBuildingInteriorLocation Auto Const Mandatory

Quest Property DLC03MQ06_PlayerExitWindFarm Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	;When player exits Wind Farm building, set appropriate stage
	if akOldLoc == DLC03WindFarmBuildingInteriorLocation && !DLC03MQ06_PlayerExitWindFarm.GetStageDone(100)
		DLC03MQ06_PlayerExitWindFarm.SetStage(100)
	endif
EndEvent 
