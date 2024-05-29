Scriptname GlowingSeaCOAActorScript extends ReferenceAlias Conditional

Faction Property GlowingSeaChildrenFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property MyAlias Auto Conditional


Event OnDeath(Actor Killer)

	if Killer==Game.GetPlayer()
		GlowingSeaChildrenFaction.SetEnemy(PlayerFaction)
		
	endif
	MyAlias.Clear()

EndEvent