Scriptname MQ302ForceWeatherTriggerScript extends ObjectReference Hidden

Weather Property CommonwealthClear Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	;force weather
    	CommonwealthClear.ForceActive(TRUE)
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
	;set weather back to normal (also does this in MQ302 shutdown)
		Weather.ReleaseOverride()
		delete()
	endif
EndEvent