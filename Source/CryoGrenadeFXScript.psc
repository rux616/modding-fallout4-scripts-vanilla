Scriptname CryoGrenadeFXScript extends ObjectReference
{Jets the cryo grenade around the room}

Int Property flyForceApplied = 7 Auto
{# of times to apply the force}
;explosion Property OxygenTankExplosion Auto 
;{my explosion art that plays at end of jet boost.}

Float Property rndAngleRange = 45.0 Auto
{Random range for force applied during boost. 0 = fly straight.}

;force applied when jet boosting
Float flyForce = 600.0
;number of times force has been applied
int i = 0


	Event OnLoad()
		startTimer(6, 1)
		while i <= 3
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

		
	EndEvent

	Event OnTimer(int aiTimerID)
		if aiTimerID == 1
			self.delete()
		endif
	EndEvent
