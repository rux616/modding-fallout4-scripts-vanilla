ScriptName DogmeatInfoSadScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	DogmeatIdles.FaceSad()
endEvent