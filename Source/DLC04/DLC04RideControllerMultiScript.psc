Scriptname DLC04:DLC04RideControllerMultiScript extends DLC04:DLC04RideControllerGenericScript

Group ChildAnimationProperties
	float Property ChildRideOnAnimSpeed = 5.0 const auto
	{This is the speed in seconds for this to animate a full loop when the ride is on}

	float property ChildRideOffAnimSpeed = 35.0 const Auto
	{This is the speed in seconds for this to animate a full loop when the ride is off
		A super high time is effectively stopped}
EndGroup

Function TurnRideOn(bool RideShouldBeOn = true)
	if RideShouldBeOn
		setAnimationVariableFloat("fSpinDuration01", RideOnAnimSpeed)
		objectReference currentChild = GetLinkedRef()
		while currentChild
			currentChild.setAnimationVariableFloat("fSpinDuration01", ChildRideOnAnimSpeed)
			currentChild = currentChild.GetLinkedRef()
		endwhile
		RideIsActive = true
	else 	;!RideShouldBeOn
		setAnimationVariableFloat("fSpinDuration01", RideOffAnimSpeed)
		objectReference currentChild = GetLinkedRef()
		while currentChild
			currentChild.setAnimationVariableFloat("fSpinDuration01", ChildRideOffAnimSpeed)
			currentChild = currentChild.GetLinkedRef()
		endwhile
		RideIsActive = false
	endif
EndFunction