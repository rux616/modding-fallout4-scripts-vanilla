Scriptname DefaultAliasOnRead extends DefaultAlias Const Default
{Default script used for checking if an alias has been read.}

Event OnRead()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnRead() Called on DefaultAliasOnOnRead script.", ShowTraces)
		TryToSetStage()
EndEvent
