Scriptname VertibirdMobilityScript extends Actor Const

Idle Property VertibirdInjuredStop Auto Const
Idle Property VertibirdInjuredStart Auto Const
ActorValue Property AvailableCondition1 Auto const
ActorValue Property AvailableCondition2 Auto const
ActorValue Property RotationSpeedCondition Auto const

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	if abCrippled == 1.0
		if akActorValue == AvailableCondition1
	    	debug.trace("AvailableCondition1 damaged")
	        self.PlayIdle(VertibirdInjuredStart)
	    endif
		if akActorValue == AvailableCondition2
	    	debug.trace("AvailableCondition2 damaged")
	        self.PlayIdle(VertibirdInjuredStart)
	    endif
	    if akActorValue == RotationSpeedCondition
	    	debug.trace("RotationSpeedCondition damaged")
	        self.PlayIdle(VertibirdInjuredStart)
	    endif
	elseif abCrippled == 0.0
		if akActorValue == AvailableCondition1
	    	debug.trace("AvailableCondition1 healed")
	        self.PlayIdle(VertibirdInjuredStop)
	    endif
		if akActorValue == AvailableCondition2
	    	debug.trace("AvailableCondition2 healed")
	        self.PlayIdle(VertibirdInjuredStop)
	    endif
	    if akActorValue == RotationSpeedCondition
	    	debug.trace("RotationSpeedCondition healed")
	        self.PlayIdle(VertibirdInjuredStop)
	    endif
	endif
EndEvent