Scriptname FFDiamondCity10MayorDoorScript extends ReferenceAlias

Event OnLoad()
	;always close the door
	If GetOwningQuest().GetStageDone(105) == 0
		Self.GetRef().SetOpen(false)
	EndIf
EndEvent