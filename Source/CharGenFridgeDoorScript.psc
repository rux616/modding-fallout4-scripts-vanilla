Scriptname CharGenFridgeDoorScript extends ObjectReference Const

;turn the lights on and off
Event OnOpen(ObjectReference akActionRef)
	Self.GetLinkedRef().Enable()
EndEvent

Event OnClose(ObjectReference akActionRef)
	Self.GetLinkedRef().Disable()
EndEvent