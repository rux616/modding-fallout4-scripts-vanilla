Scriptname MrHandyScript extends Actor Const
{Handles injured limb data for MrHandy}

;ActorValue Property LeftAttackCondition Auto const
;ActorValue Property RightAttackCondition Auto const
;ActorValue Property AttackConditionAlt1 Auto const
;ActorValue Property AvailableCondition2 Auto const
;ActorValue Property AvailableCondition3 Auto const
;ActorValue Property PerceptionCondition Auto const
ActorValue Property LeftMobilityCondition Auto const

;commenting out HEAL actions, since robots should never need to play healing animations
;Action Property ActionLeftArmHeal Auto const
;Action Property ActionRightArmHeal Auto const
;Action Property ActionAvailableCondition1Heal Auto const
;Action Property ActionAvailableCondition2Heal Auto const
;Action Property ActionAvailableCondition3Heal Auto const
;Action Property ActionPerceptionHeal Auto const

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	if abCrippled == 1.0
		if akActorValue == LeftMobilityCondition
			debug.trace("LeftMobilityCondition crippled")
			SetAnimationVariableInt("iState", 1)
		endif								
	endif
	if abCrippled == 0.0
		if akActorValue == LeftMobilityCondition
	    	debug.trace("LeftMobilityCondition healed")
			SetAnimationVariableInt("iState", 0)
	    endif
	endif
EndEvent