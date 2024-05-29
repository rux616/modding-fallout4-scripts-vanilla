Scriptname MS01FridgeDoorScript extends ReferenceAlias

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if aiCurrentStage > 0 && aiOldStage == 0 
		MS01.SetStage(100)
	endif
EndEvent

Quest Property MS01 Auto Const
