Scriptname ShowTutorialMessageScript extends ObjectReference Const

Quest Property Tutorial Auto Const
Quest Property PreReqQuest Auto Const
Int Property PreReqStage Auto Const
Int Property Stage const Auto
Bool Property bPlayerOnly = true Auto Const


Event OnTriggerEnter(ObjectReference akActionRef)
	if PreReqQuest
		if PreReqQuest.GetStageDone(PreReqStage)
			if !bPlayerOnly
				;Debug.Trace(self + "entered trigger.")
				Tutorial.SetStage(Stage)
			elseif akActionRef == Game.GetPlayer()
				Tutorial.SetStage(Stage)
			endif
		endif
	else
		if !bPlayerOnly
			;Debug.Trace(self + "entered trigger.")
			Tutorial.SetStage(Stage)
		elseif akActionRef == Game.GetPlayer()
			Tutorial.SetStage(Stage)
		endif
	endif
EndEvent
