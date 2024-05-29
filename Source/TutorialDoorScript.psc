Scriptname TutorialDoorScript extends ReferenceAlias

Quest Property Tutorial Auto Const
Int Property iStagetoSet Auto Const
Int Property iGatingStage Auto Const

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef == Game.GetPlayer())
			gotoState("hesBeenTriggered")
			If !Tutorial.GetStageDone(iGatingStage)
				Tutorial.SetStage(iStagetoSet)
			EndIf
		EndIf
	EndEvent
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE