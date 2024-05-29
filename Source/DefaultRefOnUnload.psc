Scriptname DefaultRefOnUnload extends DefaultAlias Const Default
{Default script used for checking when this reference moves to an unloaded cell.}

Event OnUnload()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnUnload() Called on DefaultRefOnUnload script.", ShowTraces)
		TryToSetStage()
EndEvent