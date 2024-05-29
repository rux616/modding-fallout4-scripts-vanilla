Scriptname DLC04:DLC04_GauntletMonkeyTrapScript extends ObjectReference

Event OnOpen(ObjectReference akActionRef)
	ObjectReference monkey = Self.GetLinkedRef()
	if (monkey.IsDestroyed() == False)
		monkey.Activate(monkey)
		monkey.CreateDetectionEvent(Game.GetPlayer(), 9)
		monkey.PlayAnimation("Trip")
	EndIf
EndEvent