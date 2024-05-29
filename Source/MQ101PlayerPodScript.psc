Scriptname MQ101PlayerPodScript extends ReferenceAlias

Idle Property IdleCryoBangOnGlass Auto Const
Scene Property MQ101_023_BangOnCryopod Auto Const

Auto State InitState
	Event OnAliasInit()
		gotoState("ActivationState")
		Self.GetRef().BlockActivation()
	EndEvent
EndState

State ActivationState
	Event OnExitFurniture(ObjectReference akActionRef)
		gotoState("WaitingState")
		debug.trace(self+ "BANGING ON CRYOPOD")
		;bang on the glass if we are at that point in the quest
		If (GetOwningQuest().GetStageDone(780) == 0) || (GetOwningQuest().GetStageDone(900) == 1)
			;do nothing
		Else
			If akActionref == Game.GetPlayer()
				Game.GetPlayer().PlayIdle(IdleCryoBangOnGlass)
				If MQ101_023_BangOnCryopod.IsPlaying() == False
					MQ101_023_BangOnCryopod.Start()
				EndIf
			EndIf
		EndIf
		Utility.Wait(1.0)
		gotoState("ActivationState")
	EndEvent
EndState

State WaitingState
	Event OnExitFurniture(ObjectReference akActionRef)
		;do nothing
	EndEvent
EndState