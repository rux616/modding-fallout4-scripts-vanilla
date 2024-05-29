Scriptname DLC03:DLC03_V118_BloodClueScript extends ObjectReference Const

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory
int Property StageToSet1 = 10 Auto Const
int Property StageToSet2 = 12 Auto Const
int Property StageToCheck = 40 Auto Const


Event OnActivate(ObjectReference akActivator)
	DisableNoWait()
	if !DLC03_V118_ClueTracker.GetStageDone(StageToCheck)
		if !DLC03_V118_ClueTracker.GetStageDone(StageToSet1)
			DLC03_V118_ClueTracker.SetStage(StageToSet1)
		endif
	else
		if !DLC03_V118_ClueTracker.GetStageDone(StageToSet2)
			DLC03_V118_ClueTracker.SetStage(StageToSet2)
		endif
	endif
EndEvent