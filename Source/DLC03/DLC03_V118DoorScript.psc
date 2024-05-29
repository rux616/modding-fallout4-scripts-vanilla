Scriptname DLC03:DLC03_V118DoorScript extends ReferenceAlias

Quest Property DLC03_V118_ClueTracker Auto Const mandatory
Event OnActivate(objectReference akActivator)
	if !DLC03_V118_ClueTracker.GetStageDone(55) && GetReference().isLocked()
		DLC03_V118_ClueTracker.SetStage(55)
	endif
EndEvent