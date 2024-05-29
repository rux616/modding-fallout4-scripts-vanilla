Scriptname DN058RaiderDieOnHit extends ObjectReference Hidden Const

ObjectReference Property RaiderThatCanKillMe const auto

Event OnLoad()
    RegisterForHitEvent(self, RaiderThatCanKillMe)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	ObjectReference MySelf = self
    (MySelf as Actor).Kill()
EndEvent