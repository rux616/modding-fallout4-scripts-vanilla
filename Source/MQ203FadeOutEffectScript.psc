Scriptname MQ203FadeOutEffectScript extends ActiveMagicEffect

float alpha = 1.0
bool finished = false
float timeInterval = 0.1

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + " OnEffectStart")
    StartTimer(timeInterval)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace(self + " OnEffectFinish")
	finished = true
	CancelTimer()
    akTarget.SetAlpha(1.0)
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer")
    if finished == false
		alpha += -0.1
		debug.trace(self + " setting alpha to " + alpha)
    	GetTargetActor().SetAlpha(alpha)
    	if alpha > 0
    		StartTimer(timeInterval)
    	endif
    endif
EndEvent