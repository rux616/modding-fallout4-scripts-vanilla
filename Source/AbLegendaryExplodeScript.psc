Scriptname AbLegendaryExplodeScript extends ActiveMagicEffect

Explosion Property DeathExplosion Auto Const

Event OnDeath(Actor akKiller)
	debug.trace("Legendary explode")
	actor Owner = self.GetTargetActor()
	Owner.placeatme(DeathExplosion)
EndEvent
