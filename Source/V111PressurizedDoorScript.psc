ScriptName V111PressurizedDoorScript extends ObjectReference

Sound property AMBVault111DoorAirPressure Auto
int mysoundID = 0

Auto State WaitForActivation
	Event OnLoad()
		;debug.trace("V111 Pressure Sound Loaded")
		If mysoundID == 0
			mysoundID = AMBVault111DoorAirPressure.play(self)
		EndIf

	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			;linked ref movable static, play animation on it, listen for it to finish, then disable
			GoToState("HasBeenActivated")
			Self.GetLinkedRef().PlayAnimation("Stage2")
			RegisterForAnimationEvent(self.GetLinkedRef(), "Stage3")
			Sound.stopinstance(mysoundID)
		EndIf
	EndEvent
EndState

State HasBeenActivated
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		If (akSource == Self.GetLinkedRef()) && (asEventName == "Stage3")
			GoToState("AnimationIsDone")
			UnRegisterForAnimationEvent(Self.GetLinkedRef(), "Stage3")
			Self.GetLinkedRef().Disable()		
		EndIf
	EndEvent
EndState

State AnimationIsDone
	;empty State
EndState