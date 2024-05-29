Scriptname COMCurieQuestScript extends Quest Conditional

Int Property bCurieToldAboutAmari Auto Conditional

Function NewCurieArrivalTimer()
	StartTimerGameTime(24, 201)
EndFunction

Function CancelNewCurieArrivalTimer()
	CancelTimerGameTime(201)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, New Curie is now in the chair
	;debug.messagebox("OnTimer fired")
	if iTimer == 201
		if !GetStageDone(300)
			SetStage(300)

			CancelNewCurieArrivalTimer()
		endif
	endif
EndEvent