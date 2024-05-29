Scriptname DLC06:DLC06VaultDoorNavcutScript extends ObjectReference Hidden Const


Event OnLoad()
	RegisterForAnimationEvent(self, "Stage3")
	RegisterForAnimationEvent(self, "Stage5")
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    If asEventName == "Stage3"
    	GetLinkedRef().Disable()
    ElseIf asEventName == "Stage5"
    	GetLinkedRef().EnableNoWait()
    EndIf
EndEvent