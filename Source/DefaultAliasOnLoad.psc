Scriptname DefaultAliasOnLoad extends DefaultAlias Const Default
{Default script used for checking when this alias loads into a cell, or when the cell loads around it.}

Event OnLoad()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLoad() Called on DefaultAliasOnLoad script.", ShowTraces)
		TryToSetStage()
EndEvent