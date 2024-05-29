Scriptname DialogueInstituteShaunKidQuestScript extends ReferenceAlias Conditional

Quest Property DialogueInstituteShaunKid Auto Const


int Property FirstConvDate Auto Conditional


Event OnActivate(ObjectReference ActionRef)

if ActionRef == Game.GetPlayer()

	if DialogueInstituteShaunKid.GetStage() == 10
		if GameDay.GetValueInt() > (FirstConvDate + 1)
			DialogueInstituteShaunKid.SetStage(20)
		endif
	endif


endif

EndEvent
GlobalVariable Property GameDay Auto Const
