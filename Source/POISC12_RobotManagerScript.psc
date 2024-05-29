ScriptName POISC12_RobotManagerScript extends Actor Hidden Const

Faction property PlayerFaction Auto Const

Event OnInit()
	Self.RegisterForHitEvent(PlayerFaction)
EndEvent

Event OnActivate(ObjectReference akActivator)
	Self.SetUnconscious(False)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Self.SetUnconscious(False)
EndEvent