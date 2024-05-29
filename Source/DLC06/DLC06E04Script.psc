Scriptname DLC06:DLC06E04Script extends Quest

Function StartWaitTimer(int nTimer = 500)
	StartTimerGameTime(1, nTimer)
EndFunction

Function CancelWaitTimer()
	CancelTimerGameTime(500)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, progress the quest
	if iTimer == 500
		if !GetStageDone(400)
			CancelTimerGameTime(500)
			SetStage(400)
		endif
	endif

EndEvent