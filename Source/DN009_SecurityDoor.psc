Scriptname DN009_SecurityDoor extends ObjectReference Hidden

Quest Property DN009_MQ205 const auto
Int Property myStage const auto

auto State Waiting
	Event OnLoad()
		RegisterForAnimationEvent(self, "done")    
	endEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		gotoState("DoNothing")
		UnRegisterForAnimationEvent(self, "done")
		DN009_MQ205.setStage(myStage)
	endEvent
endState

;**********************

State DoNothing
	;do nothing
endState

;**********************