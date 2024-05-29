Scriptname TutorialCompanionScript extends ReferenceAlias

Quest Property Tutorial Auto Const
Int Property iStageToSet Auto Const

Event OnCommandModeEnter()
	if !Tutorial.GetStageDone(609) && !self.GetActorRef().IsBleedingOut()
		Tutorial.SetStage(609)
	endif
endEvent

Event OnEnterBleedout()
	if !Tutorial.GetStageDone(iStageToSet)
		Tutorial.SetStage(iStageToSet)
	endif
EndEvent