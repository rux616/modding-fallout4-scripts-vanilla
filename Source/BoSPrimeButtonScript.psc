Scriptname BoSPrimeButtonScript extends ObjectReference Const

Quest Property BoS301 Auto Const
Quest Property BoS304 Auto Const
Sound Property mySound Auto Const

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if BoS301.GetStage() == 200
			BoS301.SetStage(205)
		elseif BoS304.GetStage() == 45
			;play sound at button of things turning on
			mySound.play(Game.GetPlayer())
			BoS304.SetStage(50)
		endif
	endif
	
EndEvent