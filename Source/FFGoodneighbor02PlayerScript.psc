Scriptname FFGoodneighbor02PlayerScript extends ReferenceAlias

Location Property BostonPublicLibrary Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Quest MyQuest = GetOwningQuest()
	If (akNewLoc == BostonPublicLibrary) && (MyQuest.GetStageDone(20) == 0) && (MyQuest.GetStageDone(10) == 1)
		MyQuest.SetStage(20)
	EndIf
EndEvent
