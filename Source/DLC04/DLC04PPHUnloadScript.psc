Scriptname DLC04:DLC04PPHUnloadScript extends ReferenceAlias

Quest Property DLC04ParkPopulationHandler Auto Const Mandatory

Event OnUnload()
		debug.Trace(self + ": OnUnload() Called on DLC04PPHUnloadScript script.")
		DLC04ParkPopulationHandler.SetStage(10)
EndEvent