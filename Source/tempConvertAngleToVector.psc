Scriptname tempConvertAngleToVector extends ObjectReference

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self) ; get a single hit
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)

		float eulerAngleX = getAngleX()
		float eulerAngleY = getAngleY()
		float eulerAngleZ = getAngleZ()

		debug.trace("euler angle " +eulerAngleX +", " +eulerAngleY +", "+ eulerAngleZ)

		float cosX = math.cos(eulerAngleX)
		float cosY = math.cos(eulerAngleY)
		float cosZ = math.cos(eulerAngleZ)
		float sinX = math.sin(eulerAngleX)
		float sinY = math.sin(eulerAngleY)
		float sinZ = math.sin(eulerAngleZ)


		debug.trace("cos " +cosX +", " +cosY +", "+ cosZ)
		debug.trace("sin " +sinX +", " +sinY +", "+ sinZ)


		;+z
		;float angleX = -1 * sinY
		;float angleY = sinX * cosY
		;float angleZ = cosX * cosY
		
		;-z
		float angleX = sinY
		float angleY = -sinX * cosY
		float angleZ = -cosX * cosY



		debug.trace("my launch vector is " +angleX +", " +angleY +", "+ angleZ)
		ApplyHavokImpulse(angleX, angleY, angleZ, 20000)
		
EndEvent


