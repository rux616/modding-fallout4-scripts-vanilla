Scriptname DLC04:DLC04GZVaultTecQuestScript extends Quest
{To be cleaned up.}

Struct DLC04GZVaultTecSceneData
	Scene myScene
	float mySceneTimestamp = -1000.0
EndStruct

DLC04GZVaultTecSceneData[] property VaultTecScenes Auto Const Mandatory
int CONST_MinDelayBeforeReplay = 60 Const
int currentScene = -1
Activator property DLC04GZ_VaultTecTrigger Auto Const Mandatory

Function PlayVaultTecScene(int sceneID, ObjectReference akActivator)
	Debug.Trace("DATA: " + (sceneID != currentScene) + ", " + (akActivator is Default1StateActivator) + ", " + (Utility.GetCurrentRealTime() > VaultTecScenes[sceneID].mySceneTimestamp + CONST_MinDelayBeforeReplay))
	if ((akActivator is Default1StateActivator) || (Utility.GetCurrentRealTime() > VaultTecScenes[sceneID].mySceneTimestamp + CONST_MinDelayBeforeReplay))
		int i = 0
		While (i < VaultTecScenes.Length)
			VaultTecScenes[i].myScene.Stop()
			i = i + 1
		EndWhile

		currentScene = sceneID
		VaultTecScenes[sceneID].mySceneTimestamp = Utility.GetCurrentRealTime()
		VaultTecScenes[sceneID].myScene.Start()
		Debug.Trace("Starting scene.")
	EndIf
EndFunction

Function SetSceneTimestamp(int sceneID)
	VaultTecScenes[sceneID].mySceneTimestamp = Utility.GetCurrentRealTime()
EndFunction

Function ClearSceneTimestamp(int sceneID)
	VaultTecScenes[sceneID].mySceneTimestamp = 0
EndFunction