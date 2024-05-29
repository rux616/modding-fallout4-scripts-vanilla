Scriptname BoSVBAliasBoardingScript extends ReferenceAlias

Quest Property QuestCheck Auto Const
int Property QuestCheckStage Auto Const
GlobalVariable Property OptionalConditionalGlobal Auto Const
ReferenceAlias Property Alias_Vertibird Auto Const
ReferenceAlias Property Alias_QuestPassenger Auto Const	 
GlobalVariable Property BoardingGlobal Auto Const

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
	debug.trace("BoS201 VERTIBIRD - I AM THE PLAYER")		
		if QuestCheck.GetStage() == QuestCheckStage 
		debug.trace("BoS201 VERTIBIRD - I AM THE RIGHT STAGE")	
			BoardingGlobal.SetValue(1)
			debug.trace("BoS201 VERTIBIRD - I SET THE GLOBAL")	
			ObjectReference Vbird = Alias_Vertibird.GetReference()

				if OptionalConditionalGlobal == None || OptionalConditionalGlobal.GetValue() == 1
					if Alias_QuestPassenger.GetActorRef().IsOnMount() == 0
						Alias_QuestPassenger.GetActorRef().SnapIntoInteraction(Vbird)
					endif
				endif
		endif
	endif

EndEvent