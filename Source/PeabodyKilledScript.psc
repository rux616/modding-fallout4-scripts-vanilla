Scriptname PeabodyKilledScript extends Actor Const

Quest Property MS01 Auto Const
Faction Property PeabodyFaction Auto Const

Event OnDeath(Actor akKiller)
	if game.GetPlayer() == akKiller
		PeabodyFaction.SetPlayerEnemy()
		if MS01.IsCompleted() == false
			MS01.SetStage(1200)
		endif
	endif
EndEvent