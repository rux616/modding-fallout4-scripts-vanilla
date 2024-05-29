Scriptname DN083_FirstDeathClawDeathScript extends ReferenceAlias

;Actor Property DN083_BarneyRook Auto 
ReferenceAlias Property Barney Auto Const

;Actor FirstDeathClaw = Self.getReference() as Actor

Event onAliasInit()
	registerforhitevent(self,Barney)
endEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    Actor FirstDeathClaw = Self.getReference() as Actor
    Actor BarneyActor = Barney.GetActorReference() as Actor
    Debug.Trace("DeathClaw hit by " + akAggressor)
    if (akAggressor == BarneyActor)
    	Debug.Trace("Now DeathClaw Dies")
    	FirstDeathClaw.Kill(BarneyActor)
    endif
EndEvent

