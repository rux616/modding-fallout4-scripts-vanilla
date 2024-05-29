Scriptname WorkshopRecruitInfoScript extends TopicInfo const
{use on infos where you want to recruit an NPC into the workshop system}

WorkshopParentScript Property WorkshopParent auto const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "OnEnd " + akSpeakerRef)
	;if we're calling this on the player, grab whoever the player is talking to and recruit, otherwise just recruit speaker
	Actor recruit
	If akSpeakerRef == Game.GetPlayer()
		recruit = (akSpeakerRef as Actor).GetDialogueTarget()
	Else
		recruit = (akSpeakerRef as Actor)
	EndIf
	WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(recruit)
endEvent