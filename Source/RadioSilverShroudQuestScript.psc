Scriptname RadioSilverShroudQuestScript extends Quest Conditional

Int Property SongRepeats Auto Conditional

Int Property nPlayNumber = 1 Auto Conditional

Int Property bWayneInfo Auto Conditional

Int Property bAJInfo Auto Conditional

Int Property bAJReactivity Auto Conditional

Int Property bKendraInfo Auto Conditional

Int Property bKendraReactivity Auto Conditional

Int Property bHancockInfo Auto Conditional


Scene[] Property ScenesToCheckIfRunning Auto
Scene Property SceneToPlayIfNoneAreRunning Auto
Scene Property SceneToPlayIfNoneAreRunning2 Auto
Int Property SecondsToWait Auto
Int TimerIndex = 10


; Checks all the scenes in the array to see if they are running.  If none are, then it starts the SceneToPlayIfNoneRunning scene.
Function CheckAllScenes()
	int Count
	int CountMax = ScenesToCheckIfRunning.Length
	bool FoundPlayingScene = FALSE
	while (Count < CountMax)
		debug.trace(Self + "CheckAllScenes()| Checking Scene " + ScenesToCheckIfRunning[Count])
		if ScenesToCheckIfRunning[Count].IsPlaying()
			debug.trace(Self + "CheckAllScenes()| Found at least one running scene. " + ScenesToCheckIfRunning[Count])
			FoundPlayingScene = TRUE
		endif
		Count = Count + 1
	endwhile
	if FoundPlayingScene == FALSE
		debug.trace(Self + "CheckAllScenes()| Found NO runnign scenes. Starting scene " + SceneToPlayIfNoneAreRunning)
		SceneToPlayIfNoneAreRunning.Start()
		SceneToPlayIfNoneAreRunning2.Start()
	endif
	StartTimer(SecondsToWait, TimerIndex)
EndFunction


; On timer complete, check all scenes again.
Event OnTimer(int aiTimerID)
	debug.trace(Self + "OnTimer()| Time Complete.  Firing CheckAllScenes()")
	CheckAllScenes()
EndEvent