ScriptName DLC02:DLC02TrapPoweredSpring Extends ObjectReference
;
;
;
;
import utility

bool isGrabbed = false

Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Trip" auto Const
	String Property TriggerEvent = "TransitionComplete" auto Const
	String Property ResetAnim = "Set" auto Const
	String Property ResetEvent = "TransitionComplete" auto Const

EndGroup

bool disarmed = false

Auto State Idle
	event OnBeginState(string asOldState)
		if !disarmed
			if IsPowered()
				debug.trace(self + "returned to idle but has power")
				self.Activate(self)
			endif
		endif
	endEvent

	Event onActivate(objectReference activateRef)
		if !disarmed

			if activateRef == self
				GoToState("TransitionToActive")
			endif
		endif
	endEvent

	Event OnPowerOn(ObjectReference akPowerGenerator)
		if !disarmed && !isGrabbed
			debug.trace(self + "akPowerGenerator=" + akPowerGenerator)
			self.Activate(self)
		Endif
	endEvent
EndState

;Transition state needed to block the script from changing state while it is animating
;	it then goes to the correct state and will check if the power state has changed
State TransitionToActive
	event OnBeginState(string asOldState)
		SetCanHit(true)
		PlayAnimationAndWait(TriggerAnim, TriggerEvent)
		SetCanHit(false)
		GoToState("Active")
	endEvent
EndState

State Active
	event OnBeginState(string asOldState)
		if !disarmed
			if !IsPowered()
				debug.trace(self + "returned to idle but has power")
				GoToState("TransitionToIdle")
			endif
		endif
	endEvent


	Event OnPowerOff()
		if !disarmed
			GoToState("TransitionToIdle")
		endif
	EndEvent
endState

;Transition state needed to block the script from changing state while it is animating
;	it then goes to the correct state and will check if the power state has changed
State TransitionToIdle
	event OnBeginState(string asOldState)
		SetCanHit(false)
		PlayAnimationAndWait(ResetAnim, ResetEvent)
		GoToState("Idle")
	endEvent
EndState

;Placeholder state, nothing happens while in here till it is repaired
State Disarm
EndState

Event OnWorkshopObjectRepaired(ObjectReference akReference)
	debug.Trace(self + ": Recieved OnWorkshopObjectRepaired from >> " + akReference)
	RepairTrap()

EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	Debug.Trace(Self + ": TRAP WAS MOVED IN WORKSHOP MODE")
	isGrabbed = false
	if !disarmed
		if IsPowered()
			if GetState() != "Active"
				debug.trace(self + "Was repaired and already has power")
				GoToState("TransitionToActive")
			endif
		else
			if GetState() != "Idle"
				GoToState("TransitionToIdle")
			endif
		Endif
	endif
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	Debug.Trace(Self + ": TRAP WAS GRABBED IN WORKSHOP MODE")
	isGrabbed = true
EndEvent

Function RepairTrap()
	self.SetDestroyed(False)
	SetAnimationVariableBool("bDestroyed", 0)
	ClearDestruction()

	;Tell the Hit Script to reset the hit counter
	DLC02TrapPoweredSpringHit HitBase = ((Self as ObjectReference) as DLC02TrapPoweredSpringHit)
	if HitBase
		HitBase.SetRepaired()
	endif

	Disarmed = false
	If IsPowered()
		GoToState("TransitionToActive")
	else
		GoToState("TransitionToIdle")
	endif
EndFunction

Event onReset()
	self.Enable()
	RepairTrap()
endEvent


Event OnCellAttach()
	if !disarmed
		if IsPowered()
			GoToState("TransitionToActive")
		else
			GoToState("TransitionToIdle")
		Endif
	endif

	self.blockActivation(true)
EndEvent


Function SetCanHit(bool ifCanHit = true)
	DLC02TrapPoweredSpringHit hitBase = (self as objectReference) as DLC02TrapPoweredSpringHit
	hitBase.SetCanHit(ifCanHit)
EndFunction


Function DisarmTrap()
	GoToState("Disarm")
	SetAnimationVariableBool("bDestroyed", 1)

	;Tell the Hit Script that we cannot hit actors now
	SetCanHit(false)

	Self.SetDestroyed()
endFunction
