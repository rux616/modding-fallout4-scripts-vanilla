Scriptname MQ102PistolTakeScript extends ObjectReference

Quest Property MQ102 Auto
Quest Property Tutorial Auto

;when the player picks up the weapon, enable VATS
Auto State WaitingForPlayer
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == Game.GetPlayer()
			gotoState("hasBeenTriggered")
			(MQ102 as MQ03QuestScript).MQ102EnableVats()
			Tutorial.SetStage(1010)
		endif
	EndEvent
EndState

State hasBeenTriggered
	;empty State
EndState