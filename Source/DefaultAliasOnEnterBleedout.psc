Scriptname DefaultAliasOnEnterBleedout extends DefaultAlias Const Default
{Default script used for checking if an alias has entered bleedout.}

Event OnEnterBleedout()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnEnterBleedout() Called on DefaultAliasONONEnterBleedout script.", ShowTraces)
		TryToSetStage()
EndEvent