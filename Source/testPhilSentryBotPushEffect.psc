Scriptname testPhilSentryBotPushEffect extends ActiveMagicEffect

EVENT OnEffectStart(Actor Target, Actor Caster)	

	game.getPlayer().pushActorAway(target, 10.0)

ENDEVENT
