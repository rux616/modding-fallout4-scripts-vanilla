ScriptName DefaultRotateHelper extends ObjectReference Default
{For use with "RotateHelperFree" Default script that toggles rotation from starting position to end position on activate}

import math
import game
import debug

Group Required_Properties
	int property DegreesToRotate = 45 auto const
	{default = 45}

	bool property CC = true auto
	{Rotate CounterClockwise? (default)}

	string property Speed = "medium" auto const
	{slow, medium(default), fast}

	Bool property alwaysOn = false auto const
	{always toggle back and forth? default = false}
EndGroup

Group Advanced_Properties CollapsedOnRef
	{Speed = time in seconds to rotate 45 degrees}
	float property speedSlow = 4.0 auto const
	float property speedMedium = 2.0 auto const
	float property speedFast = 1.0 auto const 
	traptripwire property myTripwire auto
	{If not empty, look for an "Inactive" state on the ref in this property"}
EndGroup

int currentPosition
int targetPosition
float mySpeed
int direction = 1

;************************************
Event OnLoad()
	if(speed == "slow")
		mySpeed = speedSlow
	elseif(speed =="medium")
		mySpeed = speedMedium
	elseif(speed == "fast")
		mySpeed = speedFast
	else
		mySpeed = speedSlow
	endif

	if CC
		direction = 1
	else
		direction = -1
	endif

	SetAnimationVariableFloat("fspeed", mySpeed * 2)
	registerForAnimationEvent(self,"done")

	if alwaysOn
		debug.trace("Rotate Helper: Auto-beginning")
		activate(self)
	endif
	
EndEvent

Event onActivate(objectReference triggerRef)
	currentPosition = 0
	targetPosition = DegreesToRotate
	doRotate()
endEvent

;************************************
event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "done"
    	if currentPosition == targetPosition && alwaysOn
    		; rotation move is over.  Am I looping?  reverse and reset if so.
    		;direction *= -1
			if targetPosition == 0
				targetPosition = DegreesToRotate
			else
				targetPosition = 0
			endif
    	endif
		doRotate()
    endif
EndEvent

function doRotate()
	int DegreesRemaining = targetPosition - currentPosition
	debug.trace("Beginning DoRotate of "+DegreesRemaining*direction+" degrees for "+self)

	if DegreesRemaining > 90
		currentPosition += 90
		SetAnimationVariableFloat("fspeed", mySpeed * 2)
		SetAnimationVariableFloat("fvalue", currentPosition*direction)
		playAnimation("play01")
	elseif DegreesRemaining < -90
		SetAnimationVariableFloat("fspeed", mySpeed * 2)
		currentPosition -= 90
		SetAnimationVariableFloat("fvalue", currentPosition*direction)
		playAnimation("play01")
	elseif abs(DegreesRemaining) > 0
		SetAnimationVariableFloat("fspeed", (mySpeed * 2)*(abs(DegreesRemaining)/90.0))
		currentPosition = targetPosition
		SetAnimationVariableFloat("fvalue", currentPosition*direction)
		playAnimation("play01")
	else
		debug.trace("called DoRotate, but nothing to do.")
	endif	
endFunction

function doRotateOLD()
		; figure out how much rotation we're going to attempt in total.
	
	int i90degRotationsToPerform = Floor(DegreesToRotate/90)
	int iRotationLeftovers = DegreesToRotate - (i90degRotationsToPerform*90)
	debug.trace("Rotate Helper!")
	debug.trace("     DegreesToRotate: "+DegreesToRotate)
	debug.trace("     i90degRotationsToPerform: "+i90degRotationsToPerform)
	debug.trace("     iRotationLeftovers: "+iRotationLeftovers)

	; register for animation event and start rotating
	int i = 0
	int iDegreesToRotate = 90
	if !CC 
		iDegreesToRotate*-1  ; if flagged for counter-clockwise, then go backwards.
	endif
	while i < i90degRotationsToPerform
		SetAnimationVariableFloat("fvalue", 90)
		playAnimationAndWait("play01", "done")
		i += 1
	endwhile

	; 90-degree increments are taken care of.  Play the rest now.
	if !CC 
		-1*(iRotationLeftovers)
	endif
	SetAnimationVariableFloat("fvalue", iRotationLeftovers)
	playAnimationAndWait("play01", "done")

endFunction

;************************************

; Function Rotate(int Degrees, bool CC = false)
; 	currentPosition = getAnimationVariableFloat("fvalue")

; 	if(Degrees > 0)
; 		if (!CC)
; 			Degrees = -Degrees
; 		endif

; 		SetAnimationVariableFloat("fvalue", currentPosition + Degrees)
; 		SetAnimationVariableFloat("fspeed", mySpeed * 2)
; 		playAnimationAndWait("play01", "done")`
; 	endif
	
; 	if(alwaysOn) && is3Dloaded()
; 		if(CC)
; 			CC = false
; 		else
; 			CC = true
; 		endif
; 		RotateLarge(DegreesToRotate, CC)
; 	endif
; endFunction

; ;=======

; Function RotateLarge(int TotalDegrees, bool CC = false)
; 	int countToRotate = Floor(TotalDegrees / 90)
; 	float RotateRemainder = ((TotalDegrees as float / 90) - countToRotate as float) * 90

; 	int i = 0
; 	while (i < CountToRotate) && is3Dloaded()
; 		Rotate(90, CC)
; 		i += 1
; 	endwhile

; 	Rotate(RotateRemainder as int, CC)
; EndFunction
