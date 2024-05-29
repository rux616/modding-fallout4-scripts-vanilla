Scriptname DLC05:DLC05BallTrackSwitch extends ObjectReference

Group Properties
	String Property TurnOn = "TurnOn" Auto Const
	String Property TurnOff = "TurnOff" Auto Const
	String Property AnimEnd = "TransitionComplete" Auto const

	Float Property SwitchDelay = 1.0 Auto
	{This float could be changed by a terminal to allow the player to control how quickly to toggle}
EndGroup

bool hasPower = false
bool CircuitOpen = false
bool IsBusy = false


Event OnTriggerEnter(ObjectReference AkTriggerRef)
	Debug.Trace(Self + ": Has received OnTriggerEnter from >> " + AkTriggerRef)
	while IsBusy
		utility.wait(0.1)
	endWhile
	IsBusy = true
	StartTimer(SwitchDelay)
	if CircuitOpen
		Debug.Trace(Self + ": Has Power -> Turning On")
		PlayAnimation(TurnOff)
		CircuitOpen = false
	else
		Debug.Trace(Self + ": No Power -> Turning Off")
		PlayAnimation(TurnOn)
		CircuitOpen = true
 	endif
 	
EndEvent


Event OnTimer(int aiTimerID)
	Debug.Trace(Self + ": Has recieved Timer Event:: IsBusy >> " + IsBusy)
	IsBusy = false
EndEvent

;/
;Power Events, use these to track power so we can just check a variable
Event OnPowerOn(ObjectReference akPowerGenerator)
	hasPower = true
	if CircuitOpen
		PlayAnimation(TurnOn)
	else
		PlayAnimation(TurnOff)
	endif
EndEvent

Event OnPowerOff()
	Debug.Trace(Self + ": Lost Power -> Turning Off")
	hasPower = false
	;PlayAnimation(TurnOff)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	hasPower = IsPowered()
EndEvent

Event OnCellAttach()
	hasPower = IsPowered()
EndEvent
/;

Function SetMyDelay(float newDelay)
	SwitchDelay = newDelay
EndFunction