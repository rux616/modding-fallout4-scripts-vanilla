Scriptname DefaultCollectionAliasOnLoad extends DefaultCollectionAlias Default

bool property setStageWhenAnyRefLoads = true auto const
{
 	FALSE = the stage to be set only when all refs in the collection load 
	TRUE (default) = stage is set when ANY ref loads 
} 

Event OnLoad(ObjectReference akSenderRef)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLoad() Called on DefaultAliasOnLoad script.", ShowTraces)
	TryToSetStage(TriggeredRef = akSenderRef, setStageOnSingleTrigger = setStageWhenAnyRefLoads)
EndEvent