Scriptname MQ105PlayerScript extends ReferenceAlias Conditional

Key Property DmndKelloggKey Auto Const
ReferenceAlias Property ValentinesOfficePlayerChair Auto Const
Int Property PlayerInInterviewChair Auto Conditional

Event OnAliasInit()
	AddInventoryEventFilter(DmndKelloggKey)
EndEvent

;check if the player gets the key to Kellogg's House
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Quest MyQuest = GetOwningQuest()
	If akBaseItem == DmndKelloggKey
		If MyQuest.GetStageDone(300) == 0 && MyQuest.GetStageDone(100) == 1
			MyQuest.SetStage(300)
		EndIf
	EndIf
EndEvent

Event OnSit(ObjectReference akFurniture)
	Quest MyQuest = GetOwningQuest()
	If akFurniture == ValentinesOfficePlayerChair.GetRef()
		PlayerInInterviewChair = 1
		If MyQuest.GetStageDone(42) == 0 && MyQuest.GetStageDone(30) == 1		
			MyQuest.SetStage(42)
		EndIf
	EndIf
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	If akFurniture == ValentinesOfficePlayerChair.GetRef()
		PlayerInInterviewChair = 0
	EndIf
EndEvent