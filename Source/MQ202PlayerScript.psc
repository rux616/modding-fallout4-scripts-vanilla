Scriptname MQ202PlayerScript extends ReferenceAlias

ReferenceAlias Property PlayerMemoryLounger Auto

Event OnSit(ObjectReference akFurniture)
	If akFurniture == PlayerMemoryLounger.GetRef()
		If (GetOwningQuest().GetStageDone(155) == 1) && (GetOwningQuest().GetStageDone(170) == 0)
			GetOwningQuest().SetStage(170)
		EndIf
	EndIf
EndEvent