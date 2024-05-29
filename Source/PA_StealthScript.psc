Scriptname PA_StealthScript extends ActiveMagicEffect

Spell Property SpellPA_Stealth Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;debug.trace(Self + "Start akTarget" + akTarget)
	akTarget.AddSpell(SpellPA_Stealth)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;debug.trace(Self + "Finish akTarget" + akTarget)
	akTarget.RemoveSpell(SpellPA_Stealth)
EndEvent