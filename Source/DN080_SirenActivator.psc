Scriptname DN080_SirenActivator extends ObjectReference
{Script to enable/disable siren in Lynn Woods}
Group OptionalProperties
	Bool Property OnPosition Auto Conditional
	{Whether this switch is in ON position or not, (Default: FALSE)
 	Also, updates every time the switch is flipped.}
EndGroup

Group NoTouchy CollapsedOnRef
	Sound Property mySound Auto Const
	{Sound to play at each light when turned on}

	Keyword Property LinkCustom01 Auto Const
	{Link to the Breaker}

	Keyword Property LinkCustom02 Auto Const
	{Link to enable/disable when switch is turned on/off}

	Keyword Property LinkCustom03 Auto Const
	{Link to marker where the sound is played}

	Keyword Property LinkCustom04 Auto Const
	{Link to marker we want to enable when the siren is turned on the fist time}

	Message Property myMessage Auto Const
	{Message to display when Player tries to turn siren back on before siren has finished sound}

EndGroup

ObjectReference Breaker
ObjectReference EnableMarker
ObjectReference SoundMarker
ObjectReference EnableOnceMarker
int mySoundID
Bool doOnceEnable = FALSE
Bool doOnceAnimation = FALSE
int myTimer = 11
int myTimerID = 0
bool myTimerActive = FALSE

;**********************************************************

Event OnInit()
    Breaker = GetLinkedRef(LinkCustom01)
    EnableMarker = GetLinkedRef(LinkCustom02)
    SoundMarker = GetLinkedRef(LinkCustom03)
    EnableOnceMarker = GetLinkedRef(LinkCustom04)
EndEvent

;**********************************************************

Event OnLoad()
	RegisterForRemoteEvent(Breaker, "OnActivate")

    if OnPosition
    	if(!doOnceAnimation)
    		doOnceAnimation = TRUE
    		Breaker.playAnimation("play01")
    	endif
    	myTimerActive = TRUE
		StartTimer(myTimer, myTimerID)
		mySoundID = mySound.play(SoundMarker)
    else
    	myTimerActive = FALSE
    	CancelTimer(myTimerID)
		Sound.StopInstance(mySoundID)
	endif
EndEvent

Event OnUnload()
	myTimerActive = FALSE
	CancelTimer(myTimerID)
	Sound.StopInstance(mySoundID)
EndEvent

Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
	;do nothing
EndEvent
;**********************************************************

Auto State WaitingForActivate

	Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)

		if akSender == Breaker
			GoToState("DoNothing")

		    if !OnPosition
		    	if(myTimerActive == TRUE)
		    		;display a message
		    		myMessage.show()
		    	else
		    		Breaker.PlayAnimationAndWait("play01","done")
		    		;siren ready to be turned back on
		    		;In OFF Position.  Moved to ON Position
		    		OnPosition = TRUE

			    	if (EnableMarker)
			    		EnableMarker.enable(0)
			    		myTimerActive = TRUE
			    		StartTimer(myTimer, myTimerID)
			    		mySoundID = mySound.play(SoundMarker)
			    	endif

			    	if(EnableOnceMarker && !doOnceEnable)
			    		doOnceEnable = TRUE
			    		EnableOnceMarker.enable(0)
			    	endif
			    endif
		    else
		    	Breaker.PlayAnimationAndWait("play01","done")
		    	; In ON Position.  Moved to OFF Position
		    	OnPosition = FALSE
		    	;debug.notification("just turned off")
		    	if (EnableMarker)
		    		EnableMarker.disable(0)
		    		Sound.StopInstance(mySoundID)
		    	endif
		    endif
		    GoToState("WaitingForActivate")
	   endif
	EndEvent
EndState

;**********************************************************

State DoNothing
	Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
		;do nothing
	EndEvent	
EndState

;**********************************************************

Event OnTimer(int aiTimerID)
    if (aiTimerID == myTimerID)
    	if(OnPosition == FALSE)
    		;player has turned off the circuit breaker so don't repeat sound
    		myTimerActive = FALSE
    	else
    		;the circuit breaker is still on, so restart timer
    		StartTimer(myTimer, myTimerID)
    	endif
	endif
EndEvent

;**********************************************************