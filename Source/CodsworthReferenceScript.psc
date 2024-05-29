Scriptname CodsworthReferenceScript extends Actor


bool Property IsDamaged auto

Event OnLoad()
	if (IsDamaged)
		WaitFor3DLoad()
		Damage()
	endif
EndEvent

Function Damage()
	Debug.Trace("Damaging Codsworth...")

	; DamageAV("LeftMobilityCondition", 105)

	; temp until we get the animation variables hooked up to ActorValues
	; SetAnimationVariableFloat("bAttack1Damage", 		1.0)
	; SetAnimationVariableFloat("bAttack2Damage", 		1.0)
	; SetAnimationVariableFloat("bAttack3Damage", 		1.0)
	; SetAnimationVariableFloat("bPerception1Damage", 	1.0)
	; SetAnimationVariableFloat("bPerception2Damage", 	1.0)
	; SetAnimationVariableFloat("bPerception3Damage", 	1.0)	
EndFunction
