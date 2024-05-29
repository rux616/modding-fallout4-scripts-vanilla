Scriptname ModLegendaryOnCritHitRefillAPScript extends ActiveMagicEffect Const

ActorValue Property ActionPoints const auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	debug.trace(self + "akTarget:" + akTarget + " , akCaster" + akCaster)

	akCaster.RestoreValue(ActionPoints, 999)

EndEvent
