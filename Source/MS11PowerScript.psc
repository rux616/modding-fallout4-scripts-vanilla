Scriptname MS11PowerScript extends ObjectReference Hidden

quest property myQuest auto	
{ quest to call SetStage on}

Event OnPowerOn(ObjectReference akPowerGenerator)
	Debug.Trace("MS11 - We Got Power!")

	; The stage that indicates the Auxiliary Power has been hooked up
	myQuest.SetStage(925)
EndEvent