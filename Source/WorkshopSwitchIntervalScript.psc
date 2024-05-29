Scriptname WorkshopSwitchIntervalScript extends ObjectReference

int Property IntervalOff = 5 Auto
int Property IntervalOn = 5 Auto

int Property IntervalOffCount Auto
int Property IntervalOnCount Auto

Event OnLoad()
    ; register for animation events
	RegisterForAnimationEvent(self, "AdditionalEvent01")
	RegisterForAnimationEvent(self, "AdditionalEvent02")
EndEvent

Auto state On
	Event OnBeginState(string asOldState)
		IntervalOnCount = 0
		PlayAnimation("TurnOnNoTransition")
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "AdditionalEvent01"
			; on loop - increment count and see if time to switch

			IntervalOnCount += 1
			if IntervalOnCount >= IntervalOn
				; switch to Off state
				gotoState("Off")
			endif
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef is Actor 
	    	gotoState("Off")
	    endif
	EndEvent

endState

state Off

	Event OnBeginState(string asOldState)
		IntervalOffCount = 0
		PlayAnimation("TurnOffNoTransition")
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "AdditionalEvent02"
			; off loop - increment count and see if time to switch
			IntervalOffCount += 1
			if IntervalOffCount >= IntervalOff
				; switch to On state
				gotoState("On")
			endif
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef is Actor 
	    	gotoState("On")
	    endif
	EndEvent
endState

