Scriptname BoS302BWallDetonatorScript extends ObjectReference 

Sound Property OBJExplosiveArmLP Auto Mandatory

auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == game.getPlayer()
			int instanceID = OBJExplosiveArmLP.Play(self)
			utility.wait(4)
			Sound.StopInstance(instanceID)
	    	self.getLinkedRef().playAnimation("Stage2")
	    	self.getLinkedRef().getLinkedRef().Disable()
	    	self.disable()
	    	gotoState("Done")
	    endif
	EndEvent
endstate


state Done
endState