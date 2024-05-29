Scriptname DLC04:DLC04PackFightsScript extends Quest

Location Property DLC04BradbertonAmphitheaterLocation Auto Const Mandatory
Quest Property DLC04PackFights Auto Const Mandatory

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Debug.Trace(self + "changelocation even triggered")
	If akSender == Game.GetPlayer() && akOldLoc == DLC04BradbertonAmphitheaterLocation && DLC04PackFights.GetStageDone(50) == 1
		Debug.Trace(self + "player left amphitheater")
		DLC04PackFights.SetStage(100)
	EndIf
EndEvent