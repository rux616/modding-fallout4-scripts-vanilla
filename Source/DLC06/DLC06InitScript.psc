Scriptname DLC06:DLC06InitScript extends Quest

Quest property DLC06MQ03 auto const mandatory 
Scene[] property MQ03WalkScenes auto const mandatory 


Event OnQuestInit()
    ; check for MQ03 in bad state
    if DLC06MQ03.GetStageDone(125) && DLC06MQ03.GetStageDone(150) == false 
    	int i = 0
    	bool bSceneRunning = false 
    	while i < MQ03WalkScenes.Length && bSceneRunning == false
    		Scene theScene = MQ03WalkScenes[i]
    		if theScene.IsPlaying()
    			debug.trace(self + " MQ03 scene is running: " + theScene)
    			bSceneRunning = true 
    		endif
    		i += 1
    	endWhile
    	if bSceneRunning == false
    		debug.trace(self + " MQ03 in broken state - fixing")
    		; broken state - fix by starting scene
    		MQ03WalkScenes[0].Start()
    	endif
    endif

    ; stop quest
    Stop()
EndEvent