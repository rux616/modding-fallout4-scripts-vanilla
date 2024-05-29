Scriptname DN049_PlayerInStoreSubTriggerScript extends ObjectReference Hidden
{Script for secondary store triggers in DN049. Just forward their Enter and Leave events to a linked DN049_PlayerInStoreTriggerScript.}

DN049_PlayerInStoreTriggerScript property myParentTrigger Auto Const
{The trigger to forward events to.}


Event OnTriggerEnter(ObjectReference akActionRef)
	myParentTrigger.OnTriggerEnter(akActionRef)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	myParentTrigger.OnTriggerLeave(akActionRef)
EndEvent