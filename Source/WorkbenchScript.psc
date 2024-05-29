Scriptname WorkbenchScript extends ObjectReference Const

Keyword property WorkshopItemKeyword auto const mandatory

Event OnActivate(ObjectReference akActionRef)
	;;debug.trace(self + "OnActivate")
	if akActionRef == Game.GetPlayer()
		; if linked workshop currently unowned, check ownership
		WorkshopScript myWorkshop = GetLinkedRef(WorkshopItemKeyword) as WorkshopScript
		if myWorkshop && myWorkshop.OwnedByPlayer == false
			myWorkshop.CheckOwnership()
		endif
	endif
endEvent