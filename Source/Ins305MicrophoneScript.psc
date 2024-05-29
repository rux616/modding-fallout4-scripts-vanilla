Scriptname Ins305MicrophoneScript extends ReferenceAlias Conditional

Quest Property Inst305 Auto Const


Event OnActivate(ObjectReference ActionRef)

	Inst305QuestScript QuestScript = Inst305 as Inst305QuestScript


	if ActionRef == Game.GetPlayer()
		if Inst305.GetStage() == 30
			QuestScript.ControlDisable()

			Inst305SpeechScenePart1.Start()


		endif
	endif

endEvent
Scene Property Inst305SpeechScenePart1 Auto Const
scene Property Inst305SpeechScenePart02 Auto Const
Scene Property Inst305speechScenePart03 Auto Const

Scene Property Inst305SpeechScenePart04 Auto Const

Scene Property Inst305SpeechScenePart05 Auto Const
