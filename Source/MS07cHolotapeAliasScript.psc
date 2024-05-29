Scriptname MS07cHolotapeAliasScript extends ReferenceAlias

Quest Property pMS07c Auto Const
Quest Property pMS07cTapes Auto Const
globalvariable property iTapesRecoveredGlobal auto
Int Property iStageToSet Auto Const
Int Property iObjectiveNumber = 20 Auto Const
Int iHolotapeThreshold = 10 Const
Int iCurrentTapeCount

;If the player picks up an MS07c holotape, log it in either MS07c or its companion
;quest MS07cTapes (if MS07c hasn't started yet)
Auto State WaitingForPlayer
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

		if akNewContainer == Game.GetPlayer()
			;Jump states to prevent double counting
			gotoState("hasbeentriggered")

			;Determine if MS07c has been accepted by player
			if pMS07c.GetStageDone(10)

				if !pMS07c.GetStageDone(iStageToSet)
					;If stage hasn't already been hit, set it, increment holotape counter, 
					;update global Holotape count
					pMS07c.SetStage(iStageToSet)
					(pMS07c as MS07cScript).iHolotapeCount += 1
					iCurrentTapeCount = (pMS07c as MS07cScript).iHolotapeCount
					iTapesRecoveredGlobal.setValue(iCurrentTapeCount)
					pMS07c.UpdateCurrentInstanceGlobal(iTapesRecoveredGlobal)
					
					;Update quest objectives
					if pMS07c.GetStageDone(10)
						
						pMS07c.setObjectiveDisplayed(iObjectiveNumber, abForce = true)
					
					endif

					if iCurrentTapeCount >= iHolotapeThreshold
						;if holotape count is above tape threshold, kick off completion stage
						if !pMS07c.SetStage(200)

							pMS07c.SetStage(200)

						endif

					endif

				endif

			else

				;if quest has not yet been accepted, complete this tape's stage on MS07cTapes
				;and increment counter
				pMS07cTapes.SetStage(iStageToSet)
				(pMS07cTapes as MS07cTapesScript).iMS07cT_HolotapesCount += 1

			endif

		endif

	EndEvent
EndState

State hasbeentriggered
	;do nothing
EndState