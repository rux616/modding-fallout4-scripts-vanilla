Scriptname DefaultRefOnCellLoad extends DefaultRef Const Default
{Default script used for checking when this cell this reference is in gets loaded.}

Event OnCellLoad()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnCellLoad() Called on DefaultRefOnCellLoad script.", ShowTraces)
		TryToSetStage()
EndEvent