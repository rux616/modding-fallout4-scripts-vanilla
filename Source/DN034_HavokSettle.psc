Scriptname DN034_HavokSettle extends ObjectReference Hidden Const

Event OnTriggerEnter(ObjectReference akActionRef)
		GetLinkedRef().ApplyHavokImpulse(1.0, 0.0, 0.0, 5.0)
EndEvent