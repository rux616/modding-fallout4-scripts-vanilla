Scriptname EEScript extends Quest

Keyword Property EE_LightChangeState_Start Auto Const

Activator Property AO_LightOffMarker Auto Const
Activator Property AO_LightOnMarker Auto Const

Static Property xMarker Auto Const

Faction property AO_SuspicionFaction auto Const

int property SuspicionEventCountTrigger = 2 auto Const
{ default value for triggering Suspicious state - count of "suspicion events"}

ActorValue Property Suspicious auto Const

EEScript Function GetScript() global
	return Game.GetFormFromFile(0x0002321C, "Fallout4.esm") as EEScript

EndFunction


Function StartLightChangeStateQuest(DefaultRemoveableLight LightRef, Actor ActorTakingLight, bool LightTurningOn, bool shouldPlaceAOMarker)
	debug.trace(self + "StartLightChangeStateQuest()  "+ LightRef + ActorTakingLight)

	;place an xmarker and fire off a quest, if that fails, it means no one nearby cared
	;so place a "missing light" marker for the Attraction Object System to find.

	ObjectReference LightMarker = PlaceTemporaryMarker(LightRef, xMarker)

	bool started = EE_LightChangeState_Start.SendStoryEventAndWait(akLoc = LightRef.GetCurrentLocation(), akRef1 = LightMarker, akRef2 = ActorTakingLight, aiValue1 = shouldPlaceAOMarker as int, aiValue2 = LightTurningOn as int)
	debug.trace(self + "started=" + started + ", LightMarker=" + LightMarker)

	if started == false
		LightMarker.delete() ;clean up
		if shouldPlaceAOMarker
			if LightTurningOn
				LightMarker = PlaceTemporaryMarker(LightRef, AO_LightOnMarker)
				debug.trace(self + " placed AO_LightOnMarker " + LightMarker)
			else
				LightMarker = PlaceTemporaryMarker(LightRef, AO_LightOffMarker)
				debug.trace(self + " placed AO_LightOffMarker " + LightMarker)
			endif
			; register the new marker for deletion events from the owning light
			AttractionObjectScript attrObject = LightMarker as AttractionObjectScript
			if attrObject
				attrObject.RegisterForDeletionEvent(LightRef)
			endif
		endif
	endIf 

EndFunction


Event ObjectReference.OnCellDetach(ObjectReference akSender)
	debug.trace(self + "akSender.OnCellDetach() deleting")
	akSender.Delete()

EndEvent

; increment suspicion event counter for this actor
Function IncrementSuspicionEventCount(Actor theActor, int value = 1)
	theActor.AddToFaction(AO_SuspicionFaction)
	int count = theActor.GetFactionRank(AO_SuspicionFaction) + value
	theActor.SetFactionRank(AO_SuspicionFaction, count)
endFunction

; check suspicion event count - set suspicious state if high enough
; eventCountTrigger: pass in to override default trigger (SuspicionEventCountTrigger)
; createDetectionEvent: true to trigger a detection event at 
Function CheckSuspicionFaction(Actor theActor, ObjectReference theObject, RefCollectionAlias theAllies, int eventCountTrigger = -1)
	int count = theActor.GetFactionRank(AO_SuspicionFaction)
	if eventCountTrigger == -1
		eventCountTrigger = SuspicionEventCountTrigger
	endIf

	if count >= eventCountTrigger
		theActor.SetValue(Suspicious, 2)
		int i = 0
		while i < theAllies.GetCount()
			actor ally = theAllies.GetAt(i) as Actor
			ally.SetValue(Suspicious, 2)
			i += 1
		endWhile

;/
; now thinking this is not the right thing to do here - being in Suspicious state should be enough
		if theObject
			theObject.CreateDetectionEvent(Game.GetPlayer(), 100)
		endif
/;		
	endif


EndFunction

ObjectReference Function PlaceTemporaryMarker(ObjectReference refToPlaceAt, Form markerToPlace)
	debug.trace(self + "PlaceTemporaryMarker: place " + markerToPlace + " at " + refToPlaceAt)
	ObjectReference newMarker = refToPlaceAt.placeAtMe(markerToPlace, abDeleteWhenAble = false) ;if abDeleteWhenAble is true, it won't aliases can't fill with it
	RegisterForRemoteEvent(newMarker, "OnCellDetach") ;for clean up
	return newMarker
endFunction
