Scriptname Inst306DesdemonaScript extends ReferenceAlias

Quest Property Inst306 Auto Const

Event OnDeath(actor killer)


	if Inst306.GetStage() == 20
		(Inst306 as Inst306QuestScript).ActorsKilled += 1
		Inst306.SetStage(25)
	endif

endEvent