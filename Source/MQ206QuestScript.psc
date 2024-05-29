Scriptname MQ206QuestScript extends Quest Conditional

Int Property MQ206RefuseFather Auto Conditional

Int Property IntrosDone Auto Conditional

Int Property IntrosTotal Auto Conditional

Function UpdateIntroductions()

;disable shutters blocking father's balcony

	if Shutters.GetReference().Isdisabled()==False
		Shutters.GetReference().Disable()
	endif

	IntrosDone+= 1
	if IntrosDone==IntrosTotal

		SetObjectiveCompleted(150)

;if player hasn't yet used the holotape, point him to it

		if GetStageDone(5)==0

			SetObjectiveDisplayed(160)
		else


			SetStage(200)
		endif
	endif

endFunction


Int Property ShaunQuestionKellogg Auto Conditional

Int Property ShaunQuestionSpouse Auto Conditional

Int Property ShaunQuestionInstitute Auto Conditional

Int Property ShaunQuestionsDone Auto Conditional

Int Property ShaunDontBelieveStarted Auto Conditional

Int Property ShaunConvProgress Auto Conditional

InputEnableLayer MQ207Layer

Function ControlToggle(int togglevalue)

	if togglevalue == 0

		MQ207Layer = InputEnablelayer.Create()
		MQ207Layer.EnableFastTravel(False)


	elseif togglevalue == 1

		MQ207Layer.EnableFastTravel(True)
		MQ207Layer.Delete()

	endif

endFunction

InputEnableLayer Property PlayerPCAPEnableLayer Auto Hidden

Function PlayerPCAPSceneStart()
                ;create input layer and lock fighting so player lowers weapon
                PlayerPCAPEnableLayer = InputEnableLayer.Create()
                PlayerPCAPEnableLayer.EnableFighting(False)
EndFunction

Function PlayerPCAPSceneEnd()
                ;delete layer so player has full control again
                PlayerPCAPEnableLayer = None
EndFunction





Int Property KidConvParent Auto Conditional

Int Property KidConvLeaving Auto Conditional

Int Property ElevatorSpeechStarted Auto Conditional

ReferenceAlias Property RelayDoor Auto Const 

Int Property KidConvStarted Auto Conditional

Int Property ShaunSynthConvDone Auto Conditional

ReferenceAlias Property Shutters Auto Const
