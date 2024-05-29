Scriptname MS07cNickBunkerEscortUnload extends ReferenceAlias

Quest Property pMS07c Auto Const


Event OnUnload()
;If Nick hasn't already bypassed his unload stage, on unload, set stage 215, which will teleport him into Andrew Station

	if !pMS07c.GetSTageDone(217)

		if pMS07c.GetStageDone(210)

	;		if !pMS07c.GetStageDone(213)

				if !pMS07c.GetStageDone(215)

					pMS07c.SetStage(215)

				endif

	;		endif

		endif

	endif

EndEvent
