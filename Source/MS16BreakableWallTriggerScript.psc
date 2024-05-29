Scriptname MS16BreakableWallTriggerScript extends ObjectReference 

auto state waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
		if akActionRef == game.getplayer()
			self.disable(true)
		    getLinkedRef().disable()
		    gotoState("Done")
		endif
	EndEvent
endState

State Done
	;Do Nothing
endstate