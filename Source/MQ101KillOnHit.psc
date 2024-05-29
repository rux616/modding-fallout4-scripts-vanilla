Scriptname MQ101KillOnHit extends ReferenceAlias Const

Event OnAliasInit()
	RegisterForHitEvent(Self.GetActorRef())
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	Self.GetActorRef().Kill()
EndEvent