Scriptname DN005_ButtonActivator extends ObjectReference
{Button that when activated, enables/disables its linked ref and plays a sound}

Group Required_Properties

	string property Anim = "stage2" auto const
	{Anim to play when this is activated.}

	Sound property mySoundOpen auto const
	{Sound to play when enabled}

	Sound property mySoundClose auto const
	{Sound to play when disabled}

	ObjectReference property mySoundMarker auto const
	{where the sound should play from}
	
EndGroup

Bool bEnabled = FALSE
;********************************

Auto State Waiting

	Event OnActivate(ObjectReference akActionRef)
	    GotoState("Busy")
	    playAnimation(Anim)
	    if(bEnabled == TRUE)
	    	bEnabled = FALSE
	    	mySoundClose.Play(mySoundMarker)
	    	Self.GetLinkedRef().disable()
	    else
	    	bEnabled = TRUE
	    	mySoundOpen.Play(mySoundMarker)
	    	Self.GetLinkedRef().Enable()
	    endif
	    Utility.Wait(1.0)
	    GotoState("Waiting")

	EndEvent
endState

;********************************

State Busy
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;********************************