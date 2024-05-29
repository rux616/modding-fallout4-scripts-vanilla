Scriptname TestMalfunctioningDoorScript extends ObjectReference Const

Float property MinTime = 0.1 auto const
Float property MaxTime = 0.8 auto const

Event onLoad()
	 LocalStartTimer()
EndEvent
	
Event onTimer(int aeTimerID)
	if aeTimerID == 1 && getParentCell().isAttached()
		self.activate(self)
		 LocalStartTimer()
	endif
endEvent

Function LocalStartTimer()
	StartTimer(Utility.RandomFloat(MinTime, MaxTime), 1)
endFunction
