Scriptname DLC03:DLC03AcadiaM03QuestScript extends Quest Conditional




Function StartAcadiaM04Timer()

	StartTimerGameTime(24, 3530)

EndFunction


Event OnTimerGameTime(int TimerID)

	if TimerID == 3530

		DLC03AcadiaM04.Start()
		Stop()

	endif

Endevent
Quest Property DLC03AcadiaM04 Auto Const Mandatory

Int Property ChallengeTrack = 1 Auto Conditional
