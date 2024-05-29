Scriptname CastSpellOnEffectScript extends ActiveMagicEffect Hidden
{Cast spell on target timed after another effect.}

Spell property OnEffectSpell auto const
{Cast this spell on effect start.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	OnEffectSpell.Cast(akCaster, akTarget)
EndEvent