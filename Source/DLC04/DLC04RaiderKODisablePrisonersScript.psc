Scriptname DLC04:DLC04RaiderKODisablePrisonersScript extends ReferenceAlias

Location Property DLC04FizztopMountainLocation Auto Const Mandatory
Location Property DLC04BradbertonAmphitheaterLocation Auto Const Mandatory

ObjectReference Property DLC04DisciplesFizztopDisablePrisonersRef Auto Const Mandatory
ObjectReference Property DLC04PackAmphitheaterDisableCaptivesRef Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If GetOwningQuest().GetStageDone(20)
		If akOldLoc == DLC04FizztopMountainLocation
			DLC04DisciplesFizztopDisablePrisonersRef.Disable()
		EndIf
		If akOldLoc == DLC04BradbertonAmphitheaterLocation
			DLC04PackAmphitheaterDisableCaptivesRef.Disable()
		EndIf
	EndIf
EndEvent
