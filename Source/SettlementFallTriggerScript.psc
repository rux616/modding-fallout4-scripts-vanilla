Scriptname SettlementFallTriggerScript extends ObjectReference Const
{Script to handle the player falling into an area that's supposed to be inside a WorldSpace}

ObjectReference Property SettlementMapMarker Auto Const

;if the player enters the trigger, fast travel him to the WorldSpace
Event OnTriggerEnter(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()

	;only do this if the player is entering and he is not entering while in a Veritibird
	If (akActionRef == PlayerREF)
		If (PlayerREF.IsOnMount() == False)
			Game.FastTravel(SettlementMapMarker)
		EndIf
	EndIf
EndEvent