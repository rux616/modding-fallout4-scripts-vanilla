Scriptname DLC04:DLC04RideControllerGenericScript extends ObjectReference


Group RideAnimationProperties
	float Property RideOnAnimSpeed = 5.0 const auto
	{This is the speed in seconds for this to animate a full loop when the ride is on
		LOWER = FASTER}

	float property RideOffAnimSpeed = 50000.0 const Auto
	{This is the speed in seconds for this to animate a full loop when the ride is off
		HIGHER = SLOWER
		A super high time is effectively stopped}
EndGroup

Group PowerProperties
	bool property RideIsActive = false auto
	{Set if the ride is currently turned on and should be animating}

	GlobalVariable Property DLC04NukaWorldPowerOnGlobal Auto Const Mandatory

	Bool Property SetToOnWhenFirstPowered = true Auto
	{This property will tell the ride to be powered on the first time it is attached after the power is turned on
		Afterward, this is set to false in the script}
EndGroup



Group LinkRefProperties
	keyword Property SoundOriginLink Auto Const
	keyword Property LinkCustom01 Auto Const 
	keyword Property LinkCustom02 Auto Const 
	keyword property TrapTrigger Auto Const
EndGroup

int currentSoundDescriptor

Event OnCellAttach()
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

Event OnCellDetach()
	;Stop the sounds
	Sound.StopInstance(currentSoundDescriptor)
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		State Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

State RideIsOn
	Event OnBeginState(string asOldState)
	    ;Sound stuff
	    Sound.StopInstance(currentSoundDescriptor)
	    SetCanHit(true)

    	if LinkCustom01
    		EnableLinkChain(LinkCustom01, false)
    	Endif

    	;TurnRideOFFSounds OFF
    	if LinkCustom02
    		DisableLinkChain(LinkCustom02, false)
    	Endif
   
   		;Turn on damage triggers if needed
   		SetCanHit(true)
	    TurnRideOn(true)
	EndEvent

EndState


Auto State RideIsOff
	Event OnBeginState(string asOldState)
	   	
	   	Sound.StopInstance(currentSoundDescriptor)
	   	SetCanHit(False)
    	;TurnRideONSounds OFF
    	if LinkCustom01
    		DisableLinkChain(LinkCustom01, false)
    	Endif

    	;TurnRideOFFSounds ON
    	if LinkCustom02
    		EnableLinkChain(LinkCustom02, false)
    	Endif
   		
    	;Turn on damage triggers if needed
   		SetCanHit(false)
	    TurnRideOn(false)
	EndEvent
EndState

;Use for turning ride on/off with an activator
Event OnActivate(ObjectReference akActivateRef)
	;if this has global power
	if DLC04NukaWorldPowerOnGlobal.GetValue() >= 1
		if RideIsActive
			GoToState("RideIsOff")
		else
			GoToState("RideIsOn")
		endif
	Endif
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Ride Animation Block
;	Rides extended from this will replace this with a local function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function TurnRideOn(bool RideShouldBeOn = true)
	if RideShouldBeOn
		setAnimationVariableFloat("fSpinDuration01", RideOnAnimSpeed)
		RideIsActive = true
	else 	;!RideShouldBeOn
		setAnimationVariableFloat("fSpinDuration01", RideOffAnimSpeed)
		RideIsActive = false
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Trap Hit Functionality
;	Not everything will need this, but it is here if needed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bool Property SelfHasTrapCollision = false auto const 
Function SetCanHit(Bool CanHit)
	if SelfHasTrapCollision
		DLC04:DLC04RideGenericTrapHit TrapSelf = ((Self as objectReference) as DLC04:DLC04RideGenericTrapHit)
		if TrapSelf
			if CanHit
				TrapSelf.GoToState("CanHit")
			else
				TrapSelf.GoToState("CannotHit")
			endif
		elseif TrapTrigger
    		objectReference[] TrapRefs = GetRefsLinkedToMe(TrapTrigger)
    		int i
    		int count = TrapRefs.length
    		while i < count
    			if CanHit
    				(TrapRefs[i] as DLC04:DLC04RideGenericTrapHit).GoToState("CanHit")
    			else
    				(TrapRefs[i] as DLC04:DLC04RideGenericTrapHit).GoToState("CannotHit")
    			endif
    			i += 1
    		EndWhile
    	endif
    endif
EndFunction