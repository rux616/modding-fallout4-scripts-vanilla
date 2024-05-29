Scriptname DN079_CanneryLidScript extends ObjectReference

Group Keywords
	Keyword Property LinkCustom01 Auto Const
	Keyword Property LinkCustom02 Auto Const
	Keyword Property LinkCustom03 Auto Const
	Keyword Property LinkCustom04 Auto Const
	Keyword Property LinkCustom05 Auto Const
	Keyword Property LinkCustom06 Auto Const
EndGroup

Group SoundProperties
	Sound Property MovementMotor Auto Const
	Sound Property Clamp1 Auto Const
	Sound Property Clamp2 Auto Const
	Sound Property Clamp3 Auto Const
	Sound Property CloseSound Auto Const
EndGroup

bool isOpen = false


Auto State Closed
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		SetLidOpen(true)
		GoToState("Open")
		isOpen = true
	endEvent

EndState


State Open
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		SetLidOpen(false)
		GoToState("Closed")
		isOpen = false
	endEvent

EndState


State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing, we're busy go away
	endEvent
EndState


Function SetLidOpen(bool shouldBeOpen = true)
	ObjectReference BottomHinge = GetLinkedRef(LinkCustom01)
	ObjectReference LeftHinge = GetLinkedRef(LinkCustom02)
	ObjectReference RightHinge = GetLinkedRef(LinkCustom03)
	ObjectReference UpperMinorHinge = GetLinkedRef(LinkCustom04)
	ObjectReference UpperMajorHinge = GetLinkedRef(LinkCustom05)
	ObjectReference Collider = GetLinkedRef(LinkCustom06)

	int myMotorSound

	BottomHinge.SetAnimationVariableFloat("fSpeed", 6.0)
	LeftHinge.SetAnimationVariableFloat("fSpeed", 20.0)
	RightHinge.SetAnimationVariableFloat("fSpeed", 20.0)

	if shouldBeOpen
		Collider.Disable()
		Clamp1.Play(BottomHinge)
		BottomHinge.PlayAnimation("Play90")
		utility.wait(0.3)
		Clamp2.Play(LeftHinge)
		LeftHinge.PlayAnimation("Play180")
		Clamp3.Play(RightHinge)
		RightHinge.PlayAnimation("Play180")
		utility.Wait(1.2)
		myMotorSound = MovementMotor.Play(UpperMajorHinge)
		UpperMinorHinge.PlayAnimation("Play90")
		utility.wait(1.5)
		UpperMajorHinge.PlayAnimationAndWait("Play90", "Done")
	else	;We Are closing
		Collider.Enable()
		myMotorSound = MovementMotor.Play(UpperMajorHinge)
		UpperMajorHinge.PlayAnimation("Play0")
		utility.wait(0.8)
		UpperMinorHinge.PlayAnimationAndWait("Play0", "Done")
		CloseSound.Play(Collider)
		Clamp2.Play(LeftHinge)
		LeftHinge.PlayAnimation("Play0")
		Clamp3.Play(RightHinge)
		RightHinge.PlayAnimation("Play0")
		utility.Wait(0.6)
		Clamp1.Play(BottomHinge)
		BottomHinge.PlayAnimationAndWait("Play0", "Done")
	endif
	sound.StopInstance(myMotorSound)
EndFunction

Event OnCellAttach()
	ObjectReference BottomHinge = GetLinkedRef(LinkCustom01)
	ObjectReference LeftHinge = GetLinkedRef(LinkCustom02)
	ObjectReference RightHinge = GetLinkedRef(LinkCustom03)
	ObjectReference UpperMinorHinge = GetLinkedRef(LinkCustom04)
	ObjectReference UpperMajorHinge = GetLinkedRef(LinkCustom05)
	ObjectReference Collider = GetLinkedRef(LinkCustom06)

	BottomHinge.SetAnimationVariableFloat("fSpeed", 6.0)
	LeftHinge.SetAnimationVariableFloat("fSpeed", 20.0)
	RightHinge.SetAnimationVariableFloat("fSpeed", 20.0)

	if isOpen
		Collider.Disable()
		BottomHinge.PlayAnimation("Start90")
		LeftHinge.PlayAnimation("Start180")
		RightHinge.PlayAnimation("Start180")
		UpperMinorHinge.PlayAnimation("Start90")
		UpperMajorHinge.PlayAnimation("Start90")
	else
		Collider.Enable()
		UpperMajorHinge.PlayAnimation("Play0")
		UpperMinorHinge.PlayAnimation("Play0")
		LeftHinge.PlayAnimation("Play0")
		RightHinge.PlayAnimation("Play0")
		BottomHinge.PlayAnimation("Play0")
	endif
EndEvent




;/
Events you can call:
-	Play0
-	Play30
-	Play45
-	Play90
-	Play180

-	Start30
-	Start45
-	Start90
-	Start180

Events to Listen for:
-	Done

Variables you can change:
-	fSpeed – Changes the speed of the animation when going from zero to any of the other rotations and back, but it is a multiplier so something like .5 will cut it’s speed in half, and something like 2 will double its speed etc.

-	fSpeedWild – Changes the speed of the animation when starting from any rotation other than zero to another rotation. This number is in seconds. Defaults at 2 seconds. 


/;