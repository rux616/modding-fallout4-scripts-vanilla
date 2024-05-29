Scriptname DefaultCollectionAliasOnDeath extends DefaultCollectionAlias Default

bool property setStageWhenAnyRefDies = false auto const
{
 	FALSE (default) = stage is set only when all refs in the collection die 
	TRUE = stage is set when ANY ref dies 
} 

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnDeath() Called on DefaultCollectionAliasOnDeath script.", ShowTraces)
	TryToSetStage(TriggeredRef = akSenderRef, setStageOnSingleTrigger = setStageWhenAnyRefDies)
EndEvent