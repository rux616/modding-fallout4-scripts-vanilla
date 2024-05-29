Scriptname DrinkingBuddyToldAJokeScript extends TopicInfo

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	(GetOwningQuest() as DialogueDrinkingBuddyScript).ToldAJoke()
EndEvent