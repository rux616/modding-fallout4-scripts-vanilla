Scriptname RELCOnCombatStateChangedScript extends ReferenceAlias

int[] Property iBlockingStages Auto Const
Quest Property myQuest Auto Const
int Property iStageToSet Auto Const

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
debug.trace(self + "RELCCombatState Change: Current combat state: " + aeCombatState)

	if aeCombatState >= 1
		debug.trace("RELCCombatState Change: Actor entered combat")
		int i = 0
		int iStageCount = 0
		while i < iBlockingStages.Length
			debug.trace("RELCCombatState Change: Current blocking stage: " + iBlockingStages[i])
			;Check to see if the current blocking stage is unset
			if !myQuest.GetStageDone(iBlockingStages[i])
				iStageCount += 1
				debug.trace("RELCCombatState Change: Stage " + iBlockingStages[i] + " unset. Adding to count: " + iStageCount)

				;If all the blocking stages are unset, then this script can fire
				if iStageCount == iBlockingStages.Length
					debug.trace("RELCCombatState Change: Stage count met. Setting combat stage")
					myQuest.SetStage(iStageToSet)
				endif
			endif

			i += 1
		endwhile
	endif

endEvent