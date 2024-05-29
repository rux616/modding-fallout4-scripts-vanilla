Scriptname MQ203MemoryESynthScript extends ReferenceAlias Const
{kills on hit by Kellogg
temp - this should eventually be handled in animation}

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace(self + " OnHit")
    GetActorRef().Kill()
    RegisterForHit()
EndEvent

Event OnAliasInit()
	debug.trace(self + " OnAliasInit")
	RegisterForHit()
EndEvent

function RegisterForHit()
	RegisterForHitEvent(self, (GetOwningQuest() as MQ203Script).MQ203NPCFaction)
endfunction
