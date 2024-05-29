Scriptname ashPileOnDeathSCRIPT extends ActiveMagicEffect
{Script for spraying splatter during gooification crit effect.}


import debug
import FormList

IMPACTDATASET PROPERTY SplatterImpactData AUTO

INT PROPERTY decalCount = 5 AUTO
FLOAT PROPERTY DelayRandMin = 0.05 AUTO
FLOAT PROPERTY DelayRandMax = 0.2 AUTO

FLOAT PROPERTY ShaderDuration = 0.00 auto
{Duration of Effect Shader.}

ACTIVATOR PROPERTY AshPileObject auto
{The object we use as a pile.}

EFFECTSHADER PROPERTY MagicEffectShader auto
{The Effect Shader we want.}

BOOL PROPERTY bSetAlphaZero = True auto
{When done, set the Actor Alpha to zero.}


ACTOR Victim
BOOL timerRunning = FALSE

EVENT OnEffectStart(Actor Target, Actor Caster)
	victim = target

ENDEVENT

Event OnDying(Actor Killer)

	IF victim.IsEssential() == False
		victim.SetCriticalStage(victim.CritStage_DisintegrateStart)
		
		IF	MagicEffectShader != none
			MagicEffectShader.play(victim, ShaderDuration)
		ENDIF
		
		utility.wait(1)

		Victim.AttachAshPile(AshPileObject)

		victim.PlayImpactEffect(SplatterImpactData, "SprayHelperNode", Utility.RandomFloat(-0.8, 0.8), Utility.RandomFloat(-0.75, 0.75), -1.0, 320, false, true)
	    if decalCount > 0 
	    	decalCount -= 1
	   		StartTimer(Utility.RandomFloat(DelayRandMin, DelayRandMax) , 1)
	   	endif

		utility.wait(0.75)

		IF	MagicEffectShader != none
			MagicEffectShader.stop(Victim)
		ENDIF

		IF bSetAlphaZero == True
			victim.SetAlpha (0.0,True)
		ENDIF

		victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)

	ENDIF

EndEvent