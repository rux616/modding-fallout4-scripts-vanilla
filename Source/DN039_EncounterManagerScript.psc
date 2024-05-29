Scriptname DN039_EncounterManagerScript extends ObjectReference Const Hidden
{Script on a DefaultDummy outside Faneuil Hall. Manages the state of the fire pit hazard out front and handles cell reset.}


;-----------------------
;Faneuil Hall Cell Reset
;-----------------------
;The encounters in Faneuil Hall are controlled by enable markers, which remain enabled/disabled after cell reset.
;We need to catch the OnReset event and flip them back to their starting states.

ObjectReference property DN039_1FDisableMarkerEastEntrance auto const
ObjectReference property DN039_1FDisableMarkerWestEntrance auto const

Event OnReset()
	DN039_1FDisableMarkerEastEntrance.Enable()
	DN039_1FDisableMarkerWestEntrance.Enable()
EndEvent


;---------------------
;Faneuil Hall Fire Pit
;---------------------
;The Fire Pit hazard in front of the building is enabled until the first time the cell unloads after the player
;clears the dungeon. It is thereafter disabled, even after cell reset.

Location property FaneuilHallLocation auto const
ObjectReference property DN039_FirePitEnableMarker auto const

Event OnUnload()
	if (FaneuilHallLocation.IsCleared())
		DN039_FirePitEnableMarker.Disable()
	EndIf
EndEvent