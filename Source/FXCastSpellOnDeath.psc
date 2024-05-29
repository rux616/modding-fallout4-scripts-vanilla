Scriptname FXCastSpellOnDeath extends ActiveMagicEffect
{Cast a spell on death.}

Spell property OnDeathSpell auto const
{Cast this spell on death.}

actor Victim
bool bHasBeenCasted = false

;======================================================================================;
;   EVENTS     /
;=============/

Event OnInit()
	victim = GetTargetActor()
	if victim.IsDead()
		OnDeathSpell.Cast(victim , victim)
		bHasBeenCasted = true
	endif

EndEvent

Event OnDying(Actor Killer)
	if bHasBeenCasted != true
		OnDeathSpell.Cast(victim , victim)
	endif
	debug.trace("The OnDying Event was hit on " + victim)
EndEvent

