Scriptname damageBloatflyLarvaPoisonSCRIPT extends ActiveMagicEffect

;the bloatfly we're spawning
OBJECTREFERENCE PROPERTY bloatfly AUTO

;the explosino to play when it comes out
EXPLOSION PROPERTY flyExplosion AUTO

ACTOR victim

EVENT OnEffectStart(Actor akTarget, Actor akCaster)

	;save off the victim
	victim = akTarget

ENDEVENT

EVENT OnDying(Actor akKiller)
    
    ;play the explosion, spawn the fly
	victim.placeAtMe(flyExplosion)
	victim.Dismember("Torso", TRUE, TRUE)	

ENDEVENT