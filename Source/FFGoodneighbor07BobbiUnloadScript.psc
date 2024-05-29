Scriptname FFGoodneighbor07BobbiUnloadScript extends ReferenceAlias

Location Property BobbisHideout Auto Const

Quest Property pQuest Auto Const

Int Property iLocationCount Auto

Int Property iChangesTilJump Auto

Int Property iQuestStage Auto Const

Int Property iTriggerStage01 Auto Const

Int Property iTriggerStage02 Auto Const

Bool Property bShutDownCount Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if !bShutDownCount

		if pQuest.GetStageDone(iTriggerStage01) || pQuest.GetStageDone(iTriggerStage02)

			if akNewLoc != BobbisHideout

				iLocationCount += 1
;				debug.messagebox("Increment Bobbi's hideout count")

			endif

;			debug.trace("Location Count is " + iLocationCount)

			if iLocationCount >= iChangesTilJump

				bShutDownCount = true
;				debug.messagebox("Time for Bobbi to disappear")
				pQuest.SetStage(iQuestStage)

			endif

		endif

	endif

EndEvent