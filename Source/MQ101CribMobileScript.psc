Scriptname MQ101CribMobileScript extends ReferenceAlias

ReferenceAlias Property CribStatic Auto
Sound Property MUSCribLP Auto

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)	
		Self.GetRef().BlockActivation(True, True)
		CribStatic.GetRef().PlayAnimation("PlayAnimation")
		MUSCribLP.Play(Self.GetRef())
	EndEvent
EndState