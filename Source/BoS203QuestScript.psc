Scriptname BoS203QuestScript extends Quest

ReferenceAlias property BoS203LiAlias Auto Const
Quest property BoS203 Auto Const 

MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("BoS203 Scipt Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 4 )     ; 4 is the Insitute
		if GetStage() >= 30 && GetStage() < 80
			SetStage(65)                   ; Fail the quest
		endif
	endif

EndEvent

Function BoS203FindLi()
  RegisterForDistanceLessThanEvent(Game.GetPlayer(), BoS203LiAlias.GetActorRef(), 700) ; Before we can use OnDistanceLessThan we must register.
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	BoS203.SetStage(40)
EndEvent