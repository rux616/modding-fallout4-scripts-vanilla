Scriptname DN009_ShutterScript extends ObjectReference Hidden Conditional

Group OptionalProperties
	Bool Property StartClosed = TRUE Auto Conditional
	{Default = TRUE}

	String Property myAnimation = "Play03" Auto Conditional
	{Default = Play01 (opens horizontal slightly) Play02 (opens horizontal all the way) Play03 (opens vertical)}

EndGroup

Bool Closed = TRUE

;**********************************************************

Event OnLoad()
	if(StartClosed == FALSE && Closed == TRUE)
		Closed = FALSE
		PlayAnimationAndWait(myAnimation, "done")
	endif
EndEvent

;**********************************************************

Auto State WaitingForActivate
	Event OnActivate(ObjectReference akActionRef)
		GoToState("DoNothing")

	    if(Closed == TRUE)
	    	Closed = FALSE
	    else
	    	Closed = TRUE
	    endif
	    
	    PlayAnimationAndWait(myAnimation, "done")

	    GoToState("WaitingForActivate")
	EndEvent
EndState

;**********************************************************

State DoNothing
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;**********************************************************