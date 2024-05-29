Scriptname DLC03:DLC03Acadia_BOSQuestScript extends Quest Conditional



MQ00Script Property MQ00 Auto Const Mandatory

Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
   ;store off which faction we just got kicked out of
   Int myFactionNumber = (akArgs[0] as Int)
   if myFactionNumber==1
	   SetStage(1000)
	endif
 EndEvent





Function StartAcadiaBoSTimer()

	StartTimerGameTime(24, 1337)

EndFunction


Event OnTimerGameTime(int TimerID)

	if TimerID == 1337

		SetStage(50)

	endif

Endevent



Int Property MQ01SceneDone Auto Conditional
