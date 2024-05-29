ScriptName DiamondCityRunBaseScript extends ObjectReference

ObjectReference Property NextBase Auto
Int Property BaseNumber Auto
{0 = Up to Bat, 1 = First Base, 2 = Second Base, 3 = Third Base, 4 = Homerun}
DialogueDiamondCityScript Property DialogueDiamondCity Auto

Event OnTriggerEnter(ObjectReference akActionRef)	
	If akActionRef == Game.GetPlayer()
		Debug.Trace(akActionRef + " Player has run one of the bases")
	
		;if I'm starting the run, reset everything
		If BaseNumber == 0
			DialogueDiamondCity.BatterUp()
		;when we're rounding third, enable the homerun trigger
		ElseIf BaseNumber == 3
			DialogueDiamondCity.RoundingThird()
		;if I complete the homerun
		ElseIf BaseNumber == 4
			DialogueDiamondCity.Homerun()
		;all other bases just advance normally
		Else
			NextBase.Enable()
			Self.Disable()
		EndIf
	EndIf
EndEvent