Scriptname DLC03:DLC03MQ03PlayerScript extends ReferenceAlias

Key Property DLC03MQ03StorageKey Auto Const Mandatory

Event OnAliasInit()
	AddInventoryEventFilter(DLC03MQ03StorageKey)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	Quest MyQuest = GetOwningQuest()
	;if the player ever acquires this key, set stage
	If (MyQuest.GetStageDone(206) == 0) && (akBaseItem == DLC03MQ03StorageKey)
		MyQuest.SetStage(206)
	EndIf

EndEvent