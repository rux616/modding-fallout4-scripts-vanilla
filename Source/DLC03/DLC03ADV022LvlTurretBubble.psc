Scriptname DLC03:DLC03ADV022LvlTurretBubble extends Actor Hidden

Event OnLoad()
	if !IsDead()
		StopCombat()
		SetUnconscious(true)
	    RegisterForHitEvent(self)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if IsUnconscious()
    	SetUnconscious(false)
    endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    if IsUnconscious()
    	GetLinkedRef().Activate(self)
    endif
EndEvent