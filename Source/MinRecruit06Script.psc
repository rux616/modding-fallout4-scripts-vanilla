Scriptname MinRecruit06Script extends WorkshopEventsQuestScript Const

function HandleWorkshopPlayerOwnershipChanged(bool bPlayerOwned)
	if bPlayerOwned
		; set "cleared" stage
		SetStage(200)
	endif
Endfunction


