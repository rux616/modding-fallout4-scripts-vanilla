Scriptname Inst308ShaunScript extends ReferenceAlias Conditional

Quest Property Inst308 Auto Const


Event OnDeath(Actor Killer)

	if Killer == Game.GetPlayer()
		if Inst308.GetStage() < 30
			Inst308.SetStage(30)
		endif
	endif

EndEvent