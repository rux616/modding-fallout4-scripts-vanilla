Scriptname DLC04:DLC04_KK_SceneStarter extends ObjectReference Const


DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory

int[] Property mySceneNumbers auto Const

event OnCellAttach()
	bool startedAScene
	int i = 0
	int count = mySceneNumbers.Length
	while !startedAScene && i < count
		startedAScene = DLC04_KiddieKingdomMain.TryToStartMyScene(mySceneNumbers[i])
		i += 1
	EndWhile

EndEvent


Event OnCellDetach()
	int i = 0
	int count = mySceneNumbers.Length
	while i < count
		DLC04_KiddieKingdomMain.CancelMyScene(mySceneNumbers[i])
		i += 1
	endWhile
EndEvent