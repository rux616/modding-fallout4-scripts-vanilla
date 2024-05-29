Scriptname TestLocalDamageScript extends ObjectReference

Event OnLoad()
	if Is3dLoaded()
    	RegisterForHitEvent(self)
    endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	RegisterForHitEvent(self)

	if asMaterialName== "Metal"
		debug.Trace(self + "I got hit in the metal")
	else
		debug.Trace(self + "I got hit in the non-metal")
	endif
EndEvent