Scriptname RoachScareScript extends ObjectReference
{Scares a linked chain of roaches}

;Flee for when weapons are fired or trigger is entered
customEvent flee
;Flee for when weapons are fired or trigger is entered
customEvent safe



Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == game.getPlayer()
		debug.trace("triggeredddddddddddddddddddddddddddddddddddddddddd")
		SendCustomEvent("flee")
	endIf
EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	   ;;If it is the player toggle the bool and make crows safe  in critter script
	    if akActionRef == game.getPlayer()
	    debug.trace("triggereddddununununununununununununununununununununun")
		    SendCustomEvent("safe")	
		endIf	
	EndEvent

