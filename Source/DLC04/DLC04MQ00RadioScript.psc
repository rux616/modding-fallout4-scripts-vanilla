Scriptname DLC04:DLC04MQ00RadioScript extends Quest

GlobalVariable Property GameDaysPassed Auto Const Mandatory
Int Property RadioDCTimerID = 25 Auto Conditional
Scene Property DLC04MQ00RadioScene Auto Const Mandatory
Quest Property DLC04MQ00 Auto Const Mandatory

Event OnInit()
	StartRadioTimer()
EndEvent

Function StartRadioTimer()

	StartTimerGameTime(1, RadioDCTimerID)

EndFunction

Event OnTimerGameTime(int aiTimerID)
	If aiTimerID == RadioDCTimerID
		If DLC04MQ00RadioScene.IsPlaying() == 0 && DLC04MQ00.GetStageDone(520) == 0
			DLC04MQ00RadioScene.Start()
		EndIf
		;run the timer again
		StartTimerGameTime(1, RadioDCTimerID)
	EndIf
EndEvent
