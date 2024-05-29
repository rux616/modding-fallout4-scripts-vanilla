Scriptname BoSRangeSceneScript extends Quest

Function SetRangeSceneTimer()
	StartTimerGameTime(24, 555)
EndFunction

Event OnTimerGameTime(int aiTimerID)		
	if aiTimerID == 555
		;Player hasn't hit the trigger within 24 hours. End the quest.
		SetStage(90) 
	endif
EndEvent