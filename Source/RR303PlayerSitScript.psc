Scriptname RR303PlayerSitScript extends ReferenceAlias Conditional
 
ReferenceAlias Property Vertibird Auto 

Event OnSit(ObjectReference akFurniture)
	
	If akFurniture == Vertibird.GetRef()
		If GetOwningQuest().GetStageDone(750) && !(GetOwningQuest().GetStageDone(800))
			GetOwningQuest().SetStage(800)
		EndIf

		If GetOwningQuest().GetStageDone(1050) && !(GetOwningQuest().GetStageDone(1100))
			GetOwningQuest().SetStage(1100)
		EndIf
	EndIf
	
EndEvent