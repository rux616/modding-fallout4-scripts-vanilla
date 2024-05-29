Scriptname DN109_EnableTriggerScript extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const

Event OnTriggerEnter(ObjectReference TriggerRef)
	getLinkedRef().Enable()
	getLinkedRef(LinkCustom01).Disable()

EndEvent