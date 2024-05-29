Scriptname DN143PlayerPickedUpLabKey extends ReferenceAlias Hidden Const

Form Property ItemToCheck Auto Const

Event OnAliasInit()
	AddInventoryEventFilter(ItemToCheck)
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace(self + "OnItemAdded() Running")
    if akBaseItem == ItemToCheck
    	debug.trace(self + "Item added was the one we were looking for!")
    	GetOwningQuest().SetStage(300)
    endif
EndEvent