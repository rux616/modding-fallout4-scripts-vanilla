Scriptname DN078DirtWallTriggerScript extends ObjectReference 

ObjectReference property workerTravelMarker auto
ObjectReference property digTrigger auto
Message property DigWallMessage auto
Int ButtonPressed = 0

auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == game.getPlayer()
			ButtonPressed = DigWallMessage.Show()
				If ButtonPressed == 1
	    			workerTravelMarker.moveto(digTrigger)
		    		self.disable()
		    	Else
		    		;do nothing
				endif
    	endif
	EndEvent
endState
