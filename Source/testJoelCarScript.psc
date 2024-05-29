Scriptname testJoelCarScript extends ObjectReference Const
{Trying to test whether an object that ignores external damage still catches onHit}

EVENT onHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
endEVENT