Scriptname BoSKickOutDanseCustomScript extends ReferenceAlias

Quest Property BoSKickOut Auto Const
Quest Property BOS302 Auto Const

Event OnDying(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if BoS302.GetStageDone(20) == 0
			if BoSKickOut.GetStageDone(10) == 0
				BoSKickOut.SetStage(30)
			elseif BoSKickOut.GetStageDone(10) == 1
				BoSKickOut.SetStage(20)
			endif
		elseif BoS302.GetStageDone(20) == 1
			Return
		endif
	endif

EndEvent