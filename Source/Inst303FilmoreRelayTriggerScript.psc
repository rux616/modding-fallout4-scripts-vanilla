Scriptname Inst303FilmoreRelayTriggerScript extends ReferenceAlias

Quest Property Inst303 Auto Const

Outfit Property InstituteJumpsuitHelmetOutfit Auto Const

ReferenceAlias Property Allie Auto Const

ObjectReference Property AllieMarker Auto Const



Event OnTriggerEnter(ObjectReference AkTrigger)

	if Inst303.GetStage() == 40
		if AkTrigger == Game.GetPlayer()

			(Inst303 as Inst303QuestScript).Stage40AllieTravel=True

			Allie.GetActorReference().SetOutfit(InstituteJumpsuitHelmetOutfit)
			Allie.GetReference().MoveTo(AllieMarker)
			Allie.GetActorReference().EvaluatePackage()
			Self.GetReference().Disable()
		endif
	endif

EndEvent