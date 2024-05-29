Scriptname MQ101RadScannerTriggerScript extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	Self.GetLinkedRef(LinkCustom01).PlayAnimation("PlayAnimation")
	Self.GetLinkedRef(LinkCustom02).PlayAnimation("PlayAnimation")

EndEvent