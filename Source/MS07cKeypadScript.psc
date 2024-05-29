Scriptname MS07cKeypadScript extends ObjectReference

Quest Property pMS07c Auto Const

Quest Property pMS07 Auto Const

Scene Property pIncorrectCode Auto Const

Sound Property ActivateSound Auto Const

bool bCanPlayAgain = true

Event OnActivate(ObjectReference akActionRef)
;When activating this object, if the proper stage has been reached, and the player's not in combat, play scene
;Otherwise, player negative noise if quest has started and "Incorrect Code" scene if it hasn't


	if !pMS07c.GetStageDone(220) && !pMS07c.GetStageDone(1000)

		if akActionRef == Game.GetPlayer()

			if pMS07c.GetStageDone(210) && !(Game.GetPlayer()).IsInCombat() && !pMS07.GetStageDone(500)

				pMS07c.SetStage(220)
				pMS07cKeypad.SetStage(100)

			else

				if !pIncorrectCode.IsPlaying()

					pIncorrectCode.Start()

				endif

			endif

		endif

	else

		if bCanPlayAgain == true
			bCanPlayAgain = false

			if ActivateSound.PlayAndWait(self)
				bCanPlayAgain = true
			else
				bCanPlayAgain = true
			endif
		endif

	endif

EndEvent
Quest Property pMS07cKeypad Auto Const
