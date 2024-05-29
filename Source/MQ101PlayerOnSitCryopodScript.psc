Scriptname MQ101PlayerOnSitCryopodScript extends ReferenceAlias

ReferenceAlias Property	PlayerPod Auto


Auto State WaitingState
	Event OnSit(ObjectReference akFurniture)
		If akFurniture == PlayerPod.GetRef()
			gotoState("doneState")
			GetOwningQuest().SetStage(730)
		EndIf
	endEvent
EndState

State doneState
	Event OnSit(ObjectReference akFurniture)
		;do nothing
	endEvent
EndState
