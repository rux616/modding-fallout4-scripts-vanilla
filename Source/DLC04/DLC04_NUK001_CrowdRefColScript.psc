Scriptname DLC04:DLC04_NUK001_CrowdRefColScript extends RefCollectionAlias

ActorValue property DLC04_NUK001_CrowdDisrupted Auto Const Mandatory

Function RegisterForDisruption()
	int i = 0
	While (i < Self.GetCount())
		Actor current = Self.GetAt(i) as Actor
		if (current != None)
			Self.RegisterForHitEvent(current)
		EndIf
		i = i + 1
	EndWhile
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	akTarget.SetValue(DLC04_NUK001_CrowdDisrupted, 1)
EndEvent