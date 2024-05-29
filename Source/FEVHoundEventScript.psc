Scriptname FEVHoundEventScript extends Actor Const

Keyword Property FEVHoundAttack Auto Const


Event OnCombatStateChanged(Actor Target, Int aeCombatState)

	if aeCombatState == 1
		FEVHoundAttack.SendStoryEvent(akRef1 = Self)
	endif

EndEvent