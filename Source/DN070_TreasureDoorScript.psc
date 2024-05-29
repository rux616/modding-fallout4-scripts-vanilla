Scriptname DN070_TreasureDoorScript extends Default2StateActivator Hidden
{Script for the DN070 Treasures Exhibit security doors. As the doors open, set a stage on the quest to turn on the lights.}

Quest property DN070 Auto Const Mandatory
{DN070}

int property stageToSetOnOpen Auto Const
{Stage to set once the doors have opened.}

int property stageToSetOnClose Auto Const
{Stage to set once the doors have closed.}

Function SetOpen(bool abOpen = true)
     Parent.SetOpen(abOpen)
     if (abOpen)
     	StartTimer(0, 2)
     Else
     	StartTimer(0, 3)
     EndIf
EndFunction

Function SetOpenNoWait(bool abOpen = true)
     Parent.SetOpenNoWait(abOpen)
     if (abOpen)
     	StartTimer(0, 2)
     Else
     	StartTimer(0, 3)
     EndIf
EndFunction

Event OnTimer(int timerID)
	if (timerID == 2)
		DN070.SetStage(stageToSetOnOpen)
	ElseIf (timerID == 3)
		DN070.SetStage(stageToSetOnClose)
	Else
		Parent.OnTimer(timerID)
	EndIf
EndEvent