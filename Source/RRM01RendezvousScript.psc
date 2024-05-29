Scriptname RRM01RendezvousScript extends ObjectReference Conditional
; This is the trigger outside the rendezvous location. 
; Controls when Stockton and H2-22 show up (only at night)

Quest Property pRRM01 Auto Const

int bInsideTrigger

auto State WaitingForNight
	Event OnBeginState(string asOldState)
		float myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
	  	Debug.Trace("Current time: " + myTime)

	  	if ( pRRM01.GetStageDone(400) )		; Are all the raiders killed?
			if( (myTime < 0.25) || (myTime > 0.75) )	; This means it's night
				pRRM01.SetStage(410)	; It's night and the raiders are dead, they show up
				Delete()				
			endif
	  	endif
	  	
	  	Utility.Wait(5.0)
	  	if ( bInsideTrigger )		; If the player is still inside the trigger, loop
	  		GoToState("WaitingForNight")
	  	endif
	EndEvent
EndState

Event OnTriggerEnter(ObjectReference akActionRef)

	if ( Game.GetPlayer() == akActionRef )
		if ( pRRM01.GetStage() > 0 )	; Is "Boston After Dark" running
			bInsideTrigger = 1			; Player is in trigger
			GoToState("WaitingForNight")
		endif
	endif

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	if ( Game.GetPlayer() == akActionRef )
		bInsideTrigger = 0				; Player is outside trigger
	endif

EndEvent