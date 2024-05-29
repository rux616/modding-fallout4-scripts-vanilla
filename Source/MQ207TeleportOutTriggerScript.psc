Scriptname MQ207TeleportOutTriggerScript extends ObjectReference Conditional

Quest Property MQ207 Auto Const

GlobalVariable Property PlayerInstitute_Joined Auto Const


Event OnTriggerEnter(ObjectReference ActionRef)


	if ActionRef == Game.GetPlayer()
		if MQ207.IsRunning()


			if MQ207.GetStageDone (180) && PlayerInstitute_Joined.GetValue() == 0 
				Debug.Trace("MQ207TeleportTrigger script fired")
				MQ207.SetStage(190)
				Self.Disable()
			endif
		endif
	endif

EndEvent