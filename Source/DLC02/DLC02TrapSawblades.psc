ScriptName DLC02:DLC02TrapSawblades Extends ObjectReference
;
;
;
;
import utility

bool isGrabbed = false

Group DisarmProperties

	Sound property DisarmSound Auto Const

EndGroup

Group MotorProperties

	float property TranslationSpeed = 1.0 Auto
EndGroup

bool disarmed = false
string movementAnimString = "fTrapSpeed" const

Auto State Idle
	event OnBeginState(string asOldState)
		if !disarmed
			;FanMotorOn(false)
			SetAnimationVariableFloat(movementAnimString, 0.0)
			SetCanHit(false)
		endif
	endEvent

	Event onActivate(objectReference activateRef)
		if !disarmed


			if activateRef == self
				GoToState("Active")
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

State Active
	event OnBeginState(string asOldState)
		if !disarmed
			;FanMotorOn(true)
			SetAnimationVariableFloat(movementAnimString, TranslationSpeed)
			SetCanHit(true)
		endif
	endEvent


	Event OnPowerOff()
		if !disarmed
			GoToState("Idle")
		endif
	EndEvent
endState

;Placeholder state, nothing happens while in here till it is repaired
State Disarm
EndState

Event OnWorkshopObjectRepaired(ObjectReference akReference)
	debug.Trace(self + ": Recieved OnWorkshopObjectRepaired from >> " + akReference)
	;if akReference == self as objectReference
		RepairTrap()
	;endif
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	Debug.Trace(Self + ": TRAP WAS MOVED IN WORKSHOP MODE")
	isGrabbed = false
	if IsPowered() && !disarmed
		debug.trace(self + "Was repaired and already has power")
		GoToState("Active")
	elseif !IsPowered() && !disarmed
		GoToState("Idle")
	Endif
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	Debug.Trace(Self + ": TRAP WAS GRABBED IN WORKSHOP MODE")
	isGrabbed = true
EndEvent

Function RepairTrap()
	self.SetDestroyed(False)

	ClearDestruction()

	;minor delay to prevent sound stomping
	utility.Wait(1.0)
	;Tell the Hit Script to reset the hit counter
	DLC02TrapSawbladesHit HitBase = ((Self as ObjectReference) as DLC02TrapSawbladesHit)
	if HitBase
		HitBase.SetRepaired()
	endif

	Disarmed = false
	If IsPowered()
		GoToState("Active")
	else
		GoToState("Idle")
	endif
EndFunction

Event onReset()
	self.Enable()
	RepairTrap()
endEvent


Event OnCellAttach()
	if IsPowered() && !disarmed
		GoToState("Active")
	elseif !IsPowered() && !disarmed
		GoToState("Idle")
	Endif

	self.blockActivation(true)
EndEvent


Function SetCanHit(bool ifCanHit = true)
	DLC02TrapSawbladesHit hitBase = (self as objectReference) as DLC02TrapSawbladesHit
	hitBase.SetCanHit(ifCanHit)
EndFunction


Function DisarmTrap()
	GoToState("Disarm")
	Disarmed = True
	;Disarm the trap
	objectReference objSelf = self as ObjectReference

	;Tell the Hit Script that we cannot hit actors now
	SetCanHit(false)

	;FanMotorOn(false)
	SetAnimationVariableFloat(movementAnimString, 0.0)
	DamageObject(500)

	If DisarmSound
		DisarmSound.Play(objSelf)
	endif
	Self.SetDestroyed()
endFunction
