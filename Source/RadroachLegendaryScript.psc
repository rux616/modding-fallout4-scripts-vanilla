Scriptname RadroachLegendaryScript extends Actor Const

ActorBase Property EncRadRoach Auto Const
Explosion Property DeathExplosion Auto Const
Float Property SpawnDelay Auto Const

Event OnDeath(Actor akKiller)
	PlaceAtMe(DeathExplosion)
	PlaceActorAtMe(EncRadRoach)
	utility.wait(SpawnDelay)
	PlaceAtMe(DeathExplosion)
	PlaceActorAtMe(EncRadRoach)
	utility.wait(SpawnDelay)
	PlaceAtMe(DeathExplosion)
	PlaceActorAtMe(EncRadRoach)
	utility.wait(SpawnDelay)
	PlaceAtMe(DeathExplosion)
	PlaceActorAtMe(EncRadRoach)
	utility.wait(SpawnDelay)
	PlaceAtMe(DeathExplosion)
	PlaceActorAtMe(EncRadRoach)
EndEvent

