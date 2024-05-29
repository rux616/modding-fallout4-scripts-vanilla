Scriptname HoveringActorScript extends Actor const




ActorValue Property LeftMobilityCondition Auto const
ActorValue Property RightMobilityCondition Auto const

Event OnCripple(ActorValue akActorValue, bool abCrippled)
    if akActorValue == LeftMobilityCondition || akActorValue == RightMobilityCondition
        if getValue (LeftMobilityCondition) <= 0.0 && getValue (RightMobilityCondition) <= 0.0
    		debug.trace("left or right wing is crippled")
        	PushActorAway(self, 1.0)
        endif
    endif
EndEvent