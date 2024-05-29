Scriptname FXDeleteSelfAfterTimer extends ObjectReference Const
{This script will cause the ref to delete itself after the timer expires.}

Float Property fSecondsUntilDelete = 30.0 Auto Const
{The time until this object deletes itself.}


Event OnInit()
	starttimer(fSecondsUntilDelete,1)
EndEvent


Event OnTimer(int aiTimerID)
	if aiTimerID == 1
		self.disable()
		self.delete()
	endif
endEvent