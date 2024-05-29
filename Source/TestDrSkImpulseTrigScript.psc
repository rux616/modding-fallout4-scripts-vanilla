Scriptname TestDrSkImpulseTrigScript extends ObjectReference

MiscObject Property Baseball auto
float property Impulse = 500.0 auto


Event OnTriggerEnter(objectReference akTrigger)
	Debug.Trace(Self + ": Recieved onTriggerEnter Event")
	if akTrigger.GetBaseObject() == Baseball
		Debug.Trace(Self + ": Object is a Baseball")
		;ApplyHavokImpulse(float afX, float afY, float afZ, float afMagnitude)
		objectReference impulseOrigin = getLinkedRef()
		float compX
		float compY
		float compHypotenuse
		;compX = akTrigger.getPositionX() - impulseOrigin.getPositionX()
		;compY = akTrigger.getPositionY() - impulseOrigin.getPositionY()

		compX = self.getPositionX() - impulseOrigin.getPositionX()
		compY = self.getPositionY() - impulseOrigin.getPositionY()
		compHypotenuse = math.sqrt((compX * compX) + (compY * compY))
		debug.Trace (self + ": compX = " + compX)
		debug.Trace (self + ": compY = " + compY)
		debug.Trace (self + ": compHypotenuse = " + compHypotenuse)
		compX = (compX/compHypotenuse)
		compY = (compY/compHypotenuse)
		debug.Trace (self + ": ~~~~~~~~~~~ New Values ~~~~~~~~~~~~")
		debug.Trace (self + ": compX = " + compX)
		debug.Trace (self + ": compY = " + compY)
		akTrigger.ApplyHavokImpulse(compX, compY, 0, Impulse)
	endif
EndEvent




;/
Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, \
    float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	Debug.Trace(Self + ": TRAP HIT START")

EndEvent
/;