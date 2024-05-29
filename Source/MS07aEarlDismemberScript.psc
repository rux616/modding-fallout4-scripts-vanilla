Scriptname MS07aEarlDismemberScript extends ReferenceAlias

ReferenceAlias Property pEarlBody Auto Const
Quest Property pMS07a Auto Const

EVENT OnLoad()
	if !pMS07a.GetStageDone(12)
		if pEarlBody.GetRef().Is3DLoaded()
	
			pEarlBody.GetActorRef().Dismember("Head1", false, true)
			pEarlBody.GetActorRef().Dismember("LeftArm1", false, true)
			pEarlBody.GetActorRef().Dismember("LeftLeg1", false, true)
			pEarlBody.GetActorRef().Dismember("RightLeg1", false, true)
			pMS07a.SetStage(12)
			
		else 

		endif
	endif
endEvent