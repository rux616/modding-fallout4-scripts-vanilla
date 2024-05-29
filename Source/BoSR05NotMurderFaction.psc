Scriptname BoSR05NotMurderFaction extends Quest Conditional

RefCollectionAlias Property NotMurderFactionBosses Auto Const
LocationAlias Property Settlement Auto Const
WorkshopParentScript Property WorkshopParent Auto Const
ReferenceAlias Property Workshop auto const

event OnQuestInit()
	; register for location loaded event from Parsons
	RegisterForRemoteEvent(Settlement.GetLocation(), "OnLocationLoaded")
endEvent

Event Location.OnLocationLoaded(Location akSender)
	debug.trace(self + " OnLocationLoaded " + akSender)
	if akSender == Settlement.GetLocation()
		ObjectReference[] workshopActors = WorkshopParent.GetWorkshopActors(Workshop.GetRef() as WorkshopScript)
		NotMurderFactionBosses.AddArray(workshopActors)
	endif
endEvent

