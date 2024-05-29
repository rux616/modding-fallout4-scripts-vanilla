Scriptname ArtilleryReferenceScript Extends ObjectReference
{}

String CurrentTurnEvent
int CurrentCardinal = 0
int PreviousCardinal = 0
;Actor CurrentWorker
ObjectReference CurrentTarget
float AngleSnap = 20.0					;This is the angle given in the animation
ObjectReference MinArtilleryMarker
bool TestFire = false
bool noFire = false

Group ExplosionProperties
	Weapon Property WorkshopArtilleryWeapon Auto Const
	;explosion Property MinArtilleryExplosion Auto
	Activator Property WorkshopArtilleryFakeProjectile Auto Const
	Form Property XmarkerHeading Auto Const
	Sound Property FXProjectileArtilleryMinutemen Auto Const
	Explosion Property WorkshopArtilleryForce Auto Const
	Explosion Property MinArtilleryMuzzleFlash Auto Const

	Activator Property WorkshopArtilleryStrikeProjectileShooterClose Auto Const
	Activator Property WorkshopArtilleryStrikeProjectileShooterFar Auto Const
	Sound Property WPNArtilleryMinutemenFire Auto Const
	;Sound Property FXExplosionArtilleryMinutemen Auto Const
EndGroup

Group AnimationProperties CollapsedOnRef
	;This is where I wish we had Enums
	Idle Property ArtilleryFire Auto Const
	Idle Property ArtilleryStop Auto Const
	Idle Property ArtilleryTurnClockwise Auto Const
	Idle Property ArtilleryTurnCounterClockwise Auto Const
EndGroup

CustomEvent FinishedFiring

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Main Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; KMK - added this so I can use it from MinArtilleryScript - modify as needed
Function FireAtTarget(ObjectReference TargetToFireAt, bool turnToTargetOnly = false)
	Debug.Trace(Self + ": turnToTargetOnly = " + turnToTargetOnly)
	CurrentTarget = TargetToFireAt
	if TestFire
		PlaceTargetMarker()
	else
		MinArtilleryMarker = TargetToFireAt
	Endif
	if Is3DLoaded()
		TurnToTarget(TargetToFireAt, turnToTargetOnly)
	else
		FireMortar()
	endif
EndFunction

;This is the main guts needed to turn the artillery to face the target
Function TurnToTarget(ObjectReference TargetToFireAt, bool doNotFire = false)
	debug.trace(self + " TurnToTarget: TargetToFireAt=" + TargetToFireAt + ", doNotFire=" + doNotFire)
	;GetCardinalOffset()
	Debug.Trace(Self + ": doNotFire == " + doNotFire)
	bool TurnCCW = false

	float FiringAngle
	float myHeadingAngle
	int myHeadingCardinal 

	myHeadingAngle = GetHeadingAngle(TargetToFireAt)
	Debug.Trace(Self + ": GetHeadingAngle = " + myHeadingAngle)
	;No Negative Numbers
	FiringAngle = myHeadingAngle
	if FiringAngle < 0
		FiringAngle += 360
	Endif

	int upDownTest = (math.floor(FiringAngle/(AngleSnap/2)) % 2)
	;We are closer to the next cardinal
	Debug.Trace(Self + ": upDownTest = " + upDownTest)
	if upDownTest == 1	;We are closer to the next cardinal, so go up
		myHeadingCardinal = math.Ceiling(FiringAngle/AngleSnap)
	Else 				;We are closer to the laset cardinal, so go down
		myHeadingCardinal = math.Floor(FiringAngle/AngleSnap)
	endif
	;Debug.Trace(Self + ": myHeadingCardinal == " + myHeadingCardinal)
	;Make sure it can't be over our total
	myHeadingCardinal = (myHeadingCardinal % ((360/angleSnap) as int))


	;CurrentTurnEvent = Cardinals[myHeadingCardinal]
	CurrentTurnEvent = myHeadingCardinal as string
	Debug.Trace(Self + ": PreviousCardinal = " + PreviousCardinal)
	Debug.Trace(Self + ": myHeadingCardinal = " + myHeadingCardinal)
	;If we are not already pointing in the correct direction
	if PreviousCardinal != myHeadingCardinal
		RegisterForAnimationEvent(Self, CurrentTurnEvent)
		;Figure out if we turn Clockwise or counter clockise
		
		turnCCW = GetTurnDirection(PreviousCardinal, myHeadingCardinal)
		if doNotFire
			noFire = true
		else
			noFire = false
		endif

		if TurnCCW == false
			;CurrentWorker.PlayIdle(ArtilleryTurnClockwise)
			PlayAnimOrIdle(ArtilleryTurnClockwise, "TurnClockwise")
		Else
			;CurrentWorker.PlayIdle(ArtilleryTurnCounterClockwise)
			PlayAnimOrIdle(ArtilleryTurnCounterClockwise, "TurnCounterClockwise")
		endif
	else 		;If we ARE already pointing in the correct Direction
		if doNotFire == false
			noFire = false
			FireMortar()
		else
			noFire = true
		endif
	Endif
	PreviousCardinal = myHeadingCardinal
EndFunction



