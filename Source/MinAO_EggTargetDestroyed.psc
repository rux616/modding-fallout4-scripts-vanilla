Scriptname MinAO_EggTargetDestroyed extends DefaultAlias Default
{Default script used for checking if an alias has changed combat state, and optionally who it's target is.}

int Property DestructionStateToCheckFor = 1 Auto Const



Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	DefaultScriptFunctions.DefaultScriptTrace(self + "aiOldStage=" + aiOldStage + ", aiCurrentStage=" + aiCurrentStage, ShowTraces)
	if aiCurrentStage <= DestructionStateToCheckFor
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDestructionStageChanged() Called on DefaultOnDestructionStateChanged script.", ShowTraces)
		GetOwningQuest().SetStage(StageToSet)
	endif	
EndEvent
 