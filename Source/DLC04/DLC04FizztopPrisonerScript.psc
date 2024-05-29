Scriptname DLC04:DLC04FizztopPrisonerScript extends Actor Const

Faction Property BoundCaptiveFaction Auto Const Mandatory

Event OnInit()
	AddToFaction(BoundCaptiveFaction)
EndEvent

Event OnLoad()
	SetRestrained()
	SetFactionRank(BoundCaptiveFaction, 0)
	SetGhost()
EndEvent