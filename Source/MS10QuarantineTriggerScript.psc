Scriptname MS10QuarantineTriggerScript extends ObjectReference Const

Quest Property MS19 Auto Const
Scene Property MS19PCArriveQuarantine Auto Const

Event OnTriggerEnter(ObjectReference akActorRef)
	if MS19.GetStage() == 400
		if akActorRef == game.getplayer()
			MS19.SetStage(500)
			MS19PCArriveQuarantine.Start()
		endif
	endif
EndEvent
