Scriptname FFGoodneighbor07HancockLocationChange extends ReferenceAlias

Quest Property FFGoodneighbor07 Auto Const

Int Property iStagetoSet Auto Const

Location Property GoodneighborLocation Auto Const

Int Property iThresholdStage Auto Const


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if FFGoodneighbor07.GetStageDone(iStagetoSet)

		

	endif

EndEvent