Scriptname DLC06:WorkshopSurgeryInfoScript extends TopicInfo

Keyword property DLC06WorkshopSurgeryChairKeyword auto const mandatory 

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the surgeon Actor script
	Actor mySurgeon
	If akSpeakerRef == Game.GetPlayer()
		mySurgeon = (akSpeakerRef as Actor).GetDialogueTarget() as Actor
	Else
		mySurgeon = (akSpeakerRef as Actor)
	EndIf

	DLC06:WorkshopSurgeryChairScript surgeryChair = mySurgeon.GetLinkedRef(DLC06WorkshopSurgeryChairKeyword) as DLC06:WorkshopSurgeryChairScript
	if surgeryChair
		surgeryChair.BoughtSurgery(mySurgeon)
	endif
endEvent