;This goes through the actions of firing the cannon if the 3d is loaded
Function FireMortar(bool fakeFire = false)
	debug.trace(self + " FireMortar fakeFire=" + fakeFire)

	ObjectReference objSelf = self as ObjectReference
	if Is3DLoaded()
		Float CurrentDistance = objSelf.GetDistance(CurrentTarget)
		Debug.Trace(Self + ": CurrentDistance to target = " + CurrentDistance)
		PlayAnimOrIdle(ArtilleryFire, "Fire")
		Utility.Wait(0.9)
		;self.PlaceAtMe(WorkshopArtilleryForce)
		Self.PlaceAtNode("ProjectileNode", MinArtilleryMuzzleFlash)
		;Dummy fire the fake projectile
		WorkshopArtilleryWeapon.Fire(objSelf)
	else
		WPNArtilleryMinutemenFire.Play(objSelf)
	endif
	;After we fire, place place the explosion
	if fakeFire == false
		PlaceMortarExplosion()
	endif
EndFunction

;
Function PlaceMortarExplosion()
	debug.trace(self + " PlaceMortarExplosion")
	; Wait a few seconds before falling
	utility.wait(3.5)
	;Play the whistling sound as it falls
	FXProjectileArtilleryMinutemen.Play(MinArtilleryMarker)
	ObjectReference myFiringMarker
	;If the 3d is loaded, use the short range version (for now they are the same)
	if Is3DLoaded()
		debug.trace(self + " PlaceMortarExplosion: close")
		myFiringMarker = MinArtilleryMarker.PlaceAtMe(WorkshopArtilleryStrikeProjectileShooterClose)
	Else 					;If our 3d is not loaded, place the long range arc version (same for now)
		debug.trace(self + " PlaceMortarExplosion: far")
		myFiringMarker = MinArtilleryMarker.PlaceAtMe(WorkshopArtilleryStrikeProjectileShooterFar)
	endif

	; clean up global stuff prior to sending "finished firing" event
	if TestFire
		MinArtilleryMarker.delete()
	else
		MinArtilleryMarker = none
	endif
	CurrentTarget = none
	TestFire = false

	; send event
	Var[] kargs = new Var[1]
	Kargs[0] = self
	SendCustomEvent("FinishedFiring", kArgs)
	debug.trace(self + " PlaceMortarExplosion: finished firing")
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Turning End & Turning Direction Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;This should pick which direction to turn the cannon, based on which is faster
bool Function GetTurnDirection(int P, int N)
	bool CW = False
	Bool CCW = True
	int T = ((360/angleSnap) as int)	;T = Total cardinals
		if N > P
			If  ((T - N) + P) >= (N - P)
				Return CW
			else
				Return CCW
			Endif
		else 	;N < P
			if  ((T - P) + N) <= (P - N)
				Return CW
			else
				Return CCW
			Endif
		Endif
EndFunction

;We will receive this when the artillery has faced the correct direction
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace(Self + ": Has received AnimationEvent > " + asEventName + " < from akSource >>> "+ akSource + " <<<")
	Debug.Trace(Self + ": noFire == " + noFire)
	if asEventName == CurrentTurnEvent
		UnRegisterForAnimationEvent(self, CurrentTurnEvent)
		;CurrentWorker.PlayIdle(ArtilleryStop)
		PlayAnimOrIdle(ArtilleryStop, "Stop")
		if noFire == false
			FireMortar()
		else
			noFire = true
		endif
	EndIf
EndEvent

;This will play the animation on either the actor as an idle, or on the furniture, depending on if the furiture is in use.
Function PlayAnimOrIdle(idle myIdle, string myAnim)
	Actor CurrentWorker = GetActorRefOwner()
	if isFurnitureInUse(abIgnoreReserved = true) && CurrentWorker				;If the Furniture is in use, play the idle on the actor
		CurrentWorker.PlayIdle(myIdle)
	else 								;If the Furniture is NOT in use, play the animation on the furniture
		PlayAnimation(myAnim)
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Test Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function Test(bool justAim)
	TestFire = true
	Debug.Trace(Self + ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
	;Debug.Trace(Self + ": justAim == " + justAim)
	;justAim = true
	Debug.Trace(Self + ": justAim = " + justAim)
	FireAtTarget(game.GetPlayer(), justAim)
EndFunction

float ArtillerySpreadRadius = 50.0
;Normally MinArtilleryScript will pass us the target, but if we are doing a test fire, use this
Function PlaceTargetMarker()

	MinArtilleryMarker = CurrentTarget.PlaceAtMe(XmarkerHeading)
	ObjectReference strikeOrigin = self as ObjectReference

	; put down explosion at random spot near smoke
	float xOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)
	float yOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)

	MinArtilleryMarker.MoveTo(CurrentTarget, xOffset, yOffset)
	debug.trace(self + " Firing from " + strikeOrigin + ": xOffset=" + xOffset + ", yOffset=" + yOffset)

	; rotate marker to face away from origin marker
	float headingAngle = MinArtilleryMarker.GetHeadingAngle(strikeOrigin)
	debug.trace(self + " headingAngle=" + headingAngle)
	headingAngle += MinArtilleryMarker.GetAngleZ() ;+ 180.0
	; should now be facing TOWARD from origin marker
	;debug.trace(self + " MinArtilleryMarker facing angle=" + headingAngle)
	MinArtilleryMarker.SetAngle(0.0, 0.0, headingAngle)
EndFunction
