Scriptname MinVsInstQuestScript extends Quest Conditional

ReferenceAlias Property ObservatoryMapMarker Auto Const
Int Property Stage10LoopVar Auto Conditional

Int Property Opposition Auto Conditional
; 1 for Minutemen
; 2 for Gunners

Int Property OppositionKilled Auto Conditional

Function UpdateKills()

;if we're not already at 'kill the bad guys' stage, set it

	If GetStage() < 40
		SetStage(40)
	endif

;increment var for each guy killed, check against total
;and set next stage when we reach it

	OppositionKilled += 1
	if OppositionKilled == 5
		if GetStageDone(50) == 0
			SetStage(50)
		endif
		if GetStage() == 80
			SetObjectiveDisplayed(80,0)
		endif
	endif

EndFunction
Int Property SpeechChallenge01Failed Auto Conditional
Int Property SpeechChallenge02Failed Auto Conditional
Int Property DoctorSceneDone Auto Conditional
Int Property WallaceConvResolved Auto Conditional
Int Property PreSceneRunning Auto Conditional
