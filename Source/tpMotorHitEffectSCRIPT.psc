Scriptname tpMotorHitEffectSCRIPT extends ActiveMagicEffect

FLOAT PROPERTY pushStr AUTO

EVENT OnEffectStart(Actor Target, Actor Caster)	

	game.getPlayer().pushActorAway(target, pushStr)

ENDEVENT