Scriptname DLC03:DLC03FarHarborFF03cScript extends Quest Conditional

Event OnInit()
	;Listen for the player picking up items
	RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnItemRemoved")
	;Only catch items with the keyword
	AddInventoryEventFilter(pDLC03MirelurkCarapaceKeyword)
EndEvent

EVENT ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	debug.trace("Check for Carapaces")

	; Check to see if a Carapace was picked up
	if ( akBaseItem.HasKeyword(pDLC03MirelurkCarapaceKeyword) )
		int nPreviousCount = pDLC03_FH_FF03cCarapaceCounter.GetValue() as Int
		int nCurrentCount = Game.GetPlayer().GetItemCount(akBaseItem)
		int nDiff = nCurrentCount - nPreviousCount
		ModObjectiveGlobal(nDiff, pDLC03_FH_FF03cCarapaceCounter, 100)
		
		if nCurrentCount >= 3
			;UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
			;UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemRemoved")
			SetStage(200)
			SetObjectiveCompleted(100, TRUE)
			SetObjectiveDisplayed(200, TRUE)
		endif
	endif
endEVENT

EVENT ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	debug.trace("Check for Carapaces")

	; Check to see if a Carapace was picked up
	if ( akBaseItem.HasKeyword(pDLC03MirelurkCarapaceKeyword) )
		int nPreviousCount = pDLC03_FH_FF03cCarapaceCounter.GetValue() as Int
		int nCurrentCount = Game.GetPlayer().GetItemCount(akBaseItem)
		int nDiff = nCurrentCount - nPreviousCount
		ModObjectiveGlobal(nDiff, pDLC03_FH_FF03cCarapaceCounter, 100)

		if nCurrentCount < 3
			SetObjectiveCompleted(100, FALSE)
			SetObjectiveDisplayed(100)
			SetObjectiveDisplayed(200, FALSE)
		endif

	endif
endEVENT

Function NoLongerTrackCarapaces()
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemRemoved")
EndFunction


Keyword Property pDLC03MirelurkCarapaceKeyword Auto Const Mandatory
GlobalVariable Property pDLC03_FH_FF03cCarapaceCounter Auto Const Mandatory

Int Property bAskedAboutHealth Auto Conditional
