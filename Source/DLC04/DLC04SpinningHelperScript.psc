Scriptname DLC04:DLC04SpinningHelperScript extends ObjectReference


float Property startingAnimSpeed = 5.0 const auto
{This is the speed in seconds for this to animate a full loop when the ride is on}
float property stoppedSpeed = 35.0 const Auto
{This is the speed in seconds for this to animate a full loop when the ride is off
	A super high time is effectively stopped}
bool property RideIsActive = true auto 
{Set if the ride is currently turned on and should be animating}

Event OnCellAttach()
	Debug.Trace(self + ": OnCellAttach")
	if RideIsActive
		setAnimationVariableFloat("fSpinDuration01", startingAnimSpeed)
	else
		setAnimationVariableFloat("fSpinDuration01", stoppedSpeed)
	endif
EndEvent


Function SetRideOn(bool rideShouldBeOn)
	if rideShouldBeOn
		if !RideIsActive
			RideIsActive = true
			setAnimationVariableFloat("fSpinDuration01", startingAnimSpeed)
		endif
	else
		if RideIsActive
			RideIsActive = false
			setAnimationVariableFloat("fSpinDuration01", stoppedSpeed)
		endif
	Endif
EndFunction