Scriptname DLC04:AbDLC04_SwarmDeath extends ActiveMagicEffect

;Explosion Property onDeathExplosionFX auto Const
{Explosion FX for when they die, if they don't explode on death, leave blank}

ActorValue Property Health Auto Const
float HealthThreshold = 1.0
float fSpeed = 2.0


Function ExplodeOnDeath(Actor selfRef)
	;dismember each limb so that they explode

    selfRef.Dismember ("Head1", true, false, false)
    selfRef.Dismember ("Head2", true, false, false)
	selfRef.Dismember ("LeftArm1", true, false, false)
	selfRef.Dismember ("RightArm1", true, false, false)
	selfRef.Dismember ("LeftArm2", true, false, false)
	selfRef.Dismember ("Torso", true, false, false)

    ;place a final explosion -- this may be unnecessary
    ;selfRef.placeAtMe(onDeathExplosionFX)
endFunction


Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
	ExplodeOnDeath(SelfRef)
EndEvent

;------------------------------------------------
;------------------------------------------------
;Add support for modulating the playback speed of the Swarm's Idle, which is driven by the graph variable "_Speed" so that ths swarm increases its speed based on the amount of damage it has received
;Do this via OnHit events
;------------------------------------------------
;------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForHitEvent(akCaster)
	fSpeed = utility.RandomFloat(fspeed * 0.75, fSpeed * 1.5) ;This will provide some randomness to indivdual swarm's base _Speed value, to provide visual variety
	akTarget.SetAnimationVariableFloat("_Speed", fSpeed)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if akTarget.GetValuePercentage(Health) < HealthThreshold
		fSpeed += 0.5 
		HealthThreshold += -0.2
		akTarget.SetAnimationVariableFloat("_Speed", fSpeed)		
		if HealthThreshold >= 0.2 && fSpeed <= 5.0 ;if the speed mult goes greater than 5, it begins to look silly -- this condition will prevent the event from re-registering if the speed gets too high or else the remaining health goes below 20%
			RegisterForHitEvent(akTarget)
		endif
	else
		RegisterForHitEvent(akTarget)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForHitEvent(akCaster)
EndEvent

