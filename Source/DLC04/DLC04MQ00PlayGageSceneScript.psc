Scriptname DLC04:DLC04MQ00PlayGageSceneScript extends ReferenceAlias

Scene Property DLC04MQ00_800_Gage Auto Const Mandatory
Quest Property DLC04MQ00 Auto Const Mandatory
Location Property DLC04TransitCenter01 Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If DLC04MQ00.GetStageDone(800) == 1 && DLC04MQ00.GetStageDone(810) == 0 && akNewLoc == DLC04TransitCenter01
		DLC04MQ00_800_Gage.Start()
	EndIf
EndEvent