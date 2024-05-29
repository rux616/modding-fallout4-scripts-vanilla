Scriptname DLC06:DLC06MQ02Script extends Quest

ReferenceAlias Property Alias_Workshop Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias property Alias_Rubble auto const mandatory 

function RegisterForWorkshopEvents(bool bRegister=true)
	if bRegister
		RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectDestroyed")
	else 
		UnregisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectDestroyed")
	endif
endFunction 

function CheckForRubbleCleared()
	ObjectReference rubble = Alias_Rubble.GetRef()
	if rubble && rubble.IsDisabled() && GetStageDone(500) == false
		setStage(500)
		RegisterForWorkshopEvents(false)
	endif
endFunction

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSource, ObjectReference akActionRef)
    debug.trace(self + " OnWorkshopObjectDestroyed " + akActionRef)
    HandleWorkshopEvent()
EndEvent
; override parent script function
function HandleWorkshopEvent()
	debug.trace(self + " HandleWorkshopEvent")
	; if this is the rubble, set correct stage
	CheckForRubbleCleared()
endFunction

