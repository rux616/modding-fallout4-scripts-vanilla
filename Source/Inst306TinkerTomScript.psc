Scriptname Inst306TinkerTomScript extends ReferenceAlias

Quest Property Inst306 Auto Const Mandatory

Event OnDeath(Actor Killer)

	Inst306QuestScript QuestScript = Inst306 as Inst306QuestScript

	if Inst306.GetStage() >= 20

			if QuestScript.TomDead==False
				QuestScript.TomDead=True
				QuestScript.ActorsKilled+=1
				if QuestScript.ActorsKilled>=5
;					if Inst306.GetStageDone(25)==False
;						Inst306.SetStage(25)
;					endif
					Inst306.SetStage(30)
				endif
			endif

	endif

EndEvent