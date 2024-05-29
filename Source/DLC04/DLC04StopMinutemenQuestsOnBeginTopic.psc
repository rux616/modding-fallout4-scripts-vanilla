Scriptname DLC04:DLC04StopMinutemenQuestsOnBeginTopic extends TopicInfo Const

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent auto const mandatory 

;When this topic begins, run the script to shut down any latent Minutemen quests
Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;Stop Minutemen quests running
	DLC04WorkshopParent.StopInactiveMinutemenQuests()
endEvent