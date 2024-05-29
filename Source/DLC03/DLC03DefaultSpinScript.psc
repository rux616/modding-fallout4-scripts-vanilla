Scriptname DLC03:DLC03DefaultSpinScript extends ObjectReference Hidden

Float Property RotateSpeed = 3.0 auto
{Time, in seconds, it takes to spin all the way around one time.}

Bool Property bStartOn = TRUE auto

Bool Property bReverseSpin = FALSE auto


auto STATE StartingState
	Event OnLoad()
		GoToState("AlreadyStarted")
		if bStartOn
		    SetAnimationVariableFloat("fSpinDuration01", RotateSpeed)
		else
			SetAnimationVariableFloat("fSpinDuration01", 50000)
		endif
		if bReverseSpin
	    	SetAnimationVariableFloat("fSpinMultiplier01", -1)
	    else
	    	SetAnimationVariableFloat("fSpinMultiplier01", 1)
	    endif
	EndEvent
EndSTATE


STATE AlreadyStarted

EndSTATE

Function TurnOn()
	SetAnimationVariableFloat("fSpinDuration01", RotateSpeed)
	if bReverseSpin
    	SetAnimationVariableFloat("fSpinMultiplier01", -1)
    else
    	SetAnimationVariableFloat("fSpinMultiplier01", 1)
    endif
EndFunction

Function TurnOff()
	SetAnimationVariableFloat("fSpinDuration01", 50000)
EndFunction