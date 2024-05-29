Scriptname Min02CastleRepairButtonScript extends ObjectReference
{temp? script for repairing Castle radio transmitter}

Quest Property Min02 Auto Const

Message Property CastleRadioTransmitterRepairMsg Auto Const

Event OnActivate(ObjectReference akActionRef)
	; repair the transmitter
	CastleRadioTransmitterScript transmitter = GetLinkedRef() as CastleRadioTransmitterScript

    if akActionRef == Game.GetPlayer() && transmitter.bRepaired == false
    	int button = CastleRadioTransmitterRepairMsg.Show()
    	if button == 0
            transmitter.RepairMe()
    		if Min02.GetStageDone(520)
    			Min02.SetStage(570)
    		endif
    		disable()
    	endif
    endif
EndEvent