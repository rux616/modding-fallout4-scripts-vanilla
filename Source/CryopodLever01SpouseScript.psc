Scriptname CryopodLever01SpouseScript extends ReferenceAlias

ReferenceAlias Property SpouseCryopod Auto

;on activation, open the linked cryopod furniture
Auto State ClosedState
	Event OnOpen(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("WaitingState")
			ObjectReference SelfREF = Self.GetRef()
			SelfREF.BlockActivation(True, True)
			SpouseCryopod.GetRef().PlayAnimationAndWait("Stage2", "TransitionComplete")
			gotoState("OpenState")
			SelfREF.BlockActivation(False, False)
		EndIf
	EndEvent
EndState


State OpenState
	Event OnClose(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("WaitingState")
			ObjectReference SelfREF = Self.GetRef()
			;spouse cryopod has been opened once
			(SpouseCryopod as MQ102SpousePodScript).CryoPodOpenOnce = True
			SelfREF.BlockActivation(True, True)
			SpouseCryopod.GetRef().PlayAnimationAndWait("Stage1", "TransitionComplete")
			gotoState("ClosedState")
			SelfREF.BlockActivation(False, False)
		EndIf
	EndEvent
EndState

;wait for animation to finish
State WaitingState
	Event OnActivate(ObjectReference akActionRef)
		;empty
	EndEvent
EndState