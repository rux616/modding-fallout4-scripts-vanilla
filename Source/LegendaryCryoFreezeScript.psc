Scriptname LegendaryCryoFreezeScript extends ActiveMagicEffect

SPELL PROPERTY pCryoFreezeSpell AUTO
{The Cryo freeze spell}

; the victim
ACTOR victim

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace("OnEffectStart() akTarget" + akTarget)
    victim = akTarget

	;freeze him!
	pCryoFreezeSpell.cast(game.getPlayer(), victim)

ENDEVENT
