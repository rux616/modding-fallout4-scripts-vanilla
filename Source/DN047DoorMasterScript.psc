Scriptname DN047DoorMasterScript extends ObjectReference 

;GlobalVariable property DN047LabDoorIsOpen auto mandatory
;GlobalVariable property DN047SystemOnGlobal auto mandatory
ObjectReference property DN047LabDoor auto mandatory

;ObjectReference property Tripwire01 auto
;ObjectReference property Tripwire02 auto
;ObjectReference property Tripwire03 auto
;ObjectReference property Tripwire04 auto
;ObjectReference property Tripwire05 auto

traptripwire [] property Tripwires auto mandatory

int currentSolution = 0 

State resetState
	;State to enter when the player activates the wrong tripwire. Resets all tripwires and goes to the begin state
	Event OnBeginState(string asOldState)
		int currentTripwire = 0 
		while currentTripwire < tripwires.length
			tripwires[currentTripwire].setArmed()
			currentTripwire += 1 
		endwhile
	    gotoState("active")
	EndEvent
EndState

auto state active
;using an array to determine the order in which the player needs to walk through 5 different tripwires to open a door 
;If the player walks through the wrong tripwire for the state they are in, the script goes back to "resetState" and all tripwires reset
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == tripwires[currentSolution]
			currentSolution += 1
			if currentSolution >= tripwires.length
				gotoState("doorOpen")
			endif
		else 
			currentSolution = 0
			gotoState("resetState")
		endif
	endEvent
endState


state doorOpen
	;Player finished the puzzle. Open the door to the chem lab and deactivate the puzzle
	Event OnBeginState(string asOldState)
		 ;if DN047SystemOnGlobal.getValue() == 1
		;    if DN047LabDoorIsOpen.getValue() == 1
		DN047LabDoor.setOpen(true)
		;    endif
		;endif
	EndEvent
endstate
