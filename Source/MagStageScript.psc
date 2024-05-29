Scriptname MagStageScript extends ObjectReference Const

Int Property StageToSet = -1 Auto Const
Quest Property PerksQuest Auto Const

Event OnRead()
	if PerksQuest.GetStageDone(StageToSet) == false
		PerksQuest.SetStage(StageToSet)
	endif
EndEvent

