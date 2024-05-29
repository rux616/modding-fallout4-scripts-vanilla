Scriptname V81HydroponicsIntroScript extends ObjectReference Const

Quest Property DialogueVault81 Auto Const
Quest Property Vault81Tour Auto Const
ObjectReference Property PlayerRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == PlayerRef && Vault81Tour.IsRunning() == 0 && MS19.GetStageDone(150) == 0
		DialogueVault81.SetStage(640)
	EndIf
EndEvent

Quest Property MS19 Auto Const
