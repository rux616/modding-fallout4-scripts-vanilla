Scriptname MQ203MemoryExitTrigger extends ObjectReference Const

MQ203Script property MQ203 auto const

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && MQ203.IsRunning() && MQ203.GetStageDone(920)
		MQ203.ExitMessage()
	endif
EndEvent