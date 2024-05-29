Scriptname MS07cHolotapeScript extends ObjectReference

Quest Property pMS07c Auto Const
globalvariable property iTapesRecoveredGlobal auto
Int Property iStageToSet Auto Const
Int Property iObjectiveNumber Auto Const
Int iHolotapeThreshold = 10 Const
Int iCurrentTapeCount

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
;
;	if akNewContainer == Game.GetPlayer()
	;If player picks up holotape, increment Holotape counter
;
;		if !pMS07c.GetStageDone(iStageToSet)
;
;			pMS07c.SetStage(iStageToSet)
;			(pMS07c as MS07cScript).iHolotapeCount += 1
;			iCurrentTapeCount = (pMS07c as MS07cScript).iHolotapeCount
;			iTapesRecoveredGlobal.setValue(iCurrentTapeCount)
;			pMS07c.UpdateCurrentInstanceGlobal(iTapesRecoveredGlobal)
;			
;			if pMS07c.GetStageDone(10)
;				
;				pMS07c.setObjectiveDisplayed(iObjectiveNumber, abForce = true)
;			
;			endif
;
;			if iCurrentTapeCount >= iHolotapeThreshold
;
;				pMS07c.SetStage(200)
;
;			endif
;
;		endif
;
;	endif
;
;	if (akOldContainer == Game.GetPlayer())
	;Subtract from count if player drops holotape
;		
;		if iHolotapeCount == iHolotapeThreshold
;
;			pMS07c.SetStage(190)
;
;		endif
;
;		(pMS07c as MS07cScript).iHolotapeCount -= 1
;		iCurrentTapeCount = (pMS07c as MS07cScript).iHolotapeCount
;		iTapesRecoveredGlobal.setValue(iCurrentTapeCount)
;		pMS07c.UpdateCurrentInstanceGlobal(iTapesRecoveredGlobal)
;
;	endif

EndEvent