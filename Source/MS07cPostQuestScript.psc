Scriptname MS07cPostQuestScript extends Quest

GlobalVariable Property MS07cPostQuestTimer Auto Const

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == 7
		SetStage(50)
	endif
EndEvent

Function StartMS07cPostQuestTimer()
	;debug.trace(self + "Starting MS07cPost quest timer:" + MS07cPostQuestTimer.GetValue())
	StartTimerGameTime(MS07cPostQuestTimer.GetValue(), 7)
EndFunction

Function CancelMS07cPostQuestTimer()
	CancelTimerGameTime(7)
EndFunction
