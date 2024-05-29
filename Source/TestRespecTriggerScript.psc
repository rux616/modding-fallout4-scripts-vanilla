Scriptname TestRespecTriggerScript extends ObjectReference

ObjectReference Property V111ElevatorREF Auto
Quest Property MQ102 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer() && MQ102.GetStage() < 7
		V111ElevatorREF.PlayAnimation("Stage2")
		Self.Disable()
	EndIf
EndEvent