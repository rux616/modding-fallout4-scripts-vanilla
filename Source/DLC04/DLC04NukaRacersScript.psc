Scriptname DLC04:DLC04NukaRacersScript extends DLC04:DLC04RideControllerGenericScript

Group ChildAnimationProperties
	Float Property StartingPosition = 0.0 auto Const
	{fposition01 }
EndGroup

Function TurnRideOn(bool RideShouldBeOn = true)

	if RideShouldBeOn
		SetAnimationVariableFloat("fduration01", RideOnAnimSpeed)
		SetCanHit(True)
	else 	;!RideShouldBeOn
		SetAnimationVariableFloat("fduration01", RideOffAnimSpeed)
		SetCanHit(false)
	endif

EndFunction

State Busy
	Event OnActivate(objectReference akActivator)
	endEvent
EndState


Event OnCellAttach()
	;Set the starting position for this car and snap it to that position
	;This stops the car as well, then we control it through the floats
	SetAnimationVariableFloat("fposition01", StartingPosition)
	PlayAnimation("Start01")
	if RideIsActive
		SetAnimationVariableFloat("fduration01", RideOnAnimSpeed)
	else
		SetAnimationVariableFloat("fduration01", RideOffAnimSpeed)
	endif
	;This starts the car "moving" at whatever the speed is
	PlayAnimation("Play01")

	Debug.Trace(self + ": OnCellAttach")
	if SetToOnWhenFirstPowered && DLC04NukaWorldPowerOnGlobal.GetValue() == 1
		SetToOnWhenFirstPowered = false
		RideIsActive = true
	endif

	if RideIsActive
		GoToState("RideIsOn")
	else
		GoToState("RideIsOff")
	endif
EndEvent

