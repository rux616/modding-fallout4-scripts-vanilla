Scriptname DLC04:DLC04_BottlingPlantPAScript extends Quest Conditional

Struct SceneData
	int SceneNumber
	scene myScene
EndStruct

SceneData[] Property myScenes Auto conditional

Function QueueSceneStart(int sceneToStart)
	;Set the loop bool, the scenes check these to see if they should loop
	;this prevents weird line cut off from hard start/stopping
	SetSceneToLoop(sceneToStart, true)
	;Check the array for scenes, and start one if we have an appropriate one
	int i = myScenes.findStruct("SceneNumber", sceneToStart)
	if i >= 0
		if !myScenes[i].myScene.isPlaying()
			myScenes[i].myScene.Start()
		endif
	endif
EndFunction


Function QueueSceneStop(int sceneToStop)
	;Set the loop bool to false
	;the scene will finish the line it is on, then bail
	SetSceneToLoop(sceneToStop, false)
EndFunction

;normally I'd do this as an array, but editor conditions can't check VMQuestVariables in an array
;	¯\_(ツ)_/¯
Group LoopSceneVars collapsedOnRef
	bool Property LoopScene01 Auto Conditional Hidden
	bool Property LoopScene02 Auto Conditional Hidden
	bool Property LoopScene03 Auto Conditional Hidden
	bool Property LoopScene04 Auto Conditional Hidden
	bool Property LoopScene05 Auto Conditional Hidden
	bool Property LoopScene06 Auto Conditional Hidden
	bool Property LoopScene07 Auto Conditional Hidden
	bool Property LoopScene08 Auto Conditional Hidden
	bool Property LoopScene09 Auto Conditional Hidden
	bool Property LoopScene10 Auto Conditional Hidden

	;These are used to advance through each scene's VO loop
		;since the positions isn't being remembered
	int Property VOPhase01 = 1 Auto Conditional Hidden
	int Property VOPhase02 = 1 Auto Conditional Hidden
	int Property VOPhase03 = 1 Auto Conditional Hidden
	int Property VOPhase04 = 1 Auto Conditional Hidden
	int Property VOPhase05 = 1 Auto Conditional Hidden
	int Property VOPhase06 = 1 Auto Conditional Hidden
	int Property VOPhase07 = 1 Auto Conditional Hidden
	int Property VOPhase08 = 1 Auto Conditional Hidden
	int Property VOPhase09 = 1 Auto Conditional Hidden
	int Property VOPhase10 = 1 Auto Conditional Hidden
EndGroup



Function SetSceneToLoop(int sceneNum, bool shouldLoop = true)
	if sceneNum == 1
		LoopScene01 = shouldLoop
	elseif sceneNum == 2
		LoopScene02 = shouldLoop
	elseif sceneNum == 3
		LoopScene03 = shouldLoop
	elseif sceneNum == 4
		LoopScene04 = shouldLoop
	elseif sceneNum == 5
		LoopScene05 = shouldLoop
	elseif sceneNum == 6
		LoopScene06 = shouldLoop
	elseif sceneNum == 7
		LoopScene07 = shouldLoop
	elseif sceneNum == 8
		LoopScene08 = shouldLoop
	elseif sceneNum == 9
		LoopScene09 = shouldLoop
	elseif sceneNum == 10
		LoopScene10 = shouldLoop
	endif	
EndFunction

;Incrementing scene vars for looping PA scenes
; This is very brute force, but again, no conditional array checks in editor conditions
Function IncrementSceneVar(int SceneNum, bool LastTopicInfo)
	debug.Trace(Self + ": IncrementSceneVar")
	debug.Trace(self + ": SceneNum == " + SceneNum + " LastTopicInfo == " + LastTopicInfo)
	if !LastTopicInfo
		;If not last topic, increment
		if sceneNum == 1
			debug.Trace("VOPhase was " + VOPhase01)
			VOPhase01 += 1
			debug.Trace("VOPhase is Now " + VOPhase01)
		elseif sceneNum == 2
			VOPhase02 += 1
		elseif sceneNum == 3
			VOPhase03 += 1
		elseif sceneNum == 4
			VOPhase04 += 1
		elseif sceneNum == 5
			VOPhase05 += 1
		elseif sceneNum == 6
			VOPhase06 += 1
		elseif sceneNum == 7
			VOPhase07 += 1
		elseif sceneNum == 8
			VOPhase08 += 1
		elseif sceneNum == 9
			VOPhase09 += 1
		elseif sceneNum == 10
			VOPhase10 += 1
		endif
	else ;Is last topic, loop back to 1
		if sceneNum == 1
			debug.Trace("VOPhase was " + VOPhase01)
			VOPhase01 = 1
			debug.Trace("VOPhase is Now " + VOPhase01)
		elseif sceneNum == 2
			VOPhase02 = 1
		elseif sceneNum == 3
			VOPhase03 = 1
		elseif sceneNum == 4
			VOPhase04 = 1
		elseif sceneNum == 5
			VOPhase05 = 1
		elseif sceneNum == 6
			VOPhase06 = 1
		elseif sceneNum == 7
			VOPhase07 = 1
		elseif sceneNum == 8
			VOPhase08 = 1
		elseif sceneNum == 9
			VOPhase09 = 1
		elseif sceneNum == 10
			VOPhase10 = 1
		endif
	Endif
EndFunction