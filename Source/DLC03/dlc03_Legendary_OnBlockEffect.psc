Scriptname DLC03:dlc03_Legendary_OnBlockEffect extends ActiveMagicEffect

Spell Property SpellToCast        const auto mandatory
float Property ChanceToCast = 1.0 const auto

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	; Register for a hit event on successful block.
	RegisterForHitEvent(akTarget, None, None, None, 0, 0, 0, 1, true)
	; Debug.Trace("ON INIT!")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if abHitBlocked
		if (ChanceToCast >= Utility.randomfloat(0.0, 1.0))
			; If the player blocked and successfully rolled the dice, cast the spell.
			SpellToCast.cast(akTarget, akAggressor)
		endif
		; Debug.Trace("BLOCKED!")
	endif
	; Re-register for a hit event on successful block.
	RegisterForHitEvent(akTarget, None, None, None, 0, 0, 0, 1, true)
EndEvent