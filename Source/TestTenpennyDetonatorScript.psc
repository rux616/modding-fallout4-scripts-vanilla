Scriptname TestTenpennyDetonatorScript extends ObjectReference  

Int ButtonPressed = 0
Quest Property TestDialogueQuest01 Auto
Message Property TestTenpennyDetonatorMessage  Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer() && TestDialogueQuest01.GetStageDone(520) == 0
		ButtonPressed = TestTenpennyDetonatorMessage.Show()		
		If ButtonPressed == 1
			TestDialogueQuest01.SetStage(520)
		EndIf
	EndIf

EndEvent