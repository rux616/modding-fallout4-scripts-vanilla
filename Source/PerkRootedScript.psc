Scriptname PerkRootedScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForHitEvent(akTarget)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if akSource.Haskeyword(WeaponTypeMelee1H) || akSource.Haskeyword(WeaponTypeMelee2H)
		if Utility.RandomFloat() <= ChanceDisarm
			DisarmSpell.cast(akTarget, akAggressor)
		endif
	endif
EndEvent

SPELL Property DisarmSpell Auto Const
Keyword Property WeaponTypeMelee1H Auto Const
Keyword Property WeaponTypeMelee2H Auto Const
Float Property ChanceDisarm Auto Const
