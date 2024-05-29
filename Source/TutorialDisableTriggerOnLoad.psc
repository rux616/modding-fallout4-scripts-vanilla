Scriptname TutorialDisableTriggerOnLoad extends ObjectReference Const

int Property iDisableStageA Auto Const
int Property iDisableStageB Auto Const
Quest Property QuestA Auto Const
Quest Property QuestB Auto Const

Event OnLoad()
	if QuestA
		if QuestA.GetStageDone(iDisableStageA)
			self.Disable()
		endif
	endif
	if QuestB
		if QuestB.GetStageDone(iDisableStageB)
			self.Disable()
		endif
	endif
EndEvent

Event OnUnLoad()
	if QuestA
		if QuestA.GetStageDone(iDisableStageA)
			self.Disable()
		endif
	endif
	if QuestB
		if QuestB.GetStageDone(iDisableStageB)
			self.Disable()
		endif
	endif
EndEvent