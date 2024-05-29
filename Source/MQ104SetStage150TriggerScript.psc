Scriptname MQ104SetStage150TriggerScript extends ObjectReference

Quest Property MQ104 Auto
Quest Property DialogueGoodneighborEntrance Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()

		If MQ104.GetStageDone(150) == 1
			Self.Disable()
			Self.Delete()
		EndIf

		If (DialogueGoodneighborEntrance.GetStageDone(100) == 1) && (MQ104.GetStageDone(150) == 0)
			MQ104.SetStage(150)
		EndIf
	EndIf
EndEvent