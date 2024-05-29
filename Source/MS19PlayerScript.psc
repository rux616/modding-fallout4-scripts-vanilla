Scriptname MS19PlayerScript extends ReferenceAlias

Location Property Vault81Location Auto Const
Quest Property MS19 Auto Const
GlobalVariable Property IsPlayerInElevator Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If MS19.GetStageDone(100) == 1
		If akNewLoc == Vault81Location && IsPlayerInElevator.GetValue() == 0
				MS19.SetStage(150)
		EndIf
	EndIf
EndEvent
