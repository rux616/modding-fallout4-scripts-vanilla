Scriptname V81SunshineDinerIntroScript extends ObjectReference Const

Quest Property DialogueVault81 Auto Const
Quest Property Vault81Tour Auto Const
Quest Property V81_Conv_Mark_Maria_01 Auto Const
Quest Property V81_Conv_Mark_Maria_02 Auto Const
ObjectReference Property PlayerRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == PlayerRef && Vault81Tour.IsRunning() == 0 && V81_Conv_Mark_Maria_01.IsRunning() == 0 && V81_Conv_Mark_Maria_02.IsRunning() == 0
		DialogueVault81.SetStage(623)
	EndIf
EndEvent
