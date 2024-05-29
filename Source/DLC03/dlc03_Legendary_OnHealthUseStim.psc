Scriptname DLC03:dlc03_Legendary_OnHealthUseStim extends ActiveMagicEffect

actorvalue Property Health                      const auto mandatory
potion     Property Stimpak                     const auto mandatory
spell      Property StimpakSpell                const auto mandatory
float      Property LowHealthPercentage =  0.25 const auto
float      Property Cooldown            = 60.00 const auto
int                 TimerID             = 1     const
bool                OnCooldown          = false

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	; Register for a hit event.
	RegisterForHitEvent(akTarget)
	; Debug.Trace("ON INIT!")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	; If we're not on cooldown, our health is low enough and we have a stimpak we are GO!
	if (!OnCooldown && (akTarget.GetValuePercentage(Health) <= LowHealthPercentage) && akTarget.GetItemCount(Stimpak))
		; Fake the stimpak using a spell to avoid the animation as your armor injects it.
		StimpakSpell.cast(akTarget, akTarget)
		; It does actually use a Stimpak though.
		aktarget.removeitem(Stimpak)
		; Take a breather, think about what you've done and prepare the next dose.
		OnCooldown= true
		StartTimer(Cooldown, TimerID)
	endif
	; Debug.Trace("BLOCKED!")
	; Re-register for a hit event.
	RegisterForHitEvent(akTarget)
EndEvent

Event OnTimer(int aiTimerID)		
	If aiTimerID == TimerID
		OnCooldown= false
	EndIf
EndEvent