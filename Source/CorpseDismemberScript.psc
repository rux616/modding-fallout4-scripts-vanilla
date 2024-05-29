Scriptname CorpseDismemberScript extends ReferenceAlias

ReferenceAlias Property pCorpse Auto Const
Quest Property pQuest Auto Const
int Property iStageToSet Auto Const

EVENT OnLoad()
	if !pQuest.GetStageDone(iStageToSet)
		pCorpse.GetActorRef().KillSilent()		
		if pCorpse.GetRef().Is3DLoaded()
			pCorpse.GetActorRef().Dismember("Head1", false, true)
			pCorpse.GetActorRef().Dismember("LeftArm1", false, true)
			pCorpse.GetActorRef().Dismember("RightArm1", false, true)
			pCorpse.GetActorRef().Dismember("LeftLeg1", false, true)
			pCorpse.GetActorRef().Dismember("RightLeg1", false, true)
			pQuest.SetStage(iStageToSet)
			
		else 

		endif
	endif
endEvent
