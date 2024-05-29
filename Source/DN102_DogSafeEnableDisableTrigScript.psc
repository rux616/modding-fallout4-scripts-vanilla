Scriptname DN102_DogSafeEnableDisableTrigScript extends DefaultEnableDisableTrigScript Const Hidden
{Variant of DefaultEnableDisableTrigScript that handles the player loading in further forward if Dogmeat is present.}

ReferenceAlias property DogmeatCompanion Auto Const
bool property ignoreTriggerIfDogmeatPresent Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if (!ignoreTriggerIfDogmeatPresent || (DogmeatCompanion.GetActorRef() == None))
		Parent.OnTriggerEnter(akActionRef)
	EndIf
EndEvent