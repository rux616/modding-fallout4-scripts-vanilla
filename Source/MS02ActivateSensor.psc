ScriptName MS02ActivateSensor extends ObjectReference

Quest Property MS02 auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if MS02.GetStageDone(410)
			MS02.SetStage(500)
		endif	
	endif	
endEvent