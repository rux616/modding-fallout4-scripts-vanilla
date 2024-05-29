Scriptname ImprovingSwordSCRIPT extends ActiveMagicEffect

GLOBALVARIABLE PROPERTY pImprovingSword AUTO

ACTOR victim

Event OnEffectStart(Actor Target, Actor Caster)
	victim = target

EndEvent

Event OnDying(Actor akKiller)
	pImprovingSword.setValue(pImprovingSword.getValue() + 1)
	
EndEvent