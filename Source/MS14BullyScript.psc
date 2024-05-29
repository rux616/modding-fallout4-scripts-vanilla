Scriptname MS14BullyScript extends ReferenceAlias Conditional

Quest Property MS14 Auto Const



Event OnDeath(actor Killer)

	if MS14.GetStage() >=20
		if MS14.GetStage() < 90
			if Killer == Game.GetPlayer()
				(MS14 as MS14QuestScript).BulliesKilled +=1
				if (MS14 as MS14QuestScript).BulliesKilled == 2
					MS14.SetStage(40)
				endif
			endif
		endif
	endif

endEvent