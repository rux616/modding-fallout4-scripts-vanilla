Scriptname DLC03:DLC03LastPlankRentRoomInfoScript extends TopicInfo

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;call the functions on the innkeepers Actor script
	Actor myInnkeeper = (akSpeakerRef as Actor)
	(myInnkeeper as DLC03LastPlankRentRoomScript).RentRoom()
endEvent
