Scriptname MS16DirtScriptTemp extends ObjectReference 

quest Property DN050 auto

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self) ; listen for one hit
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	self.disable()
EndEvent