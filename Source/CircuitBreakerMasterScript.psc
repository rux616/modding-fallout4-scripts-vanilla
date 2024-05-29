Scriptname CircuitBreakerMasterScript extends ObjectReference Hidden Conditional

Group OptionalProperties
	

	Bool Property OnPosition Auto Conditional
	{Whether this switch is in ON position or not, (Default: FALSE)
 Also, updates every time the switch is flipped.}

 	Bool Property LockToOnPosition Auto
 	{If this is TRUE then the switch will lock into the ON position when switched ON (Unless DenyOnPosition TRUE)}

 	Bool Property DenyOnPosition Auto
 	{If this is TRUE then the switch will deny going into the ON position and force itself back into the OFF position, and display a message
  (Default = FALSE)}

  	Message Property DenyOnPositionMessage Auto
  	{Message to display when denying the ON position.}
EndGroup

Group NoTouchy CollapsedOnRef
	Keyword Property LinkCustom01 Auto Const
	{Link to the Breaker}

	Keyword Property LinkCustom02 Auto Const
	{Link to the Lid}

	Keyword Property LinkCustom03 Auto Const
	{Link to activate when this switch is in the ON position}

	Keyword Property LinkCustom04 Auto Const
	{Link to activate whent his switch is in the OFF position}
EndGroup

Bool BeenTurnedOn

ObjectReference Breaker
ObjectReference Lid
ObjectReference OnTrigger
ObjectReference OffTrigger


Event OnInit()
    Breaker = GetLinkedRef(LinkCustom01)
    Lid = GetLinkedRef(LinkCustom02)
    OnTrigger = GetLinkedRef(LinkCustom03)
    OffTrigger = GetLinkedRef(LinkCustom04)
EndEvent


Event OnLoad()
	if (Lid != None)
    		RegisterForRemoteEvent(Lid, "OnOpen")
    		RegisterForRemoteEvent(Lid, "OnClose")
    		RegisterForRemoteEvent(Lid, "OnActivate")

    		if Lid.GetOpenState() == 1
    			Breaker.BlockActivation(FALSE, FALSE)
    		else
    			Breaker.BlockActivation(TRUE, TRUE)
    		endif
    	endif

	RegisterForRemoteEvent(Breaker, "OnActivate")

    if OnPosition && !BeenTurnedOn
		Breaker.PlayAnimation("Play01")
		BeenTurnedOn = TRUE
		if LockToOnPosition
			GoToState("DoNothing")
		endif
    endif
EndEvent


Event ObjectReference.OnOpen(objectReference akSender, ObjectReference akActionRef)
	if akSender == Lid
		; Lid has opened, allow normal activation no the switch
		Breaker.BlockActivation(FALSE, FALSE)
	endif
EndEvent


Event ObjectReference.OnClose(objectReference akSender, ObjectReference akActionRef)
	if akSender == Lid
		; Lid is closed, block all activation on the switch itself
		Breaker.BlockActivation(TRUE, TRUE)
	endif
EndEvent


Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
	if akSender == Lid
		if Lid.GetOpenState() < 3
    		Breaker.BlockActivation(FALSE, FALSE)
    	else
    		Breaker.BlockActivation(TRUE, TRUE)
   		endif
	endif
EndEvent



Auto State WaitingForActivate

	Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)

		if akSender == Breaker
			GoToState("DoNothing")
			debug.trace(self + "Activated by " + akSender)
			HandleSwitch(akActionRef)
		endif

	EndEvent

EndState



State DoNothing
	Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)

		if akSender == Breaker
			if OnPosition && !LockToOnPosition
				GoToState("WaitingForActivate")
				HandleSwitch(akActionRef)
			endif
		endif

	EndEvent

EndState


Function HandleSwitch(ObjectReference akActionRef)
	if OnPosition && LockToOnPosition && BeenTurnedOn
		; Switch is already on, and supposed to stay here, so stay in DoNothing state.
	else
		; Switch isn't locked in on position, so do normal stuff.

	    Breaker.PlayAnimationAndWait("play01","done")

	    if !OnPosition && !BeenTurnedOn
	    		; In OFF Position.  Moved to ON Position
	    		debug.trace(self + "Was OFF, now turning to ON")

    		if !DenyOnPosition
    				; Not denying the ON Position, set to ON
    				debug.trace(self + "Not denying on position, so set to ON")
		    	OnPosition = TRUE
		    	BeenTurnedOn = TRUE

		    	if (OnTrigger)
		    		OnTrigger.Activate(akActionRef)
		    	endif

		    else
		    		; We ARE denying the ON Position, switch back to OFF and display message
		    		debug.trace(self + "Denying ON position, flippin back to OFF")
		    	DenyOnPositionMessage.Show()
		    	Breaker.PlayAnimationAndWait("play01","done")
		    endif

	    else
	    		; In ON Position.  Moved to OFF Position
	    		debug.trace(self + "Was ON, now turning to OFF")
	    	OnPosition = FALSE
	    	BeenTurnedOn = FALSE

	    	if (OffTrigger)
	    		OffTrigger.Activate(akActionRef)
	    	endif

	    endif

	    if LockToOnPosition && OnPosition && BeenTurnedOn
	    		debug.trace(self + "In ON position, and supposed to LOCK")
	    		; In ON position, and supposed to stay here.  Stay in DoNothing STATE
	    else
	    		; In ON position, and not supposed to lock here, go to WaitingForActivate STATE
	    		debug.trace(self + "In ON position, and NOT supposed to LOCK")
	    	GoToState("WaitingForActivate")
	    endif

	endif
EndFunction