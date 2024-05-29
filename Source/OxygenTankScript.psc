Scriptname OxygenTankScript extends ObjectReference 

;Explosions for special handing
Explosion Property ExplosionTrapOil Auto
Explosion Property ExplosionTrapGas Auto
Sound Property FlyingLoopSound Auto

Int  flyForceApplied = 7 const
;{# of times to apply the force}
;explosion Property OxygenTankExplosion Auto 
;{my explosion art that plays at end of jet boost.}
int  myDamage = 200 const
;{how much to damage linked ref at end of jet boost}
int  myWeakspotDamage = 1000 const
;{How much damage to do to linked ref}
Float  rndAngleRange = 25.0 const
;{Random range for force applied during boost. 0 = fly straight.}

;force applied when jet boosting
Float flyForce = 12000.0 const
;number of times force has be`en applied
int i
int FlyingLoopSoundID


Event OnLoad()
	if Is3dLoaded()
    	RegisterForHitEvent(self)
    endIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if apMaterial == "MetalHollow"
		debug.trace("WeakSpot")
		self.DamageObject(myWeakspotDamage)
	elseif apMaterial == "MetalSolid"
		debug.trace("Nozzle")
		GotoState("rocketMode")
	elseif (akSource == ExplosionTrapOil || akSource == ExplosionTrapGas)
		debug.trace("ExplosionTrapOil or ExplosionTrapGas")
		GotoState("rocketMode")
	else
   	 RegisterForHitEvent(self)
   	endif
EndEvent


state rocketMode
	Event OnBeginState(string asOldState)
		;change look of art to show jet boosting
		self.playAnimation("stage2")
		FlyingLoopSoundID = FlyingLoopSound.play(self)
		while i <= flyForceApplied
			float eulerAngleX = self.getAngleX()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)
			float eulerAngleY = self.getAngleY()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)
			;float eulerAngleZ = self.getAngleZ()+Utility.RandomFloat(-1*rndAngleRange, rndAngleRange)

			float cosX = math.cos(eulerAngleX)
			float cosY = math.cos(eulerAngleY)
			;float cosZ = math.cos(eulerAngleZ)
			float sinX = math.sin(eulerAngleX)
			float sinY = math.sin(eulerAngleY)
			;float sinZ = math.sin(eulerAngleZ)

			float angleX = sinY
			float angleY = -sinX * cosY
			float angleZ = -cosX * cosY

			self.ApplyHavokImpulse(angleX, angleY, angleZ, (flyForce))
			utility.wait(Utility.RandomFloat(0.15, 0.25))
			i = i+1
		endWhile
		self.DamageObject(myDamage)
		Sound.StopInstance (FlyingLoopSoundID)
		utility.wait(0.25)
		self.delete()
	EndEvent

endState

