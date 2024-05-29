Scriptname PrydwenFireEffectsManager extends ObjectReference Hidden
{Script on the BoSPrydwenFire enable marker. Turns off the effects after period of time.}

ObjectReference property PrydwenDestructionRef Auto Const

Function EnablePrydwenFireFX()
	Self.EnableNoWait()
	Self.StartTimerGameTime(12)
EndFunction

Event OnTimerGameTime(int timerID)
	if (Self.Is3DLoaded())
		Self.StartTimerGameTime(1)
	Else
		PrydwenDestructionRef.DisableNoWait()
		Self.DisableNoWait()
	EndIf
EndEvent