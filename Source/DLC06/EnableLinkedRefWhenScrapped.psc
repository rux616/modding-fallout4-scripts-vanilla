Scriptname DLC06:EnableLinkedRefWhenScrapped extends ObjectReference Const

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	GetLinkedRef().Enable()
endEvent