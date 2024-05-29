Scriptname DefaultRefOnLoad extends DefaultRef Const Default
{Default script used for checking when this reference loads into a cell, or when the cell loads around it.}

Event OnLoad()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLoad() Called on DefaultRefOnLoad script.", ShowTraces)
		TryToSetStage()
EndEvent