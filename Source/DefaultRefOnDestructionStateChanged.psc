Scriptname DefaultRefOnDestructionStateChanged extends DefaultRef Const Default
{Default script used for checking if an reference has changed combat state, and optionally who it's target is.}

Group Optional_Properties
	Int Property DestructionStateToCheckFor = 1 Auto Const
	{Set the stage when this destruction state is reached.}
EndGroup

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	debug.trace(self + "aiOldStage=" + aiOldStage + ", aiCurrentStage=" + aiCurrentStage)
	if aiCurrentStage <= DestructionStateToCheckFor
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDestructionStageChanged() Called on DefaultOnDestructionStateChanged script.", ShowTraces)
		TryToSetStage()
	endif	
EndEvent
 