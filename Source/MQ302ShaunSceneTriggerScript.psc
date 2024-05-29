Scriptname MQ302ShaunSceneTriggerScript extends ObjectReference

Scene Property MQ302ShaunScene Auto Const


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MQ302.IsRunning()
			if MQ302.GetStage() >= 400
				MQ302ShaunScene.Start()
				Self.Disable()
			endif
		endif
	endif

EndEvent
Quest Property MQ302 Auto Const
