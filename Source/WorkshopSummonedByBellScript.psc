Scriptname WorkshopSummonedByBellScript extends Quest

; timer shuts down quest
Event OnTimerGameTime(int aiTimerID)
	Stop()
EndEvent
