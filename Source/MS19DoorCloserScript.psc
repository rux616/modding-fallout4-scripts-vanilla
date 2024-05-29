Scriptname MS19DoorCloserScript extends ObjectReference Const


Event OnTriggerLeave(ObjectReference akActionRef)
		utility.Wait(5)
		GetLinkedRef().SetOpen(false)
EndEvent
