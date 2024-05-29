Scriptname testmCampbellOnItemAddedScript extends ObjectReference hidden


Formlist property terminalHackerSafeContentList auto
ObjectReference property DummySafe auto


Event OnInit()
AddInventoryEventFilter(none)
endEvent

Event OnLoad()
	RemoveAllItems(DummySafe, True)
	utility.wait(0.1)
	(DummySafe.RemoveAllItems(self, True))
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

terminalHackerSafeContentList.AddForm(akBaseItem)

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

terminalHackerSafeContentList.RemoveAddedForm(akBaseItem)

endEvent
