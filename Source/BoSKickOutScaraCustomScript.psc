Scriptname BoSKickOutScaraCustomScript extends ReferenceAlias

Quest Property BoSKickOut Auto Const
Quest Property BoS301 Auto Const
GlobalVariable Property BoSLiSlain Auto Const

Event OnDying(Actor akKiller)

	if BoSLiSlain.GetValue() == 1
		if akKiller == Game.GetPlayer()
			if BoS301.GetStage() >= 10
				BoSKickOut.SetStage(20)
			elseif BoS301.GetStage() < 10
				Return
			endif
		endif
	endif

EndEvent