Scriptname RelayTowerQuestScript extends Quest Hidden

Scene[] Property ScenesToStart Auto
int Property TimeToWait Auto
int Property TimerIndex = 10 auto

Function StartAllScenes()
int Count
int CountMax = ScenesToStart.Length
while (Count < CountMax)
	debug.trace("starting scene" + ScenesToStart[Count])
	if !ScenesToStart[Count].IsPlaying()
		ScenesToStart[Count].Start()
	endif
	Count = Count + 1
endwhile
StartTimer(TimeToWait, TimerIndex)
EndFunction


Event OnTimer(int aiTimerID)
	StartAllScenes()
EndEvent