Scriptname BosKellsPAScript extends Quest

Globalvariable Property KellsPACooldown Auto Const
Globalvariable Property KellsPABlocked Auto Const
Scene Property BoS_KellsPA_Scene Auto Const

;Event OnInit()
;	;Add functionality to direct call the Victory and Danse scenes 
;	StartTimerGameTime(KellsPACooldown.GetValue(), 155)
;EndEvent

Event OnTimerGameTime(int aiTimerID)
	if !Game.GetPlayer().IsInScene() && KellsPABlocked.GetValue() == 0
		FireScene()
	endif
	StartTimerGameTime(KellsPACooldown.GetValue())
EndEvent

Function StartKellsPATimer()
	StartTimerGameTime(KellsPACooldown.GetValue(), 155)
EndFunction

Function FireScene()
	BoS_KellsPA_Scene.Start()
EndFunction

Function CancelKellsPATimer()
	CancelTimerGameTime(155)
EndFunction