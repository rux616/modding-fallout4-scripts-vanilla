Scriptname BoS101ArcJet02OverrideTriggerScript extends ObjectReference Const

Quest Property BoS101 Auto Const
Cell Property ArcjetSystems02 Auto Const
ReferenceAlias Property BoS101_Danse Auto Const
ObjectReference Property BoS101QSDanseMarker Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if BoS101.GetStage() < 220
			if BoS101_Danse.GetActorRef().GetParentCell() != ArcjetSystems02
				BoS101_Danse.GetActorRef().MoveTo(BoS101QSDanseMarker)
				BoS101_Danse.GetActorRef().EvaluatePackage()
			endif
		endif
	endif


endEvent