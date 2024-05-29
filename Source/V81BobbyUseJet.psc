Scriptname V81BobbyUseJet extends ObjectReference Const

Quest Property V81_03 Auto Const
Actor Property V81_BobbyDeLuca Auto Const
Idle Property IdleUseJet Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If V81_03.GetStageDone(100) == 1 && V81_03.GetStageDone(400) == 0 && V81_03.GetStageDone(6) == 0
		V81_BobbyDeLuca.PlayIdle(IdleUseJet)
		V81_03.SetStage(6)
	EndIf
EndEvent