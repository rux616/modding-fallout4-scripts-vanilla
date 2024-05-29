Scriptname BoS101DOTriggerScript extends ObjectReference Const

Quest Property BoS101 Auto Const
ReferenceAlias Property BoS101Danse Auto Const
ObjectReference Property BoS101OTMarker Auto Const
Cell Property ArcjetSystems01 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if BoS101.GetStageDone(20) == 1 && BoS101Danse.GetActorRef().GetParentCell() != ArcjetSystems01
			BoS101.SetStage(50)
			BoS101Danse.GetActorRef().MoveTo(BoS101OTMarker)
			BoS101Danse.GetActorRef().EvaluatePackage()
			Delete()
		endif
	endif

EndEvent

