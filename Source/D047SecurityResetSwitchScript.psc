Scriptname D047SecurityResetSwitchScript extends ObjectReference
;script for switch used to reset security system at Four Leaf Fishpacking. Opens secret door and resets all tripwires

ObjectReference property secretDoor auto
ObjectReference property firstTripwire auto

Event onActivate(ObjectReference akActionRef)
	;open secret door
	secretDoor.setOpen()
	;reset all tripwires
	firstTripwire.reset()
	;while loop to cycle through linked ref chain of tripwires
	int numLinkedRefs = countLinkedRefChain()
	int tripwireID = 0
	while tripwireID <= numLinkedRefs
		firstTripwire.getNthLinkedRef(tripwireID).reset()
		tripwireID = tripwireID + 1
	endwhile
EndEvent