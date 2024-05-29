Scriptname DN161EnableDetailTriggerScript extends ObjectReference Hidden


Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	GetLinkedRef().EnableNoWait()
    endif
EndEvent



Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	GetLinkedRef().DisableNoWait()
    endif
EndEvent