Scriptname DLC01:DLC01MQ05PlayerScript extends ReferenceAlias

Location Property DLC01LairLocation Auto Const
Quest Property DLC01MQ05 Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If DLC01MQ05.GetStageDone(700) == 0 && akNewLoc == DLC01LairLocation
		DLC01MQ05.SetStage(700)
	EndIf
EndEvent