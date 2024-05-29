Scriptname ReconScopeQuestScript extends Quest

Quest Property ReconScopeQuestGetMapMarker Auto
LocationAlias Property NavLocationAlias Auto
ReferenceAlias Property GetMMLocationMapMarker Auto
ObjectReference Property MapMarker Auto Hidden
Location Property NavLocation Auto Hidden
Location Property CommonwealthLocation Auto Hidden

Function SetNavLocation(Location akLocation)
	;set quest alias with NavPoint location, which fills the ReconScopeQuestGetMapMarker aliases 
	NavLocation = akLocation
	NavLocationAlias.ForceLocationTo(akLocation)

	;start the quest to get the map marker
	ReconScopeQuestGetMapMarker.Start()
EndFunction

;calling a separate function from ReconScopeQuestGetMapMarker to make sure everything runs in order
Function GetMapMarker()
	;get the map marker from ReconScopeQuestGetMapMarker
	MapMarker = GetMMLocationMapMarker.GetRef()
	ReconScopeQuestGetMapMarker.Stop()

	;check to see if the map marker is already revealed, and reveal it if not
	if MapMarker.IsMapMarkerVisible() == False && MapMarker != None && NavLocation != CommonwealthLocation 
		MapMarker.AddToMap()
		Debug.Notification("NEW LOCATION REVEALED.")
	endif
EndFunction