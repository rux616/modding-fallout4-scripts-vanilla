Scriptname MQ104QTTriggerScript extends ObjectReference

Quest Property MQ104 Auto
int Property TriggerNumber Auto

;update the quest targets for MQ104 as the player progresses through these triggers

Auto State waitingforPlayer
Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		gotoState("hasbeenTriggered")
		(MQ104 as MQ104QuestScript).UpdateVault114QT(TriggerNumber)
		Self.Disable()
	EndIf
EndEvent

EndState

State hasbeenTriggered
	Event OnTriggerEnter(ObjectReference akActionRef)
		;empty
	EndEvent
EndState