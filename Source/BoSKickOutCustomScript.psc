Scriptname BoSKickOutCustomScript extends ReferenceAlias

Quest Property BoSKickOut Auto Const

Event OnDying(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if BoSKickOut.GetStageDone(10) == 0
			BoSKickOut.SetStage(30)
		elseif BoSKickOut.GetStageDone(10) == 1
			BoSKickOut.SetStage(20)
		endif		
	endif

EndEvent