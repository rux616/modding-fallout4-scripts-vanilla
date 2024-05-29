Scriptname DLC04:DLC04_KK_FunhouseHynoHallController extends ObjectReference Conditional

;DLC04:DLC04SpinningHelperScript

bool property rideIsActive = true Auto Conditional

Function SetRideActive(bool shouldRideBeActive)
	rideIsActive = shouldRideBeActive
	SetChildStates(rideIsActive)
EndFunction


Function SetChildStates(bool shouldRideBeActive)
	ObjectReference[] myRideControllers = GetRefsLinkedToMe()
	int i = 0
	int count = myRideControllers.length
	while i < count
		(myRideControllers[i] as DLC04:DLC04SpinningHelperScript).SetRideOn(shouldRideBeActive)
		i += 1
	EndWhile
EndFunction