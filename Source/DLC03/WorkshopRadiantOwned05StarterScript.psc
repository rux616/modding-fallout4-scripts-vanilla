Scriptname DLC03:WorkshopRadiantOwned05StarterScript extends DLC03:WorkshopRadiantOwnedScript Conditional

group Radiant05Data
	ReferenceAlias property FogCrawler auto const mandatory

	RefCollectionAlias property SightingMarkers auto const mandatory
	{ nearby markers to choose randomly from }

	ReferenceAlias property SightingMarker auto const mandatory
	{ pick a marker from SightingMarkers and put it here }

	ReferenceAlias property Transmitter auto const mandatory
	{ pick a marker from SightingMarkers and put it here }
endGroup

float fQuestStartTimeStamp

; 
function SetupFogCrawler()
	debug.trace(self + "PickSightingMarker")
	; set start time (for shutdown check on daily update)
	fQuestStartTimeStamp = Utility.GetCurrentGameTime()

	; pick a random marker to place the fog crawler
	int randomRoll = utility.randomInt(0, SightingMarkers.GetCount()-1)
	ObjectReference sightingMarkerRef = SightingMarkers.GetAt(randomRoll)
	SightingMarker.ForceRefTo(sightingMarkerRef)

	; move fog crawler to marker and enable
	Actor fogCrawlerRef = FogCrawler.GetActorRef()
	ObjectReference transmitterRef = Transmitter.Getref()

	fogCrawlerRef.MoveTo(sightingMarkerRef)
	fogCrawlerRef.Enable()
	transmitterRef.MoveTo(fogcrawlerRef)
	transmitterRef.Enable()	
endFunction

; override parent function
function DailyUpdateCustom()
	debug.trace(self + "DailyUpdateCustom")
	; shut down after 1 day (check timestamp)
	if GetStageDone(100) && GetStageDone(300) == false && GetStageDone(400) == false && fQuestStartTimeStamp + 1.0 < utility.GetCurrentGameTime()
		; TODO - additional checks, e.g. player is in radio range of monster or monster has 3D
		if FogCrawler.GetRef().Is3DLoaded() == false
			; shut down quest with message
			TimeoutMessage.Show()
			SetStage(300)
		endif
	endif
endFunction