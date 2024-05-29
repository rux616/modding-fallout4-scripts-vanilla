Scriptname MS19LockedDoorOpenerScript extends ObjectReference Const

Event OnTriggerLeave(ObjectReference akActionRef)
	If MS19.GetStageDone(100) == true
		If akActionRef != ToroRef
			GetLinkedRef().SetOpen(false)
		Endif
	EndIf
EndEvent

ObjectReference Property ToroRef Auto Const

Quest Property MS19 Auto Const
