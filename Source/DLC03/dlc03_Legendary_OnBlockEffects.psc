Scriptname DLC03:dlc03_Legendary_OnBlockEffects extends ActiveMagicEffect

; It's power is...  Dark.
struct BookOfSpells
	Spell SpellToCast
	float ChanceToCast = 1.0
endstruct

BookOfSpells[] Property SpellBook            const auto mandatory  ; List of Spells and their chance To Cast.
bool           Property ExclusiveCast = true const auto            ; Should we only allow one spell to trigger?
	
Event OnEffectStart(Actor akTarget, Actor akCaster) 
	; Register for a hit event on successful block.
	RegisterForHitEvent(akTarget, None, None, None, 0, 0, 0, 1, true)
	; Debug.Trace("ON INIT!")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if abHitBlocked
		int  i      = 0
		bool success= false
		; Iterate throught the spell book...
		while (i < SpellBook.length)
			if (SpellBook[i].ChanceToCast >= Utility.randomfloat(0.0, 1.0))
				; If the player blocked and successfully rolled the dice, cast the spell.
				SpellBook[i].SpellToCast.cast(akTarget, akAggressor)
				; Inform ourselves that a spell has been cast
				success= true
			endif
			; If we only want to case one spell && that's already happened, we're done here...
			if (ExclusiveCast && success)
				i= SpellBook.length
			; Otherwise, let's move to the next page in the book...
			else
				i += 1
			endif
		endwhile
		; Debug.Trace("BLOCKED!")
	endif
	; Re-register for a hit event on successful block.
	RegisterForHitEvent(akTarget, None, None, None, 0, 0, 0, 1, true)
EndEvent