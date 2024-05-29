Scriptname DLC03:dlc03_Legendary_OnMeleeEffect extends ActiveMagicEffect

Keyword Property WeaponTypeHandtoHand         const auto mandatory
Keyword Property WeaponTypeUnarmed            const auto mandatory
Keyword Property WeaponTypeMelee1H            const auto mandatory
Keyword Property WeaponTypeMelee2H            const auto mandatory
Spell   Property SpellToCast                  const auto mandatory
float   Property ChanceToCast         = 1.0   const auto
bool    Property IsSelfCast           = false const auto
float   Property Cooldown             = 60.00 const auto
int              TimerID              = 1     const
bool             OnCooldown           = false

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	; Register for a hit event on successful melee.
	RegisterForHitEvent(akTarget)
	; Debug.Trace("ON INIT!")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	; If we are not on cooldown and this is a melee, we are GO!
	if (!OnCooldown && (akSource.haskeyword(WeaponTypeHandtoHand) || akSource.haskeyword(WeaponTypeUnarmed)  || akSource.haskeyword(WeaponTypeMelee1H) || akSource.haskeyword(WeaponTypeMelee2H)))
		if (ChanceToCast >= Utility.randomfloat(0.0, 1.0))
			; If the player was melee'd and successfully rolled the dice, cast the spell.
			if !IsSelfCast
				; Onto my attacker...
				SpellToCast.cast(akTarget, akAggressor)
			else
				; Onto myself...
				SpellToCast.cast(akTarget, akTarget)
			endif
			; Take a breather, think about what you've done and prepare the next dose.
			OnCooldown= true
			StartTimer(Cooldown, TimerID)
		endif
		;Debug.Trace("MELEE'D!")
	endif
	; Re-register for a hit event on melee.
	RegisterForHitEvent(akTarget)
EndEvent

Event OnTimer(int aiTimerID)		
	If aiTimerID == TimerID
		OnCooldown= false
	EndIf
EndEvent