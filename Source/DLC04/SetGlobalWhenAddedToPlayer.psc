Scriptname DLC04:SetGlobalWhenAddedToPlayer extends ObjectReference Const

GlobalVariable Property GlobalToSet Auto Const Mandatory
float Property ValueToSet = 1.0 Auto Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akNewContainer == Game.GetPlayer()
    	debug.trace(self + "setting GlobalToSet: " + GlobalToSet + " to ValueToSet: " + ValueToSet)
    	GlobalToSet.SetValue(ValueToSet)
    endif
EndEvent
