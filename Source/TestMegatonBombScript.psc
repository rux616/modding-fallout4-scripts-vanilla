Scriptname TestMegatonBombScript extends ObjectReference  

Int ButtonPressed = 0
Quest Property TestDialogueQuest01 Auto
Message Property TestMegatonBombMessage  Auto
Message Property TestMegatonBombMessageDisarmed  Auto
Message Property TestMegatonBombMessageDisarmSuccess  Auto
Message Property TestMegatonBombMessageDisarmFailure  Auto
Message Property TestMegatonBombMessageNoPulseCharge  Auto
Message Property TestMegatonBombMessagePulseCharge  Auto
Message Property TestMegatonBombMessageRigged  Auto
ActorValue Property Intelligence Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		If TestDialogueQuest01.GetStageDone(100) == 1
			TestMegatonBombMessageDisarmed.Show()
			Return
		ElseIf TestDialogueQuest01.GetStageDone(110) == 1
			TestMegatonBombMessageRigged.Show()
			Return
		Else
			ButtonPressed = TestMegatonBombMessage.Show()		
			If ButtonPressed == 1
				If Game.GetPlayer().GetValue(Intelligence) < 6
					TestMegatonBombMessageDisarmFailure.Show()
				Else
					TestMegatonBombMessageDisarmSuccess.Show()
					TestDialogueQuest01.SetStage(100)
				EndIf
			ElseIf ButtonPressed == 2
				If TestDialogueQuest01.GetStageDone(15) == 0
					TestMegatonBombMessageNoPulseCharge.Show()
				Else
					TestMegatonBombMessagePulseCharge.Show()
					TestDialogueQuest01.SetStage(110)
				EndIf
			EndIf	
		EndIf
	EndIf

EndEvent