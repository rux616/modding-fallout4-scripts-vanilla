Scriptname RR303ExplodingDoorTriggerScript extends ObjectReference 
 
ObjectReference property  RR303BrotherHoodAssaultEnabler01 auto


auto State Waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
		if akActionRef == game.getPlayer()
			RR303BrotherHoodAssaultEnabler01.Enable()
			utility.wait(1)
	    	self.getLinkedRef().playAnimation("Stage2")
	    	self.getLinkedRef().getLinkedRef().Disable()
	    	gotoState("Done")
	    endif
	EndEvent
endstate


state Done
endState