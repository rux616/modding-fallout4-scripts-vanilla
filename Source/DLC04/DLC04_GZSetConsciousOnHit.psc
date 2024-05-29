Scriptname DLC04:DLC04_GZSetConsciousOnHit Extends ObjectReference

Auto State Waiting
	Event OnLoad()
		RegisterForHitEvent(self)
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		Actor selfAct = (Self as ObjectReference) as Actor
		if (selfAct.IsUnconscious())
			selfAct.SetUnconscious(False)
		EndIf
	EndEvent
EndState

State Done
	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		;Do nothing.
	EndEvent
EndState