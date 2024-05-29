Scriptname DN116QuestScript extends Quest Hidden Conditional

Bool Property TargetUSAFOlivia Auto Conditional
Bool Property TargetSouthBostonCheckpoint Auto Conditional
Bool Property TargetSatelliteArray Auto Conditional
Bool Property TargetFortHagan Auto Conditional
Bool Property TargetFederalRationStockpile Auto Conditional


Function ClearTargets()
	TargetUSAFOlivia = FALSE
	TargetSouthBostonCheckpoint = FALSE
	TargetSatelliteArray = FALSE
	TargetFortHagan = FALSE
	TargetFederalRationStockpile = FALSE
EndFunction