Scriptname BobbleheadSkillScript extends ObjectReference

bool OnlyOnce
Perk Property PerkToAdd Auto Const

Event OnActivate(ObjectReference akActionRef)
	If OnlyOnce == false
		If akActionRef == game.GetPlayer()
			game.GetPlayer().AddPerk(PerkToAdd)
			OnlyOnce = true
		endif
	endif
EndEvent

