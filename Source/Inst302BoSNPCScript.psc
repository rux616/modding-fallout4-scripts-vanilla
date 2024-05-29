Scriptname Inst302BoSNPCScript extends Actor Conditional

Quest Property Inst302Combat Auto Const

Faction Property PlayerFaction Auto Const

Faction Property BunkerHillBoSFaction Auto Const

Quest Property Inst302 Auto Const



Event OnDeath(Actor Killer)

	if Killer == Game.GetPlayer()
		(Inst302Combat as Inst302CombatQuestScript).UpdateBoS()
	endif

EndEvent