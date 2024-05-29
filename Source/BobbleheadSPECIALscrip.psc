Scriptname BobbleheadSPECIALscrip extends ObjectReference

Quest Property PerksQuest Auto Const
Int Property stage Auto Const

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == game.GetPlayer()
		if PerksQuest.GetStageDone(Stage) == false
			PerksQuest.SetStage(Stage)
		endif
	endif
EndEvent
