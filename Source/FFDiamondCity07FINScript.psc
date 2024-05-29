Scriptname FFDiamondCity07FINScript extends Quest

Location Property DiamondCityLocation Auto Const

;if the player leaves Diamond City after the timer is done
Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	If (GetStageDone(10) == 1) && (GetStageDone(15) == 0)
		if (aksender == Game.GetPlayer()) && (akNewLoc == DiamondCityLocation)
			SetStage(15)
			UnRegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		EndIf
	EndIf
EndEvent