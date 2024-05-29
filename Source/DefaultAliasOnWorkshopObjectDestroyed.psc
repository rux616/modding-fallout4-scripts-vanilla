Scriptname DefaultAliasOnWorkshopObjectDestroyed extends DefaultAlias Const Default
{Default script used for checking if an alias has been destroyed by workshop menu}

Event OnWorkshopObjectDestroyed (ObjectReference akActionRef)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnWorkshopObjectDestroyed() Called on DefaultAliasOnWorkshopObjectDestroyed script.", ShowTraces)
	TryToSetStage()
EndEvent
 