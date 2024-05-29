Scriptname RadioFailsafeScript extends Quest Hidden

Scene[] Property ScenesToStart Auto
int Property SecondsToWait Auto
int TimerIndex = 10


; Starts all the scenes in the Array (If they aren't already playing), and starts a timer.
Function StartAllScenes()
	int Count
	int CountMax = ScenesToStart.Length
	while (Count < CountMax)
		debug.trace(Self + "StartAllScenes()| Starting scene" + ScenesToStart[Count])
		if !ScenesToStart[Count].IsPlaying()
			ScenesToStart[Count].Start()
		endif
		Count = Count + 1
	endwhile
	StartTimer(SecondsToWait, TimerIndex)
EndFunction


; On timer complete, start all the scenes again.
Event OnTimer(int aiTimerID)
	debug.trace(Self + "OnTimer()| Time Complete.  Firing StartAllScenes()")
	StartAllScenes()
EndEvent


; Function to call in order to remove a specific scene from the array.
Function RemoveScene(Scene SceneToRemove)
	int SceneIndex = ScenesToStart.Find(SceneToRemove)
	ScenesToStart.Remove(SceneIndex)
	debug.trace(Self + "RemoveScene()| Removing Scene " + SceneToRemove + " from ScenesToStart Array Index " + SceneIndex + ".")
EndFunction


; Function to call in order to add a specific scene to the array.
Function AddScene(Scene SceneToAdd)
	ScenesToStart.Add(SceneToAdd)
	debug.trace(Self + "AddScene()| Adding Scene " + SceneToAdd + " to ScenesToStart Array.")
EndFunction