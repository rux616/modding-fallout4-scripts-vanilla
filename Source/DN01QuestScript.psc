Scriptname DN01QuestScript extends Quest  Conditional

Int Property FirstWaveRaiderDeadCount = 0 Auto Conditional
Int FirstWaveRaiderDeadTotal = 3
Quest Property MQ03 Auto

Function FirstWaveRaiderDead()
	;Count dead, advance quest once all are dead
	FirstWaveRaiderDeadCount = FirstWaveRaiderDeadCount + 1
	If FirstWaveRaiderDeadCount == FirstWaveRaiderDeadTotal
		MQ03.SetStage(80)
	EndIf
EndFunction
