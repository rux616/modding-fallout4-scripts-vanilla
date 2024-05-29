Scriptname CaitActorScript extends Actor Const

;OBSOLETE

globalvariable Property AO_Companion_CaitExplainLockPick_DONE const auto
keyword Property AO_CaitExplainLockPick_Start const auto


int iTimerID_CaitExplainLockPick = 1 const				;timer id
float TimerInterval_CaitExplainLockPick = 5.0 const	;timer interval

Event OnLoad()
	Debug.Trace(self + "OnLoad()")

	if AO_Companion_CaitExplainLockPick_DONE.GetValue() <= 0 && IsInFaction(Game.GetCommonProperties().CurrentCompanionFaction)
		StartSendStoryEventTimer()
	else
		CancelTimer(iTimerID_CaitExplainLockPick)
	endif

endEvent

Event OnTimer(int aiTimerID)
	Debug.Trace(self + "OnTimer()")
	if aiTimerID == iTimerID_CaitExplainLockPick
		
		AO_CaitExplainLockPick_Start.SendStoryEventAndWait(akRef1 = self, akLoc = getCurrentLocation())

		StartSendStoryEventTimer()
	endif
EndEvent

Function StartSendStoryEventTimer()
	Debug.Trace(self + "StartSendStoryEventTimer()")
	startTimer(TimerInterval_CaitExplainLockPick, iTimerID_CaitExplainLockPick)
EndFunction