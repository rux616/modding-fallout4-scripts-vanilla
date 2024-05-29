Scriptname FXDeleteSelfAfterGameTimer extends ObjectReference Const

Float Property fSecondsUntilDelete = 30.0 Auto Const
{The time until this object deletes itself.}


Event OnInit()
	StartTimerGameTime(fSecondsUntilDelete,1)
EndEvent


Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == 1
            	self.disable()
		self.delete()
	endif
endEvent