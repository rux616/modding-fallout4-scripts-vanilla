Scriptname DLC04:DLC04RideControllerAnimDrivenScript extends DLC04:DLC04RideControllerGenericScript

Group ChildAnimationProperties
	string Property RideOnAnim = "Play01" auto Const
	{This is the anim to play on this object when the ride is on}

	String Property RideOnAnimEndEvent = "Done" Auto Const

	String property RideOffAnim = "Stop" Auto Const
	{This is the anim to play on this object when the ride is off}

	Bool property AutoTurnOff = true auto Const
	bool property HasLightState = true auto const
EndGroup

Function TurnRideOn(bool RideShouldBeOn = true)
	Debug.Trace(Self + ": TurnRideOn > " + RideShouldBeOn)
	if AutoTurnOff && RideShouldBeOn
		GoToState("Busy")
	Endif
	if RideShouldBeOn
		if !AutoTurnOff
			PlayAnimation(RideOnAnim)
		else
			PlayAnimationAndWait(RideOnAnim, RideOnAnimEndEvent)
			GoToState("RideIsOff")
		endif

	else 	;!RideShouldBeOn
		if RideOffAnim != ""
			PlayAnimation(RideOffAnim)
		endif
	endif
EndFunction

State Busy
	Event OnActivate(objectReference akActivator)
	endEvent
EndState

Event OnCellAttach()
	Debug.Trace(self + " OnCellAttach")
	bool powerGlobalIsOn = DLC04NukaWorldPowerOnGlobal.GetValue()
	if HasLightState && powerGlobalIsOn == 1
		Debug.Trace(self + " HasLightState turning lights On")
		PlayAnimation("TurnOn")
	endif
	Debug.Trace(self + ": OnCellAttach")
	if SetToOnWhenFirstPowered && powerGlobalIsOn == 1
		SetToOnWhenFirstPowered = false
		RideIsActive = true
	endif

	if RideIsActive
		GoToState("RideIsOn")
	else
		GoToState("RideIsOff")
	endif
EndEvent