Scriptname QuickstartRespecTriggerScript extends ObjectReference

ObjectReference Property V111ElevatorREF Auto
Quest Property MQ102 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If MQ102.GetStage() < 7
			V111ElevatorREF.PlayAnimation("Stage2")
			Self.Disable()
		Else
			Self.Disable()
		EndIf
	EndIf
EndEvent