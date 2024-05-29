Scriptname MS05BPostQuestEggScript extends ReferenceAlias

Quest Property pMS05BPostQuest Auto Const

Quest Property pMS05B Auto Const

ReferenceAlias Property pNest Auto Const

Event OnActivate(ObjectReference akActionRef)

	if pMS05B.GetStageDone(500)

		if akActionRef == Game.GetPlayer()

			if !pMS05BPostQuest.GetStageDone(20)

				pMS05BPostQuest.SetStage(20)

			endif

		endif

	endif

EndEvent
