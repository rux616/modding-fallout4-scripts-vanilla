Scriptname DLC03:DLC03FarHarborMapNoteScript extends TopicInfo

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)

	pMapNote.AddToMap()

endEvent

ObjectReference Property pMapNote Auto Const
