Scriptname DN100WaterfallDropTrigger extends ObjectReference Hidden

Event OnTriggerEnter(ObjectReference akActionRef)
	Utility.Wait(1)   
	GetLinkedRef().DisableNoWait()
EndEvent

Event OnUnload()
    GetLinkedRef().EnableNoWait()
EndEvent