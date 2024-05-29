Scriptname DLC03:DLC03WorkshopParentScript extends WorkshopAddLocationsScript

GlobalVariable property DLC03PlayerWorkshopCount auto const mandatory

function OnQuestInitCustom()
	; watch for player to become owner of DLC03 workshops
	RegisterForCustomEvent(WorkshopParent, "WorkshopPlayerOwnershipChanged")
endFunction

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if workshopRef
			debug.trace(self + " WorkshopPlayerOwnershipChanged: workshopRef=" + workshopRef)
			; is this a DLC03 workshop?
			if WorkshopsCollection.Find(workshopRef) > -1
				debug.trace(self + " DLC03 workshop ownership changed - update DLC03PlayerWorkshopCount")
				; update workshop count since something changed
				int i = 0
				int workshopCount = 0
				while i < WorkshopsCollection.GetCount()
					WorkshopScript theWorkshop = WorkshopsCollection.GetAt(i) as WorkshopScript
					if theWorkshop && theWorkshop.OwnedByPlayer
						workshopCount += 1
					endif
					i += 1
				endWhile
				; update global
				DLC03PlayerWorkshopCount.SetValue(workshopCount)
				debug.trace(self + " DLC03PlayerWorkshopCount=" + DLC03PlayerWorkshopCount.GetValue())
			endif
		endif
	endif
EndEvent
