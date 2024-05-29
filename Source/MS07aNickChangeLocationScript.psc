Scriptname MS07aNickChangeLocationScript extends ReferenceAlias

Quest Property pQuest Auto Const

Location Property pLocationA Auto Const

int Property iStageToSetA Auto Const

int Property iPrereqStageA Auto Const

Location Property pLocationB Auto Const

int Property iStageToSetB Auto Const

int Property iPrereqStageB Auto Const

;Location Property pLocationC Auto Const

;int Property iStageToSetC Auto Const

;int Property iPrereqStageC Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	
	if akNewLoc == pLocationA

		if pQuest.GetStageDone(iPrereqStageA)

			if !pQuest.GetStageDone(iStageToSetA)

				pQuest.SetStage(iStageToSetA)

			endif

		endif

	elseif akNewLoc == pLocationB

		if pQuest.GetStageDone(iPrereqStageB)

			if !pQuest.GetStageDone(iStageToSetB)

				pQuest.SetStage(iStageToSetB)

			endif

		endif

;	elseif akNewLoc == pLocationC

;		if pQuest.GetStageDone(iPrereqStageC)

;			if !pQuest.GetStageDone(iStageToSetC)

;				pQuest.SetStage(iStageToSetC)

;			endif

;		endif
		
	endif

EndEvent