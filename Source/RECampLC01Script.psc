Scriptname RECampLC01Script extends Quest

ReferenceAlias Property Jules Auto Const

Event OnTimer(int aiTimerID)
	if aiTimerID == 155
		if !Jules.GetActorRef().IsDead()
			;debug.trace(self + "Kill Jules")
			Jules.GetActorRef().Kill()
		endif

		if !GetStageDone(210) 
			SetStage(210)
		endif
	endif
EndEvent

Function StartExecutionTimer(float fTimer)
	;debug.trace(self + "Start execution timer")
	StartTimer(fTimer, 155)
EndFunction

Function CancelExecutionTimer()
	;debug.trace(self + "Cancel execution timer")
	CancelTimer(155)
EndFunction