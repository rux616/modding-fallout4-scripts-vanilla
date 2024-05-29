Scriptname BoSKickOutLiCustomScript extends ReferenceAlias

Quest Property BoSKickOut Auto Const
Quest Property BoS301 Auto Const
GlobalVariable Property BoSLiSlain Auto Const

Event OnDying(Actor akKiller)

	if BoSLiSlain.GetValue() == 0
		if akKiller == Game.GetPlayer()
			if BoS301.GetStage() >= 10
				BoSKickOut.SetStage(20)
			elseif BoS301.GetStage() < 10
				BoSLiSlain.SetValue(1)
			endif
		endif
	endif

EndEvent
