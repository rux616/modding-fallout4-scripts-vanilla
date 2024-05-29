Scriptname DefaultAliasOnCellLoad extends DefaultAlias Const Default
{Default script used for checking when this cell this alias is in gets loaded}

Event OnCellLoad()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnCellLoad() Called on DefaultAliasOnCellLoad script.", ShowTraces)
		TryToSetStage()
EndEvent