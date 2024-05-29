Scriptname DN102QuestScript extends Quest
{Quest script for DN102 - HalluciGen. Manages the lab demo scenes and their associated buttons.}

;---------------------------
;Lab Demo scenes.
Scene property DN102_HalluciGenTest1 Auto Const Mandatory
Scene property DN102_HalluciGenTest2 Auto Const Mandatory
Scene property DN102_HalluciGenTest3 Auto Const Mandatory
Scene property DN102_HalluciGenTest4 Auto Const Mandatory
Scene property DN102_HalluciGenTest5 Auto Const Mandatory

;Other scenes involving the mainframe that may be playing at the same time.
Scene property DN102_HalluciGenLabEntry Auto Const Mandatory
Scene property DN102_HalluciGenLabLockdownReleased Auto Const Mandatory
Scene property DN102_HalluciGenObsRoomEntry Auto Const Mandatory

;Lab Demo buttons.
ToggleButtonScript[] property LabDemoButtons Auto Const Mandatory
{Array of the LabDemoButtons, with index 0 empty and 1-5 corresponding to their demo.}

;Which demo is currently running?
int property currentLabDemo Auto Hidden


;Called by DN102_LabDemoActivatorScript when the player presses a Lab Demo button.
Function StartLabDemo(int newDemo)
	;Stop all other scenes involving the mainframe.
	DN102_HalluciGenLabEntry.Stop()
	DN102_HalluciGenLabLockdownReleased.Stop()
	DN102_HalluciGenObsRoomEntry.Stop()

	;If a lab demo was still playing, abort it. This also aborts any effects in progress.
	if ((currentLabDemo == 1) && DN102_HalluciGenTest1.IsPlaying())
		DN102_HalluciGenTest1.Stop()
	ElseIf ((currentLabDemo == 2) && DN102_HalluciGenTest2.IsPlaying())
		DN102_HalluciGenTest2.Stop()
	ElseIf ((currentLabDemo == 3) && DN102_HalluciGenTest3.IsPlaying())
		DN102_HalluciGenTest3.Stop()
	ElseIf ((currentLabDemo == 4) && DN102_HalluciGenTest4.IsPlaying())
		DN102_HalluciGenTest4.Stop()
	ElseIf ((currentLabDemo == 5) && DN102_HalluciGenTest5.IsPlaying())
		DN102_HalluciGenTest5.Stop()
	EndIf

	;Start the new lab demo.
	currentLabDemo = newDemo
	if (currentLabDemo == 1)
		DN102_HalluciGenTest1.Start()
	ElseIf (currentLabDemo == 2)
		DN102_HalluciGenTest2.Start()
	ElseIf (currentLabDemo == 3)
		DN102_HalluciGenTest3.Start()
	ElseIf (currentLabDemo == 4)
		DN102_HalluciGenTest4.Start()
	ElseIf (currentLabDemo == 5)
		DN102_HalluciGenTest5.Start()
	EndIf
EndFunction

Function ReactivateButton(int buttonID)
	Debug.Trace("Reactivating button " + buttonID)
	LabDemoButtons[buttonID].SetActiveNoWait(True)
EndFunction