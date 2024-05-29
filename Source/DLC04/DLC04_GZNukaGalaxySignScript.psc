Scriptname DLC04:DLC04_GZNukaGalaxySignScript extends ObjectReference

Quest property DLC04GZTrackingQuest Auto Const Mandatory
float RocketFireDelayGameTime = 0.05 ;About every game-time hour.
int NukaGalaxySignTimerID = 1 Const

Auto State WaitingForPower
	Event OnCellLoad()
		Debug.Trace("---OnCellLoad Received")
		if (DLC04GZTrackingQuest.GetStageDone(2000))
			Debug.Trace("Going Active")
			GoToState("Active")
		EndIf
	EndEvent
EndState

State Active
	Event OnBeginState(string asOldState)
		Debug.Trace("---Switching On")
		PlayAnimation("Play01")
		OnCellLoad()
	EndEvent

	Event OnCellLoad()
		Debug.Trace("---On Cell Load While Active")
		float initialDelay = Utility.RandomFloat(0, RocketFireDelayGameTime)
		StartTimerGameTime(initialDelay, NukaGalaxySignTimerID)
	EndEvent

	Event OnUnload()
		Debug.Trace("---On Unload While Active")
		CancelTimerGameTime(NukaGalaxySignTimerID)
	EndEvent

	Event OnTimerGameTime(int timerID)
		Debug.Trace("---OnTimerGameTime")
		if (timerID == NukaGalaxySignTimerID)
			Self.PlayAnimationAndWait("Play01", "Done")
			StartTimerGameTime(RocketFireDelayGameTime, NukaGalaxySignTimerID)
		EndIf
	EndEvent
EndState

