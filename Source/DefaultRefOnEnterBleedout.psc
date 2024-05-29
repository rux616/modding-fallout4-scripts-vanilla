Scriptname DefaultRefOnEnterBleedout extends DefaultActor Const Default
{Default script used for checking if this actor has entered bleedout.}

Event OnEnterBleedout()
		DefaultScriptFunctions.DefaultScriptTrace(self + ": OnEnterBleedout() Called on DefaultRefOnEnterBleedout script.", ShowTraces)
		TryToSetStage()
EndEvent