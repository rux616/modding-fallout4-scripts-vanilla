Scriptname CryopodLever01Script extends ObjectReference

BOOL PROPERTY IsPlayersPod = False AUTO Const
{Set to TRUE to control the Player's Pod. Default False}

;on activation, open the linked cryopod furniture
Auto State ClosedState
	Event OnLoad()
		If IsPlayersPod
			BlockActivation(True, True)
			gotoState("WaitingState")
			SetOpen()
		EndIf
	EndEvent

	Event OnOpen(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("WaitingState")
			BlockActivation(True, True)
			If IsPlayersPod
				GetLinkedRef().PlayAnimationAndWait("standStart", "exitStop")
			Else
				GetLinkedRef().PlayAnimationAndWait("Stage2", "TransitionComplete")
			EndIf	
			;gotoState("OpenState")
			;BlockActivation(False, False)
		EndIf
	EndEvent
EndState

;//
State OpenState
	Event OnClose(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("WaitingState")
			BlockActivation()
			If IsPlayersPod
				GetLinkedRef().PlayAnimationAndWait("sitStartFromStand", "enterStop")
			Else
				GetLinkedRef().PlayAnimationAndWait("Stage1", "TransitionComplete")
			EndIf
			gotoState("ClosedState")
			BlockActivation(False)
		EndIf
	EndEvent
EndState
//;


;wait for animation to finish
State WaitingState
	Event OnActivate(ObjectReference akActionRef)
		;empty
	EndEvent
EndState