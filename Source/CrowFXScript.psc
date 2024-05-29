Scriptname CrowFXScript extends ObjectReference
{flee little crow}

float myX
float myY
float myZ

float myXr
float myYr
float myZr

float newPosX = 0.0
float newPosY = 0.0
float newPosZ = 0.0

float NewRotX = 0.0
float NewRotY = 0.0
float NewRotZ = 0.0

int Pos1Dist = 500
int Pos1Height = 250
float Pos1Xrot = -45.0

int Pos2Dist = 2000
int Pos2Height = 1200
float Pos2Xrot = 20.0

float sinZ  ;x movement
float cosZ  ;y movement
	
float myScale 

int RandomSpacing


Event OnLoad()
	;Set my global random for speed and distance
	 RandomSpacing = Utility.RandomInt(-50, 50)
	 ;set up values for first tranlate to pont
	NewTranslationPoint(Pos1Dist, Pos1Height, Pos1Xrot)
	;set random scale
	SetScale(Utility.RandomFloat(0.8, 1.2))
	;store my scale
	myScale = GetScale()
	GotoState("Waiting")
	RegisterForHitEvent(self) ; get one hit event, any source
EndEvent

Event onUnload()
	UnregisterForAllHitEvents()
endEvent

;state for waiting to be triggered. Any event in her triggers takeoff
state Waiting 
	Event OnTriggerEnter(ObjectReference akActionRef)
		GotoState("takeoff")
	EndEvent
	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	    GotoState("takeoff")
	EndEvent
endState

;once triggered fly to first point
state takeoff
	Event OnBeginState(string asOldState)
		;flap wings
		playAnimation("Takeoff")
		utility.wait(0.1)
		;go to point
		SplineTranslateTo((myX + newPosX), (myY + newPosY), (myZ + newPosZ), (myXr + NewRotX), (myYr + NewRotY), (myZr + NewRotZ), 1000.0, (300.0+RandomSpacing))
		utility.wait(0.5)
		;slow down winflap speed over time(dampened in graph).
		SetAnimationVariableFloat("fDampRate", 0.008)
		SetAnimationVariableFloat("fFlapSpeed", 1.0)
	EndEvent
	;before we stop moving go to next point
	Event OnTranslationAlmostComplete()
  		GotoState("newPos2")
	EndEvent
endState

;once triggered fly to second point
state newPos2
	Event OnBeginState(string asOldState)
		;Set my global random for speed and distance
		NewTranslationPoint(Pos2Dist, Pos2Height, Pos1Xrot)
		;go to point
		SplineTranslateTo((myX + newPosX), (myY + newPosY), (myZ + newPosZ), (myXr + NewRotX), (myYr + NewRotY), (myZr + NewRotZ), 1000.0, (320.0+RandomSpacing))
		;speed up then slow down flapping for variety
		FlapSpeedBump(0.5)
		utility.wait(5.0)
		;scale down over time
		while myScale > 0.2
			myScale = myScale -0.01
			SetScale(myScale)
		endwhile
	EndEvent
	;before we stop moving go to hide mode
	Event OnTranslationAlmostComplete()
	 GotoState("hide")
	EndEvent
endState

;hide bird
state hide
	Event OnBeginState(string asOldState)
		disable()
	EndEvent
endState


;speed up then slow down flapping for variety
function FlapSpeedBump(float akBumpTime)
	SetAnimationVariableFloat("fDampRate", 0.1)
	SetAnimationVariableFloat("fFlapSpeed", 1.75)
	utility.wait(akBumpTime)
	SetAnimationVariableFloat("fDampRate", 0.1)
	SetAnimationVariableFloat("fFlapSpeed", 1.0)
endFunction

;Sets all of the values for the next poit of translation randomising certain things
function NewTranslationPoint(int akDistance, int akHeight, float akXrot)
    ;get my current transform
     myX = GetPositionX()
	 myY = GetPositionY()
	 myZ = GetPositionZ()

	 myXr = GetAngleX()
	 myYr = GetAngleY()
	 myZr = GetAngleZ()
	 ;randomize my next zRot a bit
	 myZr = myZr + Utility.RandomFloat(-25.0, 25.0)

	 ;use math to figure out a poit to go in my heading ditection
	 cosZ = math.cos(myZr)
	 sinZ = math.sin(myZr)
	 ;randomise distances
	 akDistance = akDistance + RandomSpacing
	 akHeight = akHeight + RandomSpacing
	 ;randomize angles
	 newPosX = sinZ*akDistance
	 newPosY = cosZ*akDistance
	 newPosZ = 1.0*akHeight
	 NewRotX = Utility.RandomFloat(-15.0, 45.0)
	 NewRotY = Utility.RandomFloat(-25.0, 25.0)
endFunction
