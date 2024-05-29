Scriptname DLC06:WorkshopBarberInfoScript extends TopicInfo const

Keyword property DLC06WorkshopBarberChairKeyword auto const mandatory 

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	If akSpeakerRef == Game.GetPlayer()
		(GetOwningQuest() as DLC06WorkshopParent).StartGenericBarberSurgery((akSpeakerRef as Actor).GetDialogueTarget())
	endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the barbers Actor script
	Actor myBarber
	If akSpeakerRef == Game.GetPlayer()
		myBarber = (akSpeakerRef as Actor).GetDialogueTarget() as Actor
	Else
		myBarber = (akSpeakerRef as Actor)
	EndIf

	DLC06:WorkshopBarberChairScript barberChair = myBarber.GetLinkedRef(DLC06WorkshopBarberChairKeyword) as DLC06:WorkshopBarberChairScript
	if barberChair
		barberChair.BoughtHaircut(myBarber)
	endif
endEvent