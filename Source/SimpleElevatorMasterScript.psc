Scriptname SimpleElevatorMasterScript extends ObjectReference Hidden


Group Required_Properties
	Float Property TimeTakenToMove = 4.0 Auto
	{The time, in seconds, it takes for the elevator to move from point A to B. (DEFAULT = 4)}
	Bool Property bStartAtTop Auto
	{Whether the elevator starts at the top or not.}
	Keyword Property LinkCustom01 Auto
	{Link to the Platform Helper}
	Keyword Property LinkCustom02 Auto
	{Link (chain) to the buttons that can move the elevator}
	Keyword Property LinkCustom05 Auto
	{Link to the elevator platform itself (for playing the sound)}

EndGroup


Group Optional_Properties
	Keyword Property LinkCustom03 Auto
	{Link to the Counterweight's Platform Helper}
	Keyword Property LinkCustom04 Auto
	{Link to the Ref (motor) we want to animate while elevator is moving.}
	Keyword Property LinkCustom06 Auto
	{Link to the elevator counterweight itself (for playing the sound)}
	String Property AnimToPlayOnLink04WhileMoving = "play01" Auto
	{Anim to play on LinkCustom04 while elevator is moving (DEFAULT = "play01")
	(Extra-Optional:This is the DOWN anim to play if there is an AnimToPlayOnLink04WhileGoingUp anim provided.)}
	String Property AnimToPlayOnLink04WhenStopped = "play02" Auto
	{Anim to play on LinkCustom04 when elevator stops (DEFAULT = "play02")}
	String Property ExtraAnimToPlayOnLink04WhileGoingUp Auto
	{Extra anim to play on LinkCustom04 when elevator is going up (DEFAULT = "NULL")}
	Sound Property SoundForPlatform Auto
	{Looping sound for the platform}
	Sound Property SoundForElevatorMotor Auto
	{Looping sound for elevator motor}
	Sound Property SoundForCounterweight Auto
	{Looping sound for counterweight}
	Keyword Property LinkCustom07 Auto
	{Link to the door you'd like to open when the elevator is at the bottom}
	Keyword Property LinkCustom08 Auto
	{Link to the door you'd like to open when the elevator is at the top}
	Keyword Property LinkCustom09 Auto
	{Link to the navcut collision at the bottom of the elevator.}
	Keyword Property LinkCustom10 Auto
	{Link to the navcut collision at the top of the elevator.}
	String Property AnimToPlayOnLink07ToOpenDoor = "play01" Auto
	String Property AnimToPlayOnLink07ToCloseDoor = "play01" Auto
	String Property AnimToPlayOnLink08ToOpenDoor = "play01" Auto
	String Property AnimToPlayOnLink08ToCloseDoor = "play01" Auto
	
EndGroup


Bool bElevatorAtTop
;Current Position of the elevator

Bool bHasAlreadyLoaded
;Whether we've loaded for the first time or not


Event OnCellLoad()
	if !bStartAtTop && !bHasAlreadyLoaded
		float fPlatHelperScaledDistance = (GetLinkedRef(LinkCustom01).GetScale() * 1030)
		RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), (fPlatHelperScaledDistance + 1024))

	elseif !bHasAlreadyLoaded
		float DistanceToPlayer = self.GetDistance(Game.GetPlayer())
		if DistanceToPlayer > 1024
			StartTimer(2 + ((DistanceToPlayer - 1536)/256))

		else
			StartTimer(2)

		endif

	endif

EndEvent

Event OnUnload()

	UnregisterForDistanceEvents(self, Game.GetPlayer())

endEvent

EVENT OnTimer(int aiTimerID)
	SimpleElevatorSetupFunction()

endEvent


EVENT OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	SimpleElevatorSetupFunction()

endEVENT


	; Required if you want to use this even in a State
Event ObjectReference.onActivate(objectReference akSender, ObjectReference akActionRef)
	; Do Nothing
endEvent


auto STATE WaitingForActivate
	Event ObjectReference.onActivate(objectReference akSender, ObjectReference akActionRef)
		; Jump into "busy" state so that we don't accept any more activation events
		GoToState("Busy")

		ObjectReference BottomDoorReference = GetLinkedRef(LinkCustom07)
		if BottomDoorReference && !bElevatorAtTop
	    	BottomDoorReference.PlayAnimationAndWait(AnimToPlayOnLink07ToCloseDoor, "Done")
	    endif

	    	; If there is a top door, and the elevator is at the top, then wait and open the door
		ObjectReference TopDoorReference = GetLinkedRef(LinkCustom08)
		if TopDoorReference && bElevatorAtTop
	    	TopDoorReference.PlayAnimationAndWait(AnimToPlayOnLink08ToCloseDoor, "Done")
	    endif

		utility.Wait(0.8)

			; If there is a motor, then animate it
		ObjectReference MotorToAnimate = GetLinkedRef(LinkCustom04)
		int ElevatorMotorSoundInstance
		if MotorToAnimate
				; If the elevator is going up, and we have an up animation to call, then play it.  Else, play down anim.
			if ExtraAnimToPlayOnLink04WhileGoingUp && !bElevatorAtTop
				debug.Trace("Elevator: Playing UP ANIM: " + ExtraAnimToPlayOnLink04WhileGoingUp + " on reference " + MotorToAnimate)
				MotorToAnimate.PlayAnimation(ExtraAnimToPlayOnLink04WhileGoingUp)
			elseif ExtraAnimToPlayOnLink04WhileGoingUp && bElevatorAtTop
				debug.Trace("Elevator: Playing DOWN ANIM: " + AnimToPlayOnLink04WhileMoving + " on reference " + MotorToAnimate)
				MotorToAnimate.PlayAnimation(AnimToPlayOnLink04WhileMoving)
			endif

				; If there is no extra anim to play, then just play this single one for the motor
			if !ExtraAnimToPlayOnLink04WhileGoingUp
				debug.Trace("Elevator: Playing ANIM: " + AnimToPlayOnLink04WhileMoving + " on reference " + MotorToAnimate)
				MotorToAnimate.PlayAnimation(AnimToPlayOnLink04WhileMoving)
			endif

				; Play the motor sound
			ElevatorMotorSoundInstance = SoundForElevatorMotor.Play(MotorToAnimate)
		endif
			; If there is a counterweight, then move it the right direction
		Objectreference CounterweightPlatformHelper = GetLinkedRef(LinkCustom03)
		int CounterweightSoundInstance
		if CounterweightPlatformHelper
			if bElevatorAtTop
				CounterweightPlatformHelper.SetAnimationVariableFloat("fvalue", 1)
			else
				CounterweightPlatformHelper.SetAnimationVariableFloat("fvalue", 0)
			endif
			; Play the counterweight sound at counterweightreference
			CounterweightSoundInstance = SoundForCounterweight.Play(GetLinkedRef(LinkCustom06))
			CounterweightPlatformHelper.PlayAnimation("Play01")

		endif

			; Move the elevator the right direciton based on it's current position
		ObjectReference MainPlatformHelper = GetLinkedRef(LinkCustom01)
		if bElevatorAtTop
					;If there is a TOP NavCut, then enable it now that the elevator is on it's way down.
				if GetLinkedRef(LinkCustom10)
					GetLinkedRef(LinkCustom10).EnableNoWait()
				endif

				MainPlatformHelper.SetAnimationVariableFloat("fvalue", 0)
			else
					;If there is a BOTTOM NavCut, then enable it now that the elevator is on it's way up.
				if GetLinkedRef(LinkCustom09)
					GetLinkedRef(LinkCustom09).EnableNoWait()
				endif
				MainPlatformHelper.SetAnimationVariableFloat("fvalue", 1)
		endif

			; Play the elevator platform sound at PlatformReference
		int PlatformSoundInstance = SoundForPlatform.Play(GetLinkedRef(LinkCustom05))

			; Wait until the elevator has finished moving
		MainPlatformHelper.PlayAnimationAndWait("Play01","Done")

			; Stop the elevator platform sound
		Sound.StopInstance(PlatformSoundInstance)

			; If there is a counterweight, stop it's sound
		if CounterweightPlatformHelper
			Sound.StopInstance(CounterweightSoundInstance)
		endif

			; Update it's current state
		if bElevatorAtTop
				bElevatorAtTop = FALSE
					;If there is a BOTTOM NavCut, then disable it now that the elevator is at the bottom.
				if GetLinkedRef(LinkCustom09)
					GetLinkedRef(LinkCustom09).DisableNoWait()
				endif
			else
				bElevatorAtTop = TRUE
					;If there is a TOP NavCut, then disable it now that the elevator is at the top.
				if GetLinkedRef(LinkCustom10)
					GetLinkedRef(LinkCustom10).DisableNoWait()
				endif
		endif

			; If there is a motor then tell it to play its "done animating" animation, and stop it's sound
		if MotorToAnimate
			MotorToAnimate.PlayAnimation(AnimToPlayOnLink04WhenStopped)
			Sound.StopInstance(ElevatorMotorSoundInstance)
		endif

			; If there is a bottom door, and the elevator is at the bottom, then wait and open the door
		if BottomDoorReference && !bElevatorAtTop
	    	BottomDoorReference.PlayAnimationAndWait(AnimToPlayOnLink07ToOpenDoor, "Done")
	    endif

	    	; If there is a top door, and the elevator is at the top, then wait and open the door
		if TopDoorReference && bElevatorAtTop
	    	TopDoorReference.PlayAnimationAndWait(AnimToPlayOnLink08ToOpenDoor, "Done")
	    endif

			; Go back to the state where we allow elevator activation
		GoToState("WaitingForActivate")
	endEvent
EndSTATE



STATE Busy
	Event ObjectReference.onActivate(objectReference akSender, ObjectReference akActionRef)
		; Do Nothing
	endEvent
EndSTATE



bool Function GetIsRaised()
	while GetState() == "Busy" && Is3dLoaded()
		utility.Wait(0.5)
	EndWhile
	return bElevatorAtTop
EndFunction

Function SimpleElevatorSetupFunction()

	    ObjectReference[] ButtonArray = GetLinkedRefChain(LinkCustom02)
    	; Register for OnActivate for each button in the chain.
	    int i = 0
	    while i < ButtonArray.Length
	    	RegisterForRemoteEvent(ButtonArray[i], "onActivate")
	    	i += 1
	    endwhile

		ObjectReference MainPlatformHelper = GetLinkedRef(LinkCustom01)
    	if MainPlatformHelper
    		;int breakCounter
    		;while MainPlatformHelper.Is3DLoaded() != TRUE || breakCounter >= 15
    		;	utility.wait(0.5)

    		;	breakCounter += 1
    		;endWhile
    		MainPlatformHelper.waitfor3dLoad()
	    	MainPlatformHelper.SetAnimationVariableFloat("fspeed", 0)
	    	MainPlatformHelper.SetAnimationVariableFloat("fvalue", bStartAtTop as float)
	    	MainPlatformHelper.PlayAnimation("Play01")

    	endif

		ObjectReference CounterweightPlatformHelper = GetLinkedRef(LinkCustom03)
    	if CounterweightPlatformHelper
    		CounterweightPlatformHelper.SetAnimationVariableFloat("fspeed", 0)
    		CounterweightPlatformHelper.SetAnimationVariableFloat("fvalue", (!bStartAtTop) as float)
    		CounterweightPlatformHelper.PlayAnimation("Play01")

    	endif

		ObjectReference TopDoorReference = GetLinkedRef(LinkCustom08)
    	if TopDoorReference && bStartAtTop == TRUE
    		TopDoorReference.PlayAnimation(AnimToPlayOnLink07ToOpenDoor)

    	endif

		ObjectReference BottomDoorReference = GetLinkedRef(LinkCustom07)
    	if BottomDoorReference && bStartAtTop == FALSE
    		BottomDoorReference.PlayAnimation(AnimToPlayOnLink08ToOpenDoor)

    	endif

			; If there is a BOTTOM NavCut, And the elevator is starting at the TOP, then enable it.
		if GetLinkedRef(LinkCustom09) && bStartAtTop == TRUE
			GetLinkedRef(LinkCustom09).EnableNoWait()
		endif

			; If there is a TOP NavCut, And the elevator is starting at the TOP, then disable it.
		if GetLinkedRef(LinkCustom10) && bStartAtTop == TRUE
			GetLinkedRef(LinkCustom10).DisableNoWait()
		endif

			; If there is a BOTTOM NavCut, And the elevator is starting at the BOTTOM, then disable it.
		if GetLinkedRef(LinkCustom09) && bStartAtTop == FALSE
			GetLinkedRef(LinkCustom09).DisableNoWait()
		endif

			; If there is a TOP NavCut, And the elevator is starting at the BOTTOM, then enable it.
		if GetLinkedRef(LinkCustom10) && bStartAtTop == FALSE
			GetLinkedRef(LinkCustom10).EnableNoWait()
		endif

    	bElevatorAtTop = bStartAtTop
	    bHasAlreadyLoaded = TRUE

	    ; Set bot move helper speeds to the specified speed
	    MainPlatformHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)
	    if CounterweightPlatformHelper
	    	CounterweightPlatformHelper.SetAnimationVariableFloat("fspeed", TimeTakenToMove)
	    	
	    endif

EndFunction