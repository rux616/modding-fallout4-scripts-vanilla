Scriptname DrinkingBuddyCheckStatus extends TopicInfo


Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	DialogueDrinkingBuddyScript QuestScript = GetOwningQuest() as DialogueDrinkingBuddyScript 
	QuestScript.CheckForJokeReset()
	QuestScript.CheckBeerForDispensing()
EndEvent