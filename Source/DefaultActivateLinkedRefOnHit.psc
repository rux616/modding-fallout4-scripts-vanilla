Scriptname DefaultActivateLinkedRefOnHit extends ObjectReference default

Keyword Property MyLink Auto Const

auto STATE WaitingForHit
	Event OnLoad()
	    RegisterForHitEvent(self)
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	    GoToState("Done")
	    GetLinkedRef(MyLink).Activate(self)
	EndEvent
EndSTATE

STATE Done

EndSTATE