Scriptname RentRoomInfoScript extends TopicInfo

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the innkeepers Actor script
	Actor myInnkeeper = (akSpeakerRef as Actor)
	(myInnkeeper as RentRoomScript).RentRoom()
endEvent