Scriptname MS17PlayWritingAnimScript extends TopicInfo

Idle Property pFurnitureWriting Auto Const

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	; Make Swanson play writing anim
	(akSpeakerRef as Actor).PlayIdle(pFurnitureWriting)
endEvent