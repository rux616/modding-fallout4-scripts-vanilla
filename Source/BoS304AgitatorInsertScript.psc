Scriptname BoS304AgitatorInsertScript extends ObjectReference Const

Quest Property BoS304 Auto Const

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.getPlayer()
		if BoS304.GetStageDone(30) == 1
			BoS304.SetStage(40)
		endif
	endif

endEvent