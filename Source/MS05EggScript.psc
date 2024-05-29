Scriptname MS05EggScript extends ReferenceAlias

Quest Property pMS05B Auto Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()

		if !pMS05B.GetStageDone(250)

			pMS05B.SetStage(250)

		endif

	endif

EndEvent