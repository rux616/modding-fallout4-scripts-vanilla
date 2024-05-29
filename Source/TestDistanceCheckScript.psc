Scriptname TestDistanceCheckScript extends Actor Const

ObjectReference property targetMarker auto Const

event OnLoad()
    StartTimer(1.0)
endEvent

event OnUnload()
	CancelTimer()
endEvent


Event OnTimer(int aiTimerID)
    debug.trace(self + " IsAIEnabled=" + IsAIEnabled())
    debug.trace(self + " GetDistance(" + targetMarker + ")=" + GetDistance(targetMarker))
    debug.trace(self + " GetDistance(player)=" + GetDistance(Game.GetPlayer()))
    debug.trace(self + " *************************************************************")
    StartTimer(1.0)
EndEvent
