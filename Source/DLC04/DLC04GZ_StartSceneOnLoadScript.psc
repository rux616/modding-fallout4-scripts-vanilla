Scriptname DLC04:DLC04GZ_StartSceneOnLoadScript extends ObjectReference

Scene property SceneToStart Auto Const Mandatory

Event OnLoad()
	if (!SceneToStart.IsPlaying())
		SceneToStart.Start()
	EndIf
EndEvent