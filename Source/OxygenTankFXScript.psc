Scriptname OxygenTankFXScript extends ObjectReference
{Handles local damage that sends tanks into rocket mode.}

Int Property flyForceApplied = 7 Auto
{# of times to apply the force}
;explosion Property OxygenTankExplosion Auto 
;{my explosion art that plays at end of jet boost.}
int Property myDamage = 200 Auto
{how much to damage linked ref at end of jet boost}
Float Property rndAngleRange = 25.0 Auto
{Random range for force applied during boost. 0 = fly straight.}

;force applied when jet boosting
Float flyForce = 12000.0
;number of times force has been applied
int i
;my linked ref for the script to act on
ObjectReference linkedRef



Event OnInit()
	;grab my linked ref
	linkedRef = self.GetLinkedRef()
EndEvent

EVENT OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	GotoState("rocketMode")
EndEvent

state rocketMode
	Event OnBeginState(string asOldState)
		;change look of art to show jet boosting
		linkedRef.playAnimation("stage2")
		self.disable()
		while i <= flyForceApplied
			float eulerAngleX = linkedRef.getAngleX()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)
			float eulerAngleY = linkedRef.getAngleY()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)
			;float eulerAngleZ = linkedRef.getAngleZ()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)

			float cosX = math.cos(eulerAngleX)
			float cosY = math.cos(eulerAngleY)
			;float cosZ = math.cos(eulerAngleZ)
			float sinX = math.sin(eulerAngleX)
			float sinY = math.sin(eulerAngleY)
			;float sinZ = math.sin(eulerAngleZ)

			float angleX = sinY
			float angleY = -sinX * cosY
			float angleZ = -cosX * cosY

			linkedRef.ApplyHavokImpulse(angleX, angleY, angleZ, (flyForce))
			utility.wait(Utility.RandomFloat(0.15, 0.25))
			i = i+1
		endWhile
		linkedRef.DamageObject(myDamage)
		utility.wait(0.25)
		self.delete()
	EndEvent

endState

