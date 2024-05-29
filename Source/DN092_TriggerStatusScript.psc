Scriptname DN092_TriggerStatusScript extends ObjectReference

int property bPlayerWithin auto

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	bPlayerWithin += 1
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	bPlayerWithin -= 1
    endif
EndEvent
