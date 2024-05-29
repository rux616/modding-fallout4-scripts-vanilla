Scriptname MS19SpreadDiseaseScript extends ReferenceAlias

Quest Property MS19 Auto Const
ActorValue Property MS19Infected Auto Const

Event OnPlayerDialogueTarget()
	Debug.Trace("Activated")
	if GetRef().GetValue(MS19Infected) == 0.0
		if MS19.GetStage() == 202
			MS19.SetStage(203)
			GetRef().SetValue(MS19Infected, 1.0)
		elseif MS19.GetStage() == 201
			MS19.SetStage(202)
			GetRef().SetValue(MS19Infected, 1.0)
		elseif MS19.GetStage() == 100
			MS19.SetStage(201)
			GetRef().SetValue(MS19Infected, 1.0)
		endif
	endif
EndEvent
