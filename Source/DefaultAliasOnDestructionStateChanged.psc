Scriptname DefaultAliasOnDestructionStateChanged extends DefaultAlias Const Default
{Default script used for checking if an alias has changed combat state, and optionally who it's target is.}

Group Optional_Properties
	Int Property DestructionStateToCheckFor = 1 Auto Const
	{Set the stage when this destruction state is reached.}
EndGroup

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	DefaultScriptFunctions.DefaultScriptTrace(self + "aiOldStage=" + aiOldStage + ", aiCurrentStage=" + aiCurrentStage, ShowTraces)
	if aiCurrentStage <= DestructionStateToCheckFor
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDestructionStageChanged() Called on DefaultOnDestructionStateChanged script.", ShowTraces)
		TryToSetStage()
	endif	
EndEvent
 