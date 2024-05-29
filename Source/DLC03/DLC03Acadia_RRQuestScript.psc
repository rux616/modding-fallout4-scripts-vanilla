Scriptname DLC03:DLC03Acadia_RRQuestScript extends Quest Conditional

;if player is kicked out of RR, shut down this quest

 Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
   ;store off which faction we just got kicked out of
   Int myFactionNumber = (akArgs[0] as Int)
   if myFactionNumber == 3
	SetStage(600)
  endif
 EndEvent

;timer function for setting stage 500

Function StartAcadiaRRTimer()

	StartTimerGameTime(24, 9001)

EndFunction


Event OnTimerGameTime(int TimerID)

	if TimerID == 9001

		SetStage(500)

	endif

Endevent