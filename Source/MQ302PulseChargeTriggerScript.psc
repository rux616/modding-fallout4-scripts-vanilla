Scriptname MQ302PulseChargeTriggerScript extends ObjectReference

Quest Property MQ302 Auto Const

MiscObject Property FusionPulseCharge Auto Const

Message Property MQ302PlaceChargeMessage Auto Const

Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MQ302.GetStage() >= 300
			int button = MQ302PlaceChargeMessage.Show()
				if button == 0 
					Game.GetPlayer().RemoveItem(FusionPulseCharge, 1)
					PulseChargeRef.Enable()
					Self.Disable()
					MQ302.SetStage(600)
				endif
			
		endif
	endif


EndEvent
ObjectReference Property PulseChargeRef Auto Const
