Scriptname Inst305ReactorButtonScript extends ReferenceAlias Conditional

Quest Property Inst305 Auto Const


Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if Inst305.GetStage() == 70
			Inst305.SetStage(80)
		endif
	endif

EndEvent