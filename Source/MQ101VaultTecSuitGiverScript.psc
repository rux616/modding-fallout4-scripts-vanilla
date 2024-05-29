Scriptname MQ101VaultTecSuitGiverScript extends ReferenceAlias

Int Property StageToSet Auto Const
Cell Property PrewarVault111 Auto Const

Auto State WaitingForLoad
	Event OnLoad()
		If Self.GetActorRef().GetParentCell() == PrewarVault111
			gotoState("RegisteredState")
			RegisterForAnimationEvent(Self.GetActorRef(), "IdleStop")
		EndIf
	EndEvent
EndState

State RegisteredState
	Event OnLoad()
		;do nothing
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		Quest myQuest = GetOwningQuest()
		If akSource == Self.GetActorRef() && asEventNAme == "IdleStop"
			If myQuest.GetStageDone(StageToSet) == 0
				myQuest.SetStage(StageToSet)
				UnRegisterForAnimationEvent(Self.GetActorRef(), "IdleStop")
			EndIf
		EndIf
	EndEvent
EndState