Scriptname MS17CovenantDoor extends DefaultRef 
{Default script used for checking if a reference is activated, and optionally what Activated it.}

Quest Property pMS17 Auto Const

Event OnActivate(ObjectReference akActionRef)
	if ( pMS17.GetStageDone(90) )
		StartTimer(7.0)
	endif
EndEvent

Event OnTimer(int timerID)
	if timerID == 0
		SetOpen(False)
	endif
EndEvent