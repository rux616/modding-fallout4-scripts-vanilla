Scriptname MS11HandleDisablingShipScript extends ObjectReference Hidden


Function RegisterShipForDistanceDisable()
	Debug.TracE(self + "Registering for Distance Check")
	RegisterForDistanceGreaterThanEvent(Game.GetPlayer(), (Self as ObjectReference), 2000)
EndFunction


Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	Debug.TracE(self + "OnDistanceGreaterThan " + afDistance + " between " + akObj1 + " and " + akObj2)
	GetLinkedRef().Disable()
endEvent