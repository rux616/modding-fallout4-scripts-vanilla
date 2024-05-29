Scriptname DLC04:DLC04SafariGazelleEnableTriggerScript extends ObjectReference Const

globalvariable property DLC04SafariGazelleCloningOn auto Const
ObjectReference property DLC04SafariAdventureGazelleEnableMarker auto const

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == game.getplayer() && DLC04SafariGazelleCloningOn.getValue() == 1
		DLC04SafariAdventureGazelleEnableMarker.Enable()
		self.disable()
	endif
EndEvent
