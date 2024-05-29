Scriptname DLC04:DLC04KiddieKingdomPATrigParent extends ObjectReference Const

Group NoTouch CollapsedOnRef
	DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory
EndGroup

Group sceneProperties
	int Property mySceneNum = -1 Auto Const
	int property cutOffStage = -1 auto const
	bool Property disableSelfOnTrigger = false auto Const
	bool Property playOnlyOnce = false auto const
	float Property cutOffTime = -1.0 auto const
EndGroup


Function SendPAScene()
	Quest KKQuest = (DLC04_KiddieKingdomMain as Quest)
	if !KKQuest.IsCompleted()
		if cutOffStage == -1 || !KKQuest.GetStageDone(cutOffStage)
			if KKQuest.IsRunning()
				DLC04_KiddieKingdomMain.AddToPAQueue(mySceneNum, playOnlyOnce, cutOffTime)
			else
				StartTimer(2.0)
			endif
		endif
	endif
EndFunction

Event OnTimer(int aiTimerID)
  	 SendPAScene()
EndEvent