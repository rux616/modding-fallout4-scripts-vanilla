Scriptname DLC06:DLC06E02Script extends Quest

Function StartWaitTimer(int nTimer = 500)
	StartTimerGameTime(1, nTimer)
EndFunction

Function CancelWaitTimer()
	CancelTimerGameTime(500)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, progress the quest
	if iTimer == 500
		if !GetStageDone(600) && pSodaFountain.GetRef().IsEnabled()
			CancelTimerGameTime(500)
			SetStage(600)
		elseif !(pSodaFountain.GetRef().IsEnabled())
			StartTimerGameTime(1, 500)
		endif
	endif

EndEvent


ReferenceAlias Property pSodaFountain Auto Const
