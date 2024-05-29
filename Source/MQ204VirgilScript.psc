Scriptname MQ204VirgilScript extends ReferenceAlias Conditional

ObjectReference Property CarFurniture Auto Const



Event OnSit(ObjectReference AkFurniture)

	if AkFurniture == CarFurniture
;		CarFurniture.PlayAnimation("CarPush")
		MQ204CarMoved.SetValue(1)
		Self.GetActorReference().EvaluatePackage()
	endif

EndEvent
GlobalVariable Property MQ204CarMoved Auto Const
