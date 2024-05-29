Scriptname RECheckpointPlayerDistanceScript extends Quest

GlobalVariable Property RECheckpointObjDisableTriggerDistance Auto Const
ReferenceAlias Property CenterMarker Auto Const

;If assault hasn't already begun, register attackers for distance events
Function RegisterPlayerObjectiveDistanceEvent()
	if !GetStageDone(300) && !GetStageDone(400)

		debug.trace(self + " registering player and center marker for distance event.")
		RegisterForDistanceLessThanEvent(Game.GetPlayer(), CenterMarker.GetRef(), RECheckpointObjDisableTriggerDistance.GetValue())
	endif
EndFunction

;Player has gotten close enough to center marker. Turn off objective.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	debug.trace(self + "Player has approached center marker. Pull objective.")
	SetStage(205)
endEvent