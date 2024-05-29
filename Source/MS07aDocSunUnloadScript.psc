Scriptname MS07aDocSunUnloadScript extends ReferenceAlias

Quest Property pMS07 Auto Const

Quest Property pMS07a Auto Const

Event OnUnload()

	if pMS07.GetStageDone(500)

		if pMS07a.GetStageDone(100)

			if !pMS07a.GetStageDone(210)

				pMS07a.SetStage(210)

			endif

		endif

	endif

EndEvent
