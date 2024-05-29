Scriptname DLC04:DLC04_GZForceSceneOnLoadScript extends ObjectReference
{Starts a scene when the reference loads. May start different scenes depending on whether the power has been restored.}

Group Reference_Properties
	Scene property SceneToStart_PrePower Auto Const Mandatory
	{Scene to start if PowerRestoredStage IS NOT set.}

	Scene property SceneToStart_PostPower Auto Const Mandatory
	{Scene to start if PowerRestoredStage IS set.}
EndGroup

Group Quest_Properties
	Quest property DLC04GZTrackingQuest Auto Const Mandatory
	{The Galactic Zone tracking quest.}

	int property DLC04GZTrackingQuest_PowerRestoredStage = 1000 Auto Const
	{Stage on DLC04GZTrackingQuest indicating that the power has been restored.}
EndGroup


Event OnLoad()
	if (!DLC04GZTrackingQuest.GetStageDone(DLC04GZTrackingQuest_PowerRestoredStage))
		Debug.Trace(Self + " is starting to play " + SceneToStart_PrePower)
		SceneToStart_PrePower.ForceStart()
	Else
		Debug.Trace(Self + " is starting to play " + SceneToStart_PostPower)
		SceneToStart_PostPower.ForceStart()
	EndIf
EndEvent