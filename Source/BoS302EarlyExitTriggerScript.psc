Scriptname BoS302EarlyExitTriggerScript extends ObjectReference Const

Quest Property BoS302 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if BoS302.GetStageDone(70) == 1
			if BoS302.GetStage() < 85
				BoS302.SetStage(85)
				Disable()
			endif
		endif
	endif

EndEvent