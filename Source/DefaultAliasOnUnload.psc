Scriptname DefaultAliasOnUnload extends DefaultAlias Const Default
{Default script used for checking when this alias moves to an unloaded cell.}

Event OnUnload()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnUnload() Called on DefaultAliasOnUnload script.", ShowTraces)
		TryToSetStage()
EndEvent