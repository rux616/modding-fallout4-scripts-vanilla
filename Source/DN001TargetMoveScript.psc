Scriptname DN001TargetMoveScript extends ObjectReference 

Keyword Property LinkCustom01 Auto Const

ObjectReference[] MoveLocations
ObjectReference CurrentMoveLocation

Auto State Start

	Event OnCellAttach()
	    MoveLocations = GetLinkedRefChain(LinkCustom01)
	    self.moveto(MoveLocations[0])
	    gotoState("moving")
	 EndEvent 

EndState

State moving
	
	Event OnBeginState(string asOldState)
		float TimerTime = Utility.RandomFloat(0.5, 1.5)
		StartTimer(TimerTime, 0)
	
	EndEvent

	Event OnTimer(int aiTimerID)
		
		int i = (MoveLocations.length - 1)
		int MoveNumber = Utility.RandomInt(0,i)
		self.moveto(MoveLocations[MoveNumber])
		float TimerTime = Utility.RandomFloat(0.5, 1.5)
		StartTimer(TimerTime, 0)

	EndEvent

EndState

