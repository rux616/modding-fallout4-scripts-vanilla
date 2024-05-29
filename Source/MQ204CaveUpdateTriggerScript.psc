Scriptname MQ204CaveUpdateTriggerScript extends ObjectReference Conditional

Quest Property MQ204 Auto Const


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MQ204.IsRunning() == True
			(MQ204 as MQ204QuestScript).MQ204TalkedtoCOA =1
			Self.Disable()
		endif
	endif

EndEvent