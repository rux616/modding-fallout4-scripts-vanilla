Scriptname MQ102BatonTakeScript extends ObjectReference

Quest Property MQ102 Auto
Quest Property Tutorial Auto Const

;when the player picks up the weapon, enable VATS
Auto State WaitingForPlayer
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == Game.GetPlayer()
			gotoState("hasBeenTriggered")
			(MQ102 as MQ03QuestScript).MQ102EnableVats()
			Tutorial.SetStage(1005)
		endif
	EndEvent
EndState

State hasBeenTriggered
	;empty State
EndState