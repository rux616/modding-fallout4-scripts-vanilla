Scriptname RRR05Script extends Quest Conditional

MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RRR05Script Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(9000)                   ; Fail the quest
	endif

EndEvent
Int Property bGiveItemReward Auto
