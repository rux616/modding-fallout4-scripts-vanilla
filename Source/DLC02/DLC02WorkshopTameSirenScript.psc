Scriptname DLC02:DLC02WorkshopTameSirenScript extends ObjectReference Const

Keyword Property StoryEvent Auto Const mandatory

;Event OnPowerOn(ObjectReference akPowerGenerator)
;	debug.trace(self + " OnPowerOn")
;EndEvent

; OPEN = OFF
event onOpen(ObjectReference akActionRef)
	debug.trace(self + " OnOpen by " + akActionRef)
	; wait a bit before sending the event
	StartTimer(3.0)
EndEvent

; CLOSED = ON
;event onClose(ObjectReference akActionRef)
;	debug.trace(self + " onClose by " + akActionRef)
;EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	; wait a bit before sending the event
	StartTimer(3.0)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectDestroyed")
	; send event immediately
	StoryEvent.SendStoryEventAndWait(GetCurrentLocation(), self)
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	debug.trace(self + " OnDestructionStageChanged")
	if IsDestroyed()
		; wait a bit before sending the event
		StartTimer(3.0)
	endif
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID + ": IsPowered=" + IsPowered() + " GetOpenState=" + GetOpenState())
    ; if still off, send event
    if IsPowered() == false || GetOpenState() <= 2 || IsDestroyed()
		debug.trace(self + " OnTimer " + aiTimerID)
		StoryEvent.SendStoryEventAndWait(GetCurrentLocation(), self)
	endif
EndEvent
