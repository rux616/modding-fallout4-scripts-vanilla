Scriptname DN157BulkheadActivator extends ObjectReference 

message property DN157BulkheadMessage auto
ObjectReference property enabler auto
Int ButtonPressed = 0


auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == game.getPlayer()
			ButtonPressed = DN157BulkheadMessage.Show()
				If ButtonPressed == 1
					enabler.enable()
					gotostate("Done")
		    	Else
		    		;do nothing
				endif
    	endif
	EndEvent
endState

state Done
	;do nothing
endState