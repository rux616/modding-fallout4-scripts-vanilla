Scriptname WorkshopSwitchDelayScript extends ObjectReference

int Property Interval = 2 Auto
int Property IntervalCount = 0 Auto
bool Property StartOn = true Auto

keyword property WorkshopStartUnpoweredOff auto const

Event OnLoad()
	RegisterForAnimationEvent(self, "AdditionalEvent01")
	RegisterForAnimationEvent(self, "AdditionalEvent02")
	if StartOn
		RemoveKeyword(WorkshopStartUnpoweredOff)
	elseif HasKeyword(WorkshopStartUnpoweredOff) == false
		AddKeyword(WorkshopStartUnpoweredOff)
	endif
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff: current state=" + GetState())
	if getState() != "Done"
		gotoState("Done")
	endif
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn: current state=" + GetState())
    if getState() == "Done"
    	gotoState("Counting")
    endif
EndEvent

Auto state Counting
	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState COUNTING from " + asOldState)
		IntervalCount = 0
		if StartOn
			debug.trace("PlayAnimation TurnOnNoTransition")
			PlayAnimation("TurnOnNoTransition")
		else
			debug.trace("PlayAnimation TurnOffNoTransition")
			PlayAnimation("TurnOffNoTransition")
		endif
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "AdditionalEvent01" || "AdditionalEvent02"
			debug.trace(self + "OnAnimationEvent " + asEventName)
			; on loop - increment count and see if time to switch
			IntervalCount += 1
			if IntervalCount >= Interval
				; switch to Done state
				gotoState("Done")
			endif
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef is Actor 
	    	gotoState("Done")
	    endif
	EndEvent

endState

state Done

	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState DONE from " + asOldState)
		IntervalCount = 0
		if StartOn
			debug.trace("PlayAnimation TurnOffNoTransition")
			PlayAnimation("TurnOffNoTransition")
		else
			debug.trace("PlayAnimation TurnOnNoTransition")
			PlayAnimation("TurnOnNoTransition")
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef is Actor 
	    	gotoState("Counting")
	    endif
	EndEvent
endState

state PowerOff
	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState POWEROFF from " + asOldState)
	endEvent	
	; waiting state while power is off
endState