Scriptname BoSKickoutPAMCustomScript extends ReferenceAlias

Quest Property BoSKickOut Auto Const
Quest Property BoS302B Auto Const

Event OnDying(Actor akKiller)

	if BoS302B.GetStageDone(130) == 1
		BoSKickOut.SetStage(20)
	endif

EndEvent