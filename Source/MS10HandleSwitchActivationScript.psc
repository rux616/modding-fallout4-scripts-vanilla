Scriptname MS10HandleSwitchActivationScript extends ObjectReference Hidden

auto STATE DoNothing
	;Do nothing but wait for the quest to tell me to do my job.
EndSTATE

STATE StartHandlingActivation
	Event OnTriggerEnter(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	GetLinkedRef().BlockActivation(FALSE)
	    endif
	EndEvent
	Event OnTriggerLeave(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	GetLinkedRef().BlockActivation(TRUE, TRUE)
	    endif
	EndEvent
EndSTATE