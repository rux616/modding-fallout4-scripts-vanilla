Scriptname DN092_IntercomAlias_Script extends ReferenceAlias

scene property myScene auto const
bool property bLoop auto const

objectReference property myTrigger auto const

int timer = 1 const

;objectReference property myTrigger auto


Event OnCellLoad()
	debug.trace("DN092: Intercom Trigger onCellLoad(): "+self+"/"+self.getReference().getLinkedRef())
	;myTrigger = self.getReference().getLinkedRef()
    registerForRemoteEvent(myTrigger, "OnTriggerEnter")

   	registerForRemoteEvent(myScene, "OnEnd")
EndEvent

Event OnLoad()
	debug.trace("DN092: Intercom Trigger onLoad(): "+self+"/"+self.getReference().getLinkedRef())
	;myTrigger = self.getReference().getLinkedRef()
    registerForRemoteEvent(myTrigger, "OnTriggerEnter")

   	registerForRemoteEvent(myScene, "OnEnd")
EndEvent

Event objectReference.onTriggerEnter(ObjectReference akSender, ObjectReference actronaut)
	debug.trace("DN092: Intercom Trigger has been entered: "+self+"/"+self.getReference().getLinkedRef())
	if actronaut as actor == game.getPlayer() && !myScene.isPlaying()
		debug.trace("DN092: player detected, begin "+myScene)
		myScene.start()
	endif
endEVENT

EVENT scene.OnEnd(scene sceneEnding)
	debug.trace("DN092: Scene "+sceneEnding+" is ending")
	if (myTrigger as DN092_TriggerStatusScript).bPlayerWithin > 0 && bLoop
		debug.trace("DN092: Now restarting "+sceneEnding)
		startTimer(1, timer)
	else
		debug.trace("DN092: Not restarting "+sceneEnding)
	endif
endEVENT

Event OnTimer(int aiTimerID)
    if aiTimerID == timer
    	myScene.start()
    endif
EndEvent