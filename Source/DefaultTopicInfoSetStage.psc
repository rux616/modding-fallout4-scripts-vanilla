Scriptname DefaultTopicInfoSetStage extends DefaultTopicInfo Const Default
{Default script for setting a different quest's stage from a topic info.}

Group Optional_Properties
	Bool Property SetStageOnEnd = TRUE Auto Const
	{If set to TRUE (DEFAULT), the stage will be set when he topic ends.
	If set to FALSE, the stage will be set when the topic begins.}
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if !SetStageOnEnd
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnBegin() Called on DefaultTopicInfoSetStage script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SetStageOnEnd
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnEnd() Called on DefaultTopicInfoSetStage script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent