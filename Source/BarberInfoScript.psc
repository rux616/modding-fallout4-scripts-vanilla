ScriptName BarberInfoScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the barbers Actor script
	Actor myBarber = (akSpeakerRef as Actor)
	(myBarber as HaircutScript).BoughtHaircut()
endEvent