ScriptName VendorInfoScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	;if we're calling this on the player, grab whoever the player is talking to and show barter menu, otherwise just show barter menu
	if utility.IsInMenuMode() == false
		If akSpeakerRef == Game.GetPlayer()
			;wait a second to allow the audio to finish
			Utility.Wait(0.2)
			(akSpeakerRef as Actor).GetDialogueTarget().ShowBarterMenu()
		Else
			;wait a second to allow the audio to finish
			Utility.Wait(0.2)
			(akSpeakerRef as Actor).ShowBarterMenu()
		EndIf
	endif
endEvent