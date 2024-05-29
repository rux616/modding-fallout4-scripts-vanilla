ScriptName DN136_RemoveRadiationTriggerScript extends ObjectReference
{removes radiation by x amount per second while player is in the trigger}

import debug

ActorValue property Rads auto const
Int property restoreAmountPerSecond = 50 auto

int myTimerID = 0
bool inTrigger = FALSE

;************************************

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == game.GetPlayer())
		inTrigger = TRUE
		StartTimer(1, myTimerID)
	endif
EndEvent

;************************************

Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == game.GetPlayer())
		inTrigger = FALSE
		CancelTimer(myTimerID)
	endif
EndEvent

;************************************

event OnTimer(int timerID)
	if(timerID == myTimerID)
     	if(InTrigger == TRUE)
     		int RadsToHeal = (game.GetPlayer().GetValue(Rads) as int)
     		if(RadsToHeal > restoreAmountPerSecond)
     			game.GetPlayer().RestoreValue(Rads, restoreAmountPerSecond)
     		else
     			game.GetPlayer().RestoreValue(Rads, RadsToHeal)
     		endif
     		StartTimer(1, myTimerID)
     	endif
    endif
endEvent

;************************************