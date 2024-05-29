Scriptname DN001_OnHitSetStage extends ObjectReference Const

Quest Property DN001BADTFL Auto Const

int Property Stage Auto Const

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    if akTarget == Self
    	DN001BADTFL.SetStage(Stage)
    endif
EndEvent
