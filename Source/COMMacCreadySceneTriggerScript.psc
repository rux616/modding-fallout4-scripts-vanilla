Scriptname COMMacCreadySceneTriggerScript extends ObjectReference

Quest Property pCOMMacCready Auto
Int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			pCOMMacCready.SetStage(5)
			pTriggered = 1
		endif
	endif

endEvent