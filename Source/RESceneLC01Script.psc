Scriptname RESceneLC01Script extends Quest

Quest Property RESceneLC01 Auto Const
int Property iCountdown = 45 Auto Const
ReferenceAlias Property Accused Auto Const

Function StartSceneTimer()
	StartTimer(iCountdown, 1)
EndFunction

Function StartExecutionTimer(float fTimer)
	;debug.trace(self + "Start execution timer")
	StartTimer(fTimer, 155)
EndFunction

Function CancelExecutionTimer()
	;debug.trace(self + "Cancel execution timer")
	CancelTimer(155)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == 1
		if !RESceneLC01.GetStageDone(20)
			RESceneLC01.SetStage(17)
		endif
	
	elseif aiTimerID == 155
		if !Accused.GetActorRef().IsDead()
			;debug.trace(self + "Kill Accused")
			Accused.GetActorRef().Kill()
		endif

		if !GetStageDone(105) 
			SetStage(105)
		endif
	endif
EndEvent

