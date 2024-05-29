Scriptname DN143PlayerPickedUpAdminKey extends ReferenceAlias Hidden Const

Form Property ItemToCheck Auto Const

Event OnAliasInit()
	AddInventoryEventFilter(ItemToCheck)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if akBaseItem == ItemToCheck
    	GetOwningQuest().SetStage(600)
    endif
EndEvent