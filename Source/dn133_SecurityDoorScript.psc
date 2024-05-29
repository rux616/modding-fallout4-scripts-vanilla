Scriptname dn133_SecurityDoorScript extends ObjectReference


message Property closedMsg auto

bool InternalOpenState		;private
bool property bOpenState hidden
	Function Set(bool newValue)
		debug.trace(self + ": setting new openstate >> " + newValue)
		if InternalOpenState == newValue
			return
		endif
	    if newValue == true
	     	playAnimationAndWait("Play01","done")
	    elseif newValue == false
	    	playAnimationAndWait("Play01","done")
	    endif
	    InternalOpenState = newValue
	    debug.trace(self + ": setting new openstate DONE")
	EndFunction
	bool Function Get()
	    return InternalOpenState
	EndFunction
EndProperty

Function SetOpen(bool shouldBeOpen = true)
	bOpenState = shouldBeOpen
EndFunction


; Gets the open state of this object. Which can be one of the following:
; 0 - None
; 1 - Open
; 2 - Opening
; 3 - Closed
; 4 - Closing
int Function GetOpenState()
	if bOpenState
		return 1
	else
		return 3
	endif
endFunction

;TEMP remove after testing
;/
Event onActivate(ObjectReference akActionRef)
	if bOpenState == true
		setOpen(false)
	else
		setOpen()
	endif
endEvent
/;
Event onActivate(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	closedMsg.show()
    endif
EndEvent