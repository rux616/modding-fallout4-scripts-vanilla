Scriptname AbLegendaryScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForHitEvent(akCaster)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if akTarget.GetValuePercentage(Health) < HealthThreshhold && PoweredUp == false
		LegendaryPowerUp.cast(akTarget, akTarget)
		if (akTarget as Actor).GetCombatTarget() == Game.GetPlayer()
			LegendaryPowerUpMsg.Show()
			PowerUpSound.Play(akTarget)
		endif
		PoweredUp = true
	else
		RegisterForHitEvent(akTarget)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForHitEvent(akCaster)
EndEvent

bool Property PoweredUp Auto

SPELL Property LegendaryPowerUp Auto Const
ActorValue Property Health Auto Const
Float Property HealthThreshhold Auto Const
Message Property LegendaryPowerUpMsg Auto Const
Sound Property PowerUpSound Auto Const
