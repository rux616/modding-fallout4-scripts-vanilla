Scriptname DialogueVault111Script extends Quest

ReferenceAlias Property SpouseCryopod Auto
int BreathingTimer = 10
Float BreathingInterval = 4.0
Scene Property PlayerBreathing Auto
Scene Property PlayerActivateCryopods Auto
Scene Property PlayerActivateBodies Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;when spouse cryopod opens, trigger scene
	If (akSource == SpouseCryopod.GetRef()) && (asEventName=="TransitionComplete")
		SetStage(58)
		UnRegisterForAnimationEvent(aksource, asEventName)
	EndIf
EndEvent

Function StartBreathing()
	PlayerBreathing.Start()
	StartTimer(BreathingInterval, BreathingTimer)
EndFunction

Event OnTimer(int aiTimerID)
	debug.trace(self + "TIMER START")
	If aiTimerID == BreathingTimer
		If GetStageDone(74) == 0
			StartTimer(BreathingInterval, BreathingTimer)
		EndIf
		If (Game.GetPlayer().IsTalking() == False) && (PlayerBreathing.IsPlaying() == False)
			PlayerBreathing.Start()
		EndIf
	EndIf
EndEvent

Function PlayCryopodComments()
	PlayerActivateCryopods.Start()
EndFunction

Function PlayerBodiesComments()
	PlayerActivateBodies.Start()
EndFunction