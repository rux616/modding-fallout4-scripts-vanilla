Scriptname WorkshopFastTravelTargetScript extends ObjectReference Const

WorkshopParentScript Property WorkshopParent auto const mandatory

Event OnInit()
	debug.trace(self + " OnInit")
    MoveFastTravelMarker()
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	debug.trace(self + " OnWorkshopObjectMoved")
    MoveFastTravelMarker()
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectDestroyed")
    ; restore fast travel marker to original spot
    MoveFastTravelMarker(true)
EndEvent

function MoveFastTravelMarker(bool bResetPosition = false)
	debug.trace(self + " MoveFastTravelMarker")
	; get map marker from workshop
	WorkshopScript workshopRef = GetLinkedRef(WorkshopParent.WorkshopItemKeyword) as WorkshopScript
	if workshopRef && workshopRef.myMapMarker
		; get map marker's linked ref
		ObjectReference mapMarkerTarget = workshopRef.myMapMarker.GetLinkedRef()
		if mapMarkerTarget
			if bResetPosition
				mapMarkerTarget.MoveToMyEditorLocation()
			else
				; move it here
				mapMarkerTarget.MoveTo(self)
			endif
		endif
	endif
endFunction