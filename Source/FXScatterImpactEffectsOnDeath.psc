Scriptname FXScatterImpactEffectsOnDeath extends ActiveMagicEffect 
{Script for spraying splatter during gooification crit effect.}

ImpactDataSet Property SplatterImpactData Auto

int Property decalCount = 5 auto

Float Property StartDelay = 0.1 auto
Float Property DelayRandMin = 0.05 auto
Float Property DelayRandMax = 0.2 auto
bool  property onEffectStartOveride = FALSE auto

actor Victim
bool timerRunning = FALSE

;======================================================================================;
;   EVENTS     /
;=============/

Event Oninit()
	victim = getTargetActor()
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)
	if onEffectStartOveride == TRUE
		timerRunning = TRUE
		StartTimer(StartDelay, 1)
		debug.trace("SPRAYER::: Spraying")
	endif
EndEvent

Event OnDying(Actor Killer)
	if onEffectStartOveride == FALSE
		timerRunning = TRUE
		StartTimer(StartDelay, 1)
		debug.trace("SPRAYER::: Spraying")
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if timerRunning		
	  If aiTimerID == 1
	    victim.PlayImpactEffect(SplatterImpactData, "SprayHelperNode", Utility.RandomFloat(-0.8, 0.8), Utility.RandomFloat(-0.75, 0.75), -1.0, 320, false, true)
	    if decalCount > 0 
	    	decalCount -= 1
	   		StartTimer(Utility.RandomFloat(DelayRandMin, DelayRandMax) , 1)
	   	endif
	endif
  EndIf
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	timerRunning = FALSE
EndEvent