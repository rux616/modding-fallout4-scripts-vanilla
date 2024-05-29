Scriptname DLC02:DLC02WorkshopRelaxSirenScript extends WorkshopSirenScript

Quest property DLC02WorkshopSummonedToRelax auto const mandatory
{ relax quest - so we can shut it down if still running when this is turned on }

; CLOSED = ON
event onClose(ObjectReference akActionRef)
	debug.trace(self + " onClose by " + akActionRef)
	; shut down any running quest
	StopRelaxQuest()
	Parent.OnClose(akActionRef)
EndEvent

Event OnUnload()
	; stop quest OnUnload so other sirens can work - turn off OnLoad (because that doesn't work when siren is unloaded)
	StopRelaxQuest()
EndEvent

Event OnLoad()
	; turn off when I load (since turning off OnUnload doesn't work)
	; turn off when I unload
	; OPEN = OFF
   	SetOpen(true)
endEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	StopRelaxQuest()
EndEvent

function StopRelaxQuest()
	; shut down any running quest
	if DLC02WorkshopSummonedToRelax.IsRunning()
		DLC02WorkshopSummonedToRelax.Stop()
	endif
endFunction