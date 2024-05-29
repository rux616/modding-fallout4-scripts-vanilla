Scriptname MS07aCompanionSceneScript extends ReferenceAlias

;ReferenceAlias Property pPlayer Auto Const

Quest Property pQuest Auto Const

int Property iPrereqStage Auto Const

int Property iStageToSet Auto Const

Location Property pLocation Auto Const

;Use this to know when the companion has entered a specific location
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	
	if !pQuest.GetStageDone(iStageToSet)

		if pQuest.GetStageDone(iPrereqStage)

			if akOldLoc == pLocation

				pQuest.SetStage(iStageToSet)

			endif

		endif

	endif

EndEvent