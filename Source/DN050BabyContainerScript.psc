Scriptname DN050BabyContainerScript extends ObjectReference Const

miscObject property BabyBottle01 auto const
miscObject property BabyBottle02 auto const
quest property DN050 auto const


Event onInit()
	AddInventoryEventFilter(BabyBottle01)
	AddInventoryEventFilter(BabyBottle02)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == BabyBottle01 || akBaseItem == BabyBottle02
		if DN050.getstage() == 30
			DN050.setstage(35)
			RemoveAllInventoryEventFilters()
		endif
	endif
EndEvent
