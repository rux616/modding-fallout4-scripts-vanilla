Scriptname DLC04:DLC04PackFightsPlayerScript extends ReferenceAlias

Location Property DLC04BradbertonAmphitheaterLocation Auto Const Mandatory
Quest Property DLC04PackFights Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; If one of the combatants is dead, stop the quest when the player leaves the Bradberton Amphitheater.
	If akOldLoc == DLC04BradbertonAmphitheaterLocation
		DLC04PackFights.SetStage(100)
	EndIf

EndEvent