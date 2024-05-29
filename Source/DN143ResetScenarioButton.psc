Scriptname DN143ResetScenarioButton extends ObjectReference Hidden

int Property NumTriggers Auto
{Stores the number of DefaultActivate Triggers}

quest Property DN143 Auto

GlobalVariable Property DN143HighScorePlayer Auto

Scene Property DN143StartCourse Auto
Scene Property DN143EndCourse Auto

int MaxTargets

int TargetsShot

int HighScore

int CurrentScore

float fTimeStart

float fCurrentRunTime


	; Custom event for resetting each target dummy.
CustomEvent ResetTargetDummy



Event OnLoad()
		; Count the number of DefaultActivate Triggers
    NumTriggers = CountLinkedRefChain()
EndEvent


Event OnActivate(ObjectReference akActionRef)
		; Event sent to targest so they reset if the button is pressed.
	SendCustomEvent("ResetTargetDummy")

	;debug.Notification("Course Reset!")  ;REPLACE WITH REAL MESSAGE

	CurrentScore = 0
	TargetsShot = 0

		; Move through the linked ref chain and reset the DefaultActivate Triggers
	int CurrentTrigger = 1
	DisableLinkChain()
	While CurrentTrigger <= NumTriggers
    	GetNthLinkedRef(CurrentTrigger).GoToState("Waiting")
    	CurrentTrigger = CurrentTrigger + 1
    EndWhile

    utility.Wait(1)
    (DN143 as DN143QuestScript).StartCourse()
    utility.Wait(6)
    fTimeStart = Utility.GetCurrentRealTime()
    EnableLinkChain()
    GetLinkedRef().Activate(Game.GetPlayer())
    GetLinkedRef().DisableNoWait()
EndEvent


Function AddToScore(int SentScore)
	TargetsShot = TargetsShot + 1
	CurrentScore = CurrentScore + SentScore
	if (CurrentScore > HighScore)
		HighScore = CurrentScore
	endif
	if TargetsShot >= MaxTargets
		;debug.Notification("Score: " + CurrentScore)  ;REPLACE WITH REAL MESSAGE
		;debug.Notification("High Score: " + HighScore)  ;REPLACE WITH REAL MESSAGE
		fCurrentRunTime = (Utility.GetCurrentRealTime() - fTimeStart)
		DN143HighScorePlayer.SetValue(fCurrentRunTime)
		DN143.UpdateCurrentInstanceGlobal(DN143HighScorePlayer)
   		(DN143 as DN143QuestScript).EndCourse()

	endif
EndFunction


Function CountMaxTargets()
	MaxTargets = MaxTargets + 1
EndFunction