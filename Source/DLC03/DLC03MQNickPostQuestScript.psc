Scriptname DLC03:DLC03MQNickPostQuestScript extends Quest

;listen for Nick's Hatred stage getting set and shut down the quest if it does
;we only register for one thing, so skipping a check for what we're receiving
Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	If auiStageID == 120
		Stop()
	EndIf
EndEvent