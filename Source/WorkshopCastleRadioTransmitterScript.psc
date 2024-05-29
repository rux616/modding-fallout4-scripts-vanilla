Scriptname WorkshopCastleRadioTransmitterScript extends ObjectReference Const
{1.3: added to make sure radio operator stays assigned}

WorkshopNPCScript property RadioOperator const auto mandatory

Quest property Min02 const auto mandatory

WorkshopParentScript property WorkshopParent const auto mandatory

Event OnInit()
	RadioOperatorFailsafe()
EndEvent

Event OnLoad()
	RadioOperatorFailsafe()
EndEvent

function RadioOperatorFailsafe()
	; if radio operator should be assigned, make sure he still is
    if Min02.GetStageDone(570)
		WorkshopObjectScript transmitter =  (self as ObjectReference) as WorkshopObjectScript
		WorkshopParent.AssignActorToObjectPUBLIC(RadioOperator, transmitter)
    endif
endFunction