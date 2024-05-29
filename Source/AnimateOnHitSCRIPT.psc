Scriptname AnimateOnHitSCRIPT extends ObjectReference Const
{Stays registered for hit and animates each time.}

string Property eventName = "CharFXBurstA" Auto const
{Bone from which to send pick}

Event OnLoad()
	    if Is3DLoaded()
	    	RegisterForHitEvent(self) ; listen for a single event
	    EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    playAnimation(eventName)
    RegisterForHitEvent(self)
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent