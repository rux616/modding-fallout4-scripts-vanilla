ScriptName DogmeatInfoNeutralScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	DogmeatIdles.FaceNeutral()
endEvent