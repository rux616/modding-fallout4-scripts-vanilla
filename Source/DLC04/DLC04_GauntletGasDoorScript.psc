Scriptname DLC04:DLC04_GauntletGasDoorScript extends Default2StateActivator

Quest property DLC04MQ01Gauntlet Auto Const Mandatory
{DN017}

Function SetOpen(bool abOpen = true)
	if (DLC04MQ01Gauntlet.GetStageDone(800) && abOpen)
		DLC04MQ01Gauntlet.SetStage(850)
	EndIf
	;Allow Default2StateActivator to handle the door as usual.
	Parent.SetOpen(abOpen)
EndFunction