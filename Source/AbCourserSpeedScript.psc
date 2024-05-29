Scriptname AbCourserSpeedScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForHitEvent(akCaster)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if akTarget.GetValuePercentage(Health) < HealthThreshhold && PoweredUp == false
		CourserPowerUp.cast(akTarget, akTarget)
		PoweredUp = true
	else
		RegisterForHitEvent(akTarget)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForHitEvent(akCaster)
EndEvent

bool Property PoweredUp Auto

SPELL Property CourserPowerUp Auto Const
ActorValue Property Health Auto Const
Float Property HealthThreshhold Auto Const
