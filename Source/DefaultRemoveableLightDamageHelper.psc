Scriptname DefaultRemoveableLightDamageHelper extends ObjectReference Const
{Linked ref to light fixtures with breakable bulbs

SEE ALSO: DefaultRemoveableLight script
}

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self) ; listen for a single hit
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	
	debug.trace(self + "OnHit() akAggressor:" + akAggressor)
	debug.trace(self + "OnHit() akSource:" + akSource)
	debug.trace(self + "OnHit() akProjectile:" + akProjectile)

	debug.trace(self + "OnHit() calling BeingDamaged() on" )
	(GetLinkedRef() as DefaultRemoveableLight).BeingDamaged()
EndEvent
