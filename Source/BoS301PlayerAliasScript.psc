Scriptname BoS301PlayerAliasScript extends ReferenceAlias Hidden Const

Form Property ItemToCheck Auto Const

Event OnAliasInit()
	AddInventoryEventFilter(ItemToCheck)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if akBaseItem == ItemToCheck
    	if GetOwningQuest().GetStageDone(95) == 1
 		    if GetOwningQuest().GetStageDone(100) == 0
			   	GetOwningQuest().SetStage(100)
			endif
	    endif
    endif
EndEvent