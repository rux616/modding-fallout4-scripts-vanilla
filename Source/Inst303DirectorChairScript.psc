Scriptname Inst303DirectorChairScript extends ReferenceAlias Conditional


Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		;do nothing
	endif

EndEvent