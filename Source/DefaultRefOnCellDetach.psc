Scriptname DefaultRefOnCellDetach extends DefaultRef Const Default
{Default script used for checking when this reference's cell detaches.}

Event OnCellDetach()
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnCellDetach() Called on DefaultRefOnCellDetach script.", ShowTraces)
	TryToSetStage()
EndEvent