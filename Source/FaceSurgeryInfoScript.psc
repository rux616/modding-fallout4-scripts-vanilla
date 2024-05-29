ScriptName FaceSurgeryInfoScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the barbers Actor script
	Actor mySurgeon = (akSpeakerRef as Actor)
	(mySurgeon as SurgeonScript).BoughtSurgery()
endEvent