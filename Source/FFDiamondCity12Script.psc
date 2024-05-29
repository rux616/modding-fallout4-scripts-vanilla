Scriptname FFDiamondCity12Script extends Quest

;after the timer expires, advance the Quest

Event OnTimerGameTime(int aiTimerID)
	SetStage(190)
EndEvent