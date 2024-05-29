Scriptname dn029ForceWeatherTriggerScript extends ObjectReference Hidden

Quest Property MS11 Auto Const
Weather Property MS11LaunchWeather Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	if MS11.IsStageDone(927)
    		MS11LaunchWeather.ForceActive()
    	endif
    endif
EndEvent