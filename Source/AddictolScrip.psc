Scriptname AddictolScrip extends ActiveMagicEffect

Spell Property Addiction Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(Addiction)
EndEvent