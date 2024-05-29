Scriptname DLC03:ADV022HeadGearScript extends ObjectReference Hidden

ObjectReference Property HeadGearTrigger auto const

Event OnLoad()
    RegisterForRemoteEvent(HeadGearTrigger, "OnTriggerEnter")
    RegisterForRemoteEvent(HeadGearTrigger, "OnTriggerLeave")
EndEvent

STATE Retracted
	Event OnBeginState(string asOldState)
		if HeadGearTrigger.GetTriggerObjectCount() > 0
			GoToState("Busy")
	    	PlayAnimationAndWait("Play01", "Done")
	    	GoToState("Extended")
	    endif
	EndEvent

	Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerEnter() in STATE Extended")
	    if akSender == HeadGearTrigger
	    	GoToState("Busy")
	    	PlayAnimationAndWait("Play01", "Done")
	    	GoToState("Extended")
	    endif
	EndEvent
EndSTATE


STATE Extended
	Event OnBeginState(string asOldState)
		if HeadGearTrigger.GetTriggerObjectCount() == 0
			GoToState("Busy")
	    	PlayAnimationAndWait("Play01", "Done")
	    	GoToState("Retracted")
	    endif
	EndEvent

	Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerLeave() in STATE Extended")
	    if akSender == HeadGearTrigger
	    	GoToState("Busy")
	    	PlayAnimationAndWait("Play01", "Done")
	    	GoToState("Retracted")
	    endif
	EndEvent
EndSTATE


auto STATE Busy

EndSTATE


Event OnActivate(ObjectReference akActionRef)
    GoToState("Retracted")
EndEvent

	; Cause I have to
Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
	;Do Nothing
EndEvent
Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
	;Do Nothing
EndEvent