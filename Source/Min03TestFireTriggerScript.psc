Scriptname Min03TestFireTriggerScript extends ObjectReference

Form property ArtillerySmokeFlareSmoke auto
Quest property Min03 auto
Group Stages
	int property StageToSet auto
	int property PrereqStage = -1 auto
	int property TurnOffStage = -1 auto
endGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef.getBaseObject() == ArtillerySmokeFlareSmoke
		if Min03.GetStageDone(StageToSet)
			;debug.Trace("DefaultScriptFunctions: TryToSetStage() Stage Already Set, returning early")
			disable()
			RETURN
		else
			if (PrereqStage > -1 && Min03.GetStagedone(PrereqStage) == FALSE)
				;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Prereq stage not set - do nothing")
			elseif (TurnOffStage > -1 && Min03.GetStage() >= TurnOffStage)
				;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Current stage >= TurnOffStage - do nothing")
			elseif (Min03 as Min03Script).bReadyToFireArtillery
				Min03.SetStage(StagetoSet)
				disable()
			endif
		endif
	endif
endEvent