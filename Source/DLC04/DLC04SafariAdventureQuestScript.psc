Scriptname DLC04:DLC04SafariAdventureQuestScript extends Quest

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Remote listening for flag raise
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DLC04MQ03 Auto Const Mandatory
Function ListenForFlagRaise()
	RegisterForRemoteEvent(DLC04MQ03, "OnStageSet")

EndFunction

Group FlagRaiseProperties
	int Property ExternalFlagRaisedStage = 410 auto const
	int Property ExternalQuestKickoutStage = 1500 auto const

	int Property myFlagRaisedStage = 1500 auto const
	int Property myFlagFailedStage = 1600 auto const
EndGroup

Event Quest.OnStageSet(Quest sendingQuest, int auiStageID, int auiItemID)
	Debug.Trace(self + ": recieved OnStageSet from " + sendingQuest)
	Debug.Trace(self + "::: auiStageID = " + auiStageID)
	Debug.Trace(self + "::: auiItemID = " + auiItemID)
	;Flag Was raised!
	if auiStageID == ExternalFlagRaisedStage
		SetStage(myFlagRaisedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	;Flag raised fail due to raider kick out
	elseif auiStageID == ExternalQuestKickoutStage
		SetStage(myFlagFailedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	Endif
EndEvent