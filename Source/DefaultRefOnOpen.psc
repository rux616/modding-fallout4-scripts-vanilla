Scriptname DefaultRefOnOpen extends DefaultRef Const Default
{Default script used for checking when this ref is opened.}

Event OnOpen(ObjectReference akActionRef)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnOpen() Called on DefaultRefOnOpen script.", ShowTraces)
	TryToSetStage()
EndEvent