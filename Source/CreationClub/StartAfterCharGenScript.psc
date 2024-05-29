Scriptname CreationClub:StartAfterCharGenScript extends Quest

Int Property MyStageToSet Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory
Int Property CharGenStageToWatch = 10 Auto Const

Event OnInit()
	CheckStageToSet()
EndEvent

Event Quest.OnStageSet(quest akSendingQuest, int CharGenStage, int StageItem)
	CheckStageToSet()
EndEvent

Function CheckStageToSet()
	if MQ102.GetStageDone(ChargenStageToWatch) == true
		SetStage(MyStageToSet)
	else
		RegisterForRemoteEvent(MQ102, "OnStageSet")
	endif
EndFunction