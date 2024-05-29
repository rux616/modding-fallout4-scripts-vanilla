Scriptname DLC03:DLC03VRRelayScript extends ObjectReference Hidden

Weapon Property LightBeam Auto

Bool Property Powered Auto

Event OnLoad()
	RegisterForHitEvent(self)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	RegisterForHitEvent(self)
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	RegisterForHitEvent(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + " OnHit by " + akSource)

	LightBeam.Fire(self)

	RegisterForHitEvent(self)
EndEvent
