Scriptname Inst302RRNPCScript extends Actor Conditional

Quest Property Inst302Combat Auto Const


Event OnDeath (Actor Killer)


;if player killed me, call function in Inst302Combat script

	if Killer== Game.GetPlayer()
		(Inst302Combat as Inst302CombatQuestScript).UpdateRR()
	endif

EndEvent