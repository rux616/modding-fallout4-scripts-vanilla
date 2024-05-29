Scriptname DN142_GearDoorConsoleScript extends ObjectReference

quest property DN142 Auto const
int property SceneNumber = 50 auto const

;/
Event Onload()
    Debug.trace(self + " is loaded")
    if (Self.PlayAnimationandWait("stage2", "end"))
    	debug.trace("Stage2 Animation played and ended")
    	;self.PlayAnimation("stage2loop")
    else
    	debug.trace("Stage2 Animation did not play")	
    endif 
EndEvent
/;

Event OnReset()
	Self.PlayAnimation("reset")
	gotostate("Start`q")    
EndEvent

Auto State Start
	Event OnActivate(ObjectReference akActionRef)
	    if (akActionRef == Game.GetPlayer())
	    	gotostate("Pressed")
	    	if (self.PlayAnimationandWait("stage2","end"))
				Debug.trace("Stage 2 Animation played and ended")
				if (self.PlayAnimationandwait("Stage3", "end"))
					Debug.trace("Stage 3 Animation played and ended")
				endif	    		
	    	endif
	    	dn142.setstage(SceneNumber)
	    endif
	EndEvent
EndState

State Pressed
	;/
	Event OnActivate(ObjectReference akActionRef)
	    if (akActionRef == Game.GetPlayer())
	    	if (self.PlayAnimationandWait("stage3","end"))
	    	endif
	    endif
	EndEvent
	/;
EndState

