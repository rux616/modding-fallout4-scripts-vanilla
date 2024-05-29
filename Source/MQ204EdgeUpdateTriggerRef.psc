Scriptname MQ204EdgeUpdateTriggerRef extends ObjectReference Conditional

Quest Property MQ204 Auto Const

Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MQ204.IsRunning()
			if MQ204.GetStage() == 15
				if (MQ204 as MQ204QuestScript).MQ204GlowingSeaEntered==0
					(MQ204 as MQ204QuestScript).MQ204GlowingSeaEntered=1
				endif
			endif
		endif
	endif

EndEvent


