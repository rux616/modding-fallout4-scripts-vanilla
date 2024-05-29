ScriptName DogmeatInfoHappyScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	DogmeatIdles.FaceHappy()
endEvent