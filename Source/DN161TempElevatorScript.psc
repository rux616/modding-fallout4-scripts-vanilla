Scriptname DN161TempElevatorScript extends ObjectReference Hidden Const

Event OnTriggerEnter(ObjectReference akActionRef)
    GetLinkedRef().PlayAnimation("TopLevel")
    self.DisableNoWait()
EndEvent