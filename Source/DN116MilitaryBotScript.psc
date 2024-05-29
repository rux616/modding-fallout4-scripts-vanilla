Scriptname DN116MilitaryBotScript extends Actor Hidden Conditional

Bool Property bSentryBotActivate Auto Conditional

Bool Property bSentryBotDefending Auto Conditional

Bool Property bSentryBotSelfDestruct Auto Conditional


Event OnLoad()
	if (!bSentryBotActivate)
		EnableAI(TRUE)
		utility.Wait(1)
		MoveToMyEditorLocation()
		utility.Wait(1)
		SetUnconscious()
		utility.Wait(1)
		BlockActivation(TRUE,TRUE)
		EnableAI(FALSE)
	endif
EndEvent