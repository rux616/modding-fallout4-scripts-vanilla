Scriptname LightbulbOnOffScript extends ObjectReference Const
{script to allow lightbulb to turn on and off in response to be hooked up to power}

Light Property LightToSpawnIfPowered const auto
{ spawn this light if powered
	also delete when powerOff
 }

Event OnLoad()
	debug.trace(self + "OnLoad()")
	if IsPowered()
		TurnOn(shouldPlaceAOMarker = false)
	else
		TurnOff(shouldSendDeleteEvent = false)
	endif
EndEvent

Function TurnOn(bool shouldPlaceAOMarker = true)
	debug.trace(self + "TurnOn()")

	SetAnimationVariableFloat("fDampRate", 0.03) 
	SetAnimationVariableFloat("fToggleBlend", false as int) 

	if LightToSpawnIfPowered
		SetLinkedRef(placeAtMe(LightToSpawnIfPowered))
	endif
EndFunction

Function TurnOff(bool shouldPlaceAOMarker = true, bool shouldSendDeleteEvent = true)
	debug.trace(self + "TurnOff()")
	if Is3dloaded()
		SetAnimationVariableFloat("fDampRate", 1.0) 
		SetAnimationVariableFloat("fToggleBlend", true as int) 
	endif
	ObjectReference myLight = GetLinkedRef()
	if myLight
		myLight.Delete()
	endif
EndFunction

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn akPowerGenerator=" + akPowerGenerator)
	TurnOn()
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	TurnOff()
EndEvent

; sent when workshop receives OnWorkshopObjectMoved event
function UpdatePosition()
	ObjectReference myLight = GetLinkedRef()
	if myLight
		myLight.Moveto(self)
	endif
EndFunction
