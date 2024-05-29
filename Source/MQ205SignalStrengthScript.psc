Scriptname MQ205SignalStrengthScript extends Quest

ObjectReference Property Transmitter auto const
Message Property SignalStrengthMessage auto const
Worldspace Property Commonwealth auto const
Quest Property MQ205 auto
float fMaxDistance = 16000.0

Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == 20
    ;Stage to start displaying signal strength message
    	StartTimer(3.0)
    endif
EndEvent

Event OnTimer(int aiTimerID)
	
	float fPlayerDistance = Game.GetPlayer().GetDistance(Transmitter)
	float fStrength = ((fMaxDistance-fPlayerDistance)/fMaxDistance)*100
    	;debug.notification("My radio is tuned to " + Game.GetPlayerRadioFrequency())
    	;debug.notification("I made it")
    	if fPlayerDistance > fMaxDistance
    		fStrength = 0.0
    		;StartTimer(3.0)
    	endif
    	;if fPlayerDistance < 3000.0 && Game.GetPlayer().GetWorldspace() == Commonwealth && Game.GetPlayer().IsInInterior() == false && Game.IsPlayerRadioOn() && Game.GetPlayerRadioFrequency() == 82
    		;SignalStrengthMessage.Show(fStrength)
    		;StartTimer(1.5)
    	;endif
		if Game.GetPlayer().GetWorldspace() == Commonwealth && Game.GetPlayer().IsInInterior() == false && Game.IsPlayerRadioOn() && Game.GetPlayerRadioFrequency() == 82
			SignalStrengthMessage.Show(fStrength)
			StartTimer(3)
		endif
		if MQ205.GetCurrentStageID() == 30
			;debug.notification("Stage is 30")
			CancelTimer()
		elseif MQ205.GetCurrentStageID() == 20
				StartTimer(3)
		endif
	;StartTimer(3)	
EndEvent
	