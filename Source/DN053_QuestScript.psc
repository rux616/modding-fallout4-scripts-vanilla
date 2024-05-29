Scriptname DN053_QuestScript extends Quest Conditional
{Quest script for DN053 - Virgil's Laboratory}

Location property VirgilsLabLocation auto const
{Virgil's Lab Location}

Function StartCureTimer()
	;Start a timer for when Virgil's Cure takes effect.
	StartTimerGameTime(72, 1) ;3d
EndFunction

Event OnTimerGameTime(int timerID)
	if (timerID == 1)
		Debug.Trace("Virgil Cure Timer fired.")
		if (Game.GetPlayer().IsInLocation(VirgilsLabLocation))
			Debug.Trace("Player in Lab, delaying.")
			StartTimerGameTime(24)
		Else
			Debug.Trace("Virgil cured.")
			(Self as Quest).SetStage(60)
		EndIf
	EndIf
EndEvent

Int Property InstDestroyed Auto Conditional