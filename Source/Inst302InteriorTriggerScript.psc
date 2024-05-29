Scriptname Inst302InteriorTriggerScript extends ObjectReference

ReferenceAlias Property X418 Auto Const


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if X418.GetActorReference().IsDead() == 0
			X418.GetReference().Moveto(Game.GetPlayer())
			X418.GetActorReference().EvaluatePackage()
			Self.Disable()
		endif
	endif

EndEvent