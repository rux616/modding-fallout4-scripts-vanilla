Scriptname DLC03:DLC03_V118_ClueScript extends ObjectReference

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory
int Property StageToSet Auto Const

bool Property DisableSelfOnActivate = false Auto Const

Event OnActivate(ObjectReference akActivator)
	if StageToSet && akActivator == game.GetPlayer()
		if !DLC03_V118_ClueTracker.GetStageDone(StageToSet)
			DLC03_V118_ClueTracker.SetStage(StageToSet)
			if DisableSelfOnActivate
				self.Disable(abFadeout = false)
			endif
		endif
	endif
EndEvent