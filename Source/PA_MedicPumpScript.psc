Scriptname PA_MedicPumpScript extends ActiveMagicEffect

Float Property minHealthPercent = 0.5 Auto Const
ActorValue Property Health Auto
Potion Property Stimpak Auto Const

Float myHealth
Actor myActor
float StimpakDelayTime = 5.0
int StimpakDelayID = 58618

Event OnEffectStart(Actor akTarget, Actor akCaster)
	myActor = akTarget
	RegisterForHitEvent(myActor)	
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(objectReference akTarget, objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	myHealth = myActor.GetValuePercentage(Health) as float
	;debug.trace(self + "Health percentage =" + myHealth)
	
	;If the health is below threshold and inventory has stimpaks, use a stimpak
	if (myHealth < minHealthPercent && myActor.GetItemCount(Stimpak) > 0)
		myActor.EquipItem(Stimpak)
		;Run a timer for the next registered hit so we don't trigger multiple stimpaks close together
		StartTimer(StimpakDelayTime, StimpakDelayID)
	else
		RegisterForHitEvent(myActor)
	endif
EndEvent

Event OnTimer(Int aiTimerID)
	if aiTimerID == StimpakDelayID
		RegisterForHitEvent(myActor)
	endif
EndEvent