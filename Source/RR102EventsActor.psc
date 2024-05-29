Scriptname RR102EventsActor extends ReferenceAlias

Event OnUnload()
	if ( pRR102.GetStageDone(150) && !pRR102.GetStageDone(250) )	; Have you talked with Deacon?
		Self.GetActorRef().MoveTo(pRR102DeaconTouristMarker)		; Move Deacon to the right location
		Self.GetActorRef().SetOutfit(pResident3WithHat)   			; Get him dressed in his new outfit
		pRR102.SetStage(200)										; Let the game know he's moved
		;UnregisterForRemoteEvent(self, "OnUnload")
	endif

	if ( pRR102.GetStageDone(750) )		; Have you left Switchboard?
		pRR102.SetStage(775)										        ; Act like he was talked to
		Self.GetActorRef().MoveTo(pRRDeaconInitialMarker)					; Move Deacon to the right location
		Self.GetActorRef().SetOutfit(pResidentShortSleevesWithGlasses)   	; Get him dressed in his original outfit
		UnregisterForRemoteEvent(self, "OnUnload")
	endif

EndEvent

ObjectReference Property pRR102DeaconTouristMarker Auto Const
Outfit Property pResident3WithHat Auto Const

Quest Property pRR102 Auto Const

Outfit Property pResidentShortSleevesWithGlasses Auto Const

ObjectReference Property pRRDeaconInitialMarker Auto Const
