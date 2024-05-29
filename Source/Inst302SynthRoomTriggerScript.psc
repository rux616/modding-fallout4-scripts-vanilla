Scriptname Inst302SynthRoomTriggerScript extends ObjectReference Conditional

ReferenceAlias Property X418 Auto Const

Quest Property Inst302 Auto Const

ObjectReference Property Inst302CourserTeleportMarker Auto Const


Event OnTriggerEnter(ObjectReference ActionRef)

if Inst302.GetStage() >= 50

	if ActionRef == Game.GetPlayer()
		if Game.GetPlayer().GetDistance(X418.GetReference()) > 1000
			X418.GetReference().MoveTo(Inst302CourserTeleportMarker)
			if X418.GetReference().Getvalue(Health) < 0
				X418.GetReference().Restorevalue(Health, 1000)
			endif
			X418.GetActorReference().EvaluatePackage()
		endif
		Inst302.SetStage(60)
		Self.Disable()
	endif
endif


EndEvent
ActorValue Property Health Auto Const
