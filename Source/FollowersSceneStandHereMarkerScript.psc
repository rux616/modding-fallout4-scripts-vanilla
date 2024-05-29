Scriptname FollowersSceneStandHereMarkerScript extends ObjectReference
{Used to make Followers stand here during scenes.
Must be placed on Followers_Scene_StandHere Activator to work.}


Scene[] Property Scenes const auto
{Which scenes is this  Follower Stand Here marker associated with?

If a "scene" is made up of "subscenes" add ALL of them here. 
(Otherwise the Follower may wander off)

It enables when any of these scenes are running.
It disables when all of these scenes are stopped.

While enabled and a player is nearby and currently in the scene:
Any followers will try to stand here.
}


Scene[] RunningScenes  ;matches indexes in Scenes, is None if that scene is not running

;spinlocks
bool HandlingBegin
bool HandlingEnd

Event OnInit()
	if Scenes.Length == 0
		debug.trace(self + "WARNING: Scenes Array is EMPTY.", 2)

	endif

	disable()

	RunningScenes = New Scene[Scenes.length]

    int i = 0
    while (i < Scenes.length)

    	RegisterForRemoteEvent(Scenes[i], "OnBegin")
    	RegisterForRemoteEvent(Scenes[i], "OnEnd")

    	i += 1
    endwhile

EndEvent

Event Scene.OnBegin(Scene akSender)
	HandlingBegin = true

	debug.trace(self + "Scene.OnBegin: " + akSender)

	while HandlingEnd
		utility.wait(0.5)
	endwhile

	enable()

	RunningScenes[GetIndex(akSender)] = akSender

	HandlingBegin = false

EndEvent

Event Scene.OnEnd(Scene akSender)
	debug.trace(self + "Scene.OnEnd: " + akSender)

	while HandlingBegin
		utility.wait(0.5)
	endwhile

	handlingEnd = true

	bool IsSceneRunning

	int i = 0
	while (i < RunningScenes.length && IsSceneRunning == False)

		if RunningScenes[i] == akSender
			RunningScenes[i] = None

		elseif RunningScenes[i] != None
			IsSceneRunning = true

		endif
		
		i += 1
	endwhile

	if IsSceneRunning == false
		disable()

	endif

	handlingEnd = false

EndEvent


int Function GetIndex(Scene SceneToFind)
	int i = 0
	while (i < Scenes.length)
		if Scenes[i] == SceneToFind
			RETURN i 
		endif

		i += 1
	endwhile
	
EndFunction