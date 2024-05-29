Scriptname MS16SceneStartTriggerScript extends ObjectReference 

scene property sceneToPlay auto 
quest property MS16quest auto mandatory

Event  OnTriggerEnter(ObjectReference akActionRef)
	if MS16quest.getstage() < 200 && akActionRef == game.getPlayer() 
    	sceneToPlay.start()
    	self.disable()
    	if getLinkedRef() != none
    		getLinkedRef().disable()
    	endif
	endif
EndEvent

