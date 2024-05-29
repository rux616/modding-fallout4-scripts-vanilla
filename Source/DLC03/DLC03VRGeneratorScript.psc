Scriptname DLC03:DLC03VRGeneratorScript extends ObjectReference Hidden

Weapon Property LightBeam Auto

Bool Property Powered = TRUE Auto

Int ShineBeamTimeIndex = 20
float Property ShineBeamTime = 3.0 Auto

Event OnLoad()
    ShineBeam()
EndEvent

Event OnTimer(int aiTimerID)
	;debug.trace(self + " OnTimer " + aiTimerID)
	if aiTimerID == ShineBeamTimeIndex
		if Powered && Is3DLoaded()
			LightBeam.Fire(self)
			StartTimer(ShineBeamTime, ShineBeamTimeIndex)
		endif
    endif
EndEvent

function ShineBeam()
	StartTimer(ShineBeamTime, ShineBeamTimeIndex)
endFunction