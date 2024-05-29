Scriptname FXCriticalCryoScript extends ActiveMagicEffect

{Scripted effect for on death ash pile}

import debug
import FormList

;======================================================================================;
;  PROPERTIES  /
;=============/

float property fDelay = 2.0 auto 

float property fDelayEnd = 2.0 auto 

float property ShaderDuration = 0.00 auto 

float property ShaderDurationShatter = 0.00 auto 
									{Duration of Effect Shader.}
EffectShader property MagicEffectShader auto 
									{The Effect Shader we want.}
EffectShader property MagicEffectShaderShatter auto 

bool  property onEffectStartOveride = FALSE auto



;======================================================================================;
;  VARIABLES   /
;=============/

actor victim

string[] limbNameArray
int currentElement = 0
bool bfrozen = FALSE ;True after actor's critical stage is set to CritStage_FreezeStart

;======================================================================================;
;   EVENTS     /
;=============/
Event OnInit()
	limbNameArray = new string[6]

	limbNameArray[0] = "RightArm1"
	limbNameArray[1] = "Head1"
	limbNameArray[2] = "LeftArm1"
	limbNameArray[3] = "Head2"
	limbNameArray[4] = "LeftLeg1"
	limbNameArray[5] = "RightLeg1"

	victim = GetTargetActor()
EndEvent


Event OnEffectStart(Actor Target, Actor Caster)
	if onEffectStartOveride == TRUE
		victim.SetCriticalStage(victim.CritStage_FreezeStart)
		bfrozen = TRUE

		if	MagicEffectShader != none
			MagicEffectShader.play(victim, ShaderDuration)
		endif

		StartTimer(fDelay, 1)
	endif
EndEvent


Event OnDying(Actor Killer)
	if onEffectStartOveride == FALSE
		victim.SetCriticalStage(victim.CritStage_FreezeStart)
		bfrozen = TRUE

		if	MagicEffectShader != none
			MagicEffectShader.play(victim, ShaderDuration)
		endif

		StartTimer(fDelay, 1)
	EndIf
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	; If the effect is ending before the target has been unfrozen, make sure to unfreeze them.
	if bfrozen == TRUE
		victim.SetCriticalStage(Victim.CritStage_FreezeEnd)
		bfrozen = FALSE
	endif
EndEvent


Event OnTimer(int aiTimerID)
	If aiTimerID == 1
  		if (currentElement < (limbNameArray.Length - 2))
    		Victim.Dismember(limbNameArray[currentElement], False, True)
    		Victim.Dismember((limbNameArray[currentElement + 1]), False, True)
    		currentElement += 2
	   		StartTimer(Utility.RandomFloat(0.01, 0.2) , 1)
	   	else
			Victim.Dismember(limbNameArray[currentElement], False, True)
	   		;Victim.Dismember("Torso", True, True)
	   		;Victim.SetCriticalStage(Victim.CritStage_FreezeEnd)
	   		;if	MagicEffectShaderShatter != none
			;	MagicEffectShaderShatter.play(Victim, ShaderDuration)
			;endif
	   		StartTimer(fDelayEnd, 2)
	   	endif
	endif

	If aiTimerID == 2
		victim.SetCriticalStage(Victim.CritStage_FreezeEnd)
		bfrozen = FALSE
	endif

EndEvent


