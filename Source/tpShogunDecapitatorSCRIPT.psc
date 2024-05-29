Scriptname tpShogunDecapitatorSCRIPT extends ActiveMagicEffect

ACTOR victim

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
    
    victim = akTarget

ENDEVENT

EVENT onDYING(ACTOR akKiller)

	victim.dismember("Head1", FALSE, TRUE)

ENDEVENT
