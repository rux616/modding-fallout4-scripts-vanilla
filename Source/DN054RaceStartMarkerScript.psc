Scriptname DN054RaceStartMarkerScript extends ObjectReference 

ObjectReference property raceEndTrigger auto 
scene property DN054RaceLost auto


auto State waiting
Event OnTriggerEnter(ObjectReference akActionRef)
    raceEndTrigger.enable()
    goToState("raceState")
endEvent
endState

state raceState
	Event OnBeginState(string asOldState)
	  	utility.wait(6)
	  	DN054RaceLost.start()
		raceEndTrigger.disable()
		goToState("waiting")  
	EndEvent
endState