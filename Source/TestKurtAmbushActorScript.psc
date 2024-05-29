Scriptname TestKurtAmbushActorScript extends Actor Const
{script for ambushing actors}

Keyword Property LinkAmbushTrigger Auto Const
;/
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    ; for now, always exit ambush
    if (GetLinkedRef(LinkAmbushTrigger) as TestKurtAmbushTriggerScript) && GetActorValue("Variable01") < 2
    	(GetLinkedRef(LinkAmbushTrigger) as TestKurtAmbushTriggerScript).Triggered = 2
    	; for now, we need to set actor value (until we get Ambush procedure)
    	SetActorValue("Variable01", 2)	; I'm now allowed to break out of "ambush behavior"
    	EvaluatePackage()
    endif
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if GetActorValue("Variable01") == 0
    if (GetLinkedRef(LinkAmbushTrigger) as TestKurtAmbushTriggerScript) && GetActorValue("Variable01") < 1
    	(GetLinkedRef(LinkAmbushTrigger) as TestKurtAmbushTriggerScript).Triggered = 1
    endif
   	SetActorValue("Variable01", 1)	; fake "suspicious" value
	endif		
EndEvent
/;