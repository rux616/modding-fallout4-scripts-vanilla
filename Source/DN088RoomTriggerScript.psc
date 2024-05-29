Scriptname DN088RoomTriggerScript extends ObjectReference  

quest property DN088 auto ;advanced
scene property myScene auto
referencealias property Cooley auto
DN088script property questScript auto hidden

EVENT onTriggerEnter(ObjectReference actronaut)
	
	; see whether or not I have a quest script yet.
	if !questScript
			questScript = DN088 as DN088script
	endif

	; move the goal marker of Cooley's scene package to our linked marker
	questScript.CooleySceneGoal.moveTo(getLinkedRef())

	questScript.bInRoomScene = true
	myScene.start()
endEVENT

EVENT onTriggerLeave(ObjectReference actronaut)
	questScript.bInRoomScene = false
	myScene.stop()
endEVENT