Scriptname BoS303QuestScript extends Quest

ReferenceAlias Property Alias_Companion Auto Const
ReferenceAlias Property Alias_Dogmeat Auto Const
ReferenceAlias Property Alias_Vertibird Auto Const
GlobalVariable Property PlayerHasActiveCompanion Auto Const
GlobalVariable Property PlayerHasActiveDogmeatCompanion Auto Const
InputEnableLayer Property EnableLayer Auto

Function AllAboard()

Actor CompanionActor = Alias_Companion.GetActorRef()
Actor DogmeatActor = Alias_Dogmeat.GetActorRef()

	if (CompanionActor)
		if PlayerHasActiveCompanion.GetValue() == 1
			if CompanionActor.IsOnMount() == 0
				CompanionActor.SnapIntoInteraction(Alias_Vertibird.GetReference())
			endif
		endif
	endif

	if (DogmeatActor)
		if PlayerHasActiveDogmeatCompanion.GetValue() == 1
			if DogmeatActor.IsOnMount() == 0         
				DogmeatActor.SnapIntoInteraction(Alias_Vertibird.GetReference())
			endif
		endif
	endif

endFunction