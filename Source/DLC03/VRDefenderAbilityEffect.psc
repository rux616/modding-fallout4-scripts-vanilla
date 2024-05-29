Scriptname DLC03:VRDefenderAbilityEffect extends ActiveMagicEffect

float property bleedoutTime = 5.0 auto const
{ how many seconds before repair myself }

Actor myActor

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	; set unconscious until I'm repaired
	myActor = akTarget
	debug.trace(self + " OnEffectStart " + myActor)
	if myActor is DLC03:VRDefenderScript
		(myActor as DLC03:VRDefenderScript).HandleBleedout()
		debug.trace(self + " IsUnconscious=" + myActor.IsUnconscious())
	endif
	; run timer to repair me
	StartTimer(bleedoutTime)
	debug.trace(self + " STARTED TIMER. IsUnconscious=" + myActor.IsUnconscious())
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer: myActor=" + myactor + " IsUnconscious=" + myActor.IsUnconscious() + ", IsBleedingOut=" + myActor.IsBleedingOut())
	if myActor.IsBleedingOut()
		debug.trace(self + " REPAIR ME")
		if myActor is DLC03:VRDefenderScript
			(myActor as DLC03:VRDefenderScript).HandleBleedout(false)
		endif
	endif
endEvent


