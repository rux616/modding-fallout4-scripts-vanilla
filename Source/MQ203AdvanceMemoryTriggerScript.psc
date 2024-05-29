Scriptname MQ203AdvanceMemoryTriggerScript extends ObjectReference Const
;/
MQ203Script property MQ203 auto const

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && MQ203.IsRunning()
		MQ203.ExitMessage()
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && MQ203.IsRunning()
		MQ203.ExitMessage()
	endif
EndEvent
/;