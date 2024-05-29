Scriptname DN050SafetyTriggerScript extends ObjectReference 

ObjectReference property contraband01 auto
ObjectReference property contraband02 auto
ObjectReference property contraband03 auto
quest property DN050 auto

bool gone01 = false
bool gone02 = false
bool gone03 = false


Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == contraband01 
		gone01 = true
	elseif akActionRef == contraband02
		gone02 = true
	elseif akActionRef == contraband03
		gone03 = true 
    endif
    if gone01 == true && gone02 == true && gone03 == true
    	DN050.setstage(45)
    endif
EndEvent

Event onTriggerEnter(ObjectReference akActionRef)
	if akActionRef == contraband01 
		gone01 = false
	elseif akActionRef == contraband02
		gone02 = false
	elseif akActionRef == contraband03
		gone03 = false
    endif
EndEvent

