Scriptname V81HoratiosHairstylesIntroScript extends ObjectReference Const

Quest Property DialogueVault81 Auto Const
Quest Property Vault81Tour Auto Const
ObjectReference Property PlayerRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == PlayerRef && Vault81Tour.IsRunning() == 0 && DialogueVault81.GetStageDone(610) == 0 
		DialogueVault81.SetStage(610)
	EndIf
EndEvent
