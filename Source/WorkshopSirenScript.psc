Scriptname WorkshopSirenScript extends ObjectReference
{send a scripted story event on powered}

Keyword Property StoryEvent Auto Const mandatory

Quest AlarmQuest ; set to quest that's started, so we can stop it if the alarm is powered off

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn")
EndEvent

; OPEN = OFF
event onOpen(ObjectReference akActionRef)
	debug.trace(self + " OnOpen by " + akActionRef)
    if AlarmQuest
    	AlarmQuest.Stop()
    	AlarmQuest = None
    endif
EndEvent

; CLOSED = ON
event onClose(ObjectReference akActionRef)
	debug.trace(self + " onClose by " + akActionRef)
	; wait a bit before sending the event
	StartTimer(3.0)
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
    ; if still powered on, send event
    if IsPowered() && GetOpenState() == 3
		debug.trace(self + " OnTimer " + aiTimerID)
		StoryEvent.SendStoryEventAndWait(GetCurrentLocation(), self)
	endif
EndEvent

; callback from alarm quest
Function SetAlarmQuest(Quest myQuest)
	AlarmQuest = myQuest
endFunction