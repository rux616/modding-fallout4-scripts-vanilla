Scriptname DefaultRefOnRead extends DefaultRef Const Default
{Default script used for checking if this reference has been read.}

Event OnRead()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnRead() Called on DefaultRefOnRead script.", ShowTraces)
		TryToSetStage()
EndEvent
