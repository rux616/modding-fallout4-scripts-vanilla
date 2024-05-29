Scriptname CircuitBreakerScript extends ObjectReference Hidden

Group OptionalProperties
	Keyword Property LinkCustom02 Auto Const
	{Link to activate when this switch is in the ON position}

	Keyword Property LinkCustom03 Auto Const
	{Link to activate whent his switch is in the OFF position}

	Bool Property OnPosition Auto
	{Whether this switch is in ON position or not, (Default: FALSE)
 Also, updates every time the switch is flipped.}

 	Bool Property DenyOnPosition Auto
 	{If this is TRUE then the switch will deny going into the ON position and force itself back into the OFF position, and display a message
  (Default = FALSE)}

 	Bool Property LockToOnPosition Auto
 	{If this is TRUE then the switch will lock into the ON position when switched ON (Unless DenyOnPosition TRUE)}
EndGroup

Group NoTouchy CollapsedOnRef
	Keyword Property LinkCustom01 Auto Const
	{Link to the door, leave this be.}
EndGroup

Event OnLoad()
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnOpen")
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnClose")
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnActivate")

    if GetLinkedRef(LinkCustom01).GetOpenState() == 1
    	BlockActivation(FALSE, FALSE)
    else
    	BlockActivation(TRUE, TRUE)
    endif

    if OnPosition
    	PlayAnimation("Play01")
    endif

EndEvent

Event ObjectReference.OnOpen(objectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef(LinkCustom01)
		; Lid has opened, allow normal activation no the switch
		BlockActivation(FALSE, FALSE)
	endif
EndEvent

Event ObjectReference.OnClose(objectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef(LinkCustom01)
		; Lid is closed, block all activation on the switch itself
		BlockActivation(TRUE, TRUE)
	endif
EndEvent

Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef(LinkCustom01)
		if GetLinkedRef(LinkCustom01).GetOpenState() < 3
    		BlockActivation(FALSE, FALSE)
    	else
    		BlockActivation(TRUE, TRUE)
   		endif
	endif
EndEvent


int tempcounter
Auto State WaitingForActivate

	Event OnActivate(ObjectReference akActionRef)
		GoToState("DoNothing")
		debug.trace(tempcounter + " OnActivate()")
		debug.trace(tempcounter + " Set STATE to DoNothing")
		debug.trace(tempcounter + " Starting Animation")
	    PlayAnimationAndWait("play01","done")
	    debug.trace(tempcounter + " Finished Animation")
	    if !OnPosition
	    	OnPosition = TRUE
	    	if (GetLinkedRef(LinkCustom02))
	    		debug.trace(tempcounter + " In ON Position")
	    		GetLinkedRef(LinkCustom02).Activate(akActionRef)
	    	endif
	    else
	    	OnPosition = FALSE
	    	if (GetLinkedRef(LinkCustom03))
	    		debug.trace(tempcounter + " In OFF Position")
	    		GetLinkedRef(LinkCustom03).Activate(akActionRef)
	    	endif
	    endif
	    debug.trace(tempcounter + " Set STATE back to WaitingForActivate")
	    GoToState("WaitingForActivate")
	    tempcounter = tempcounter + 1
	EndEvent

EndState



State DoNothing
	;Don't do a thing
EndState