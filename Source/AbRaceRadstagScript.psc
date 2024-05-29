Scriptname AbRaceRadstagScript extends ActiveMagicEffect 

ActorValue Property Health Auto Const
actorValue property Confidence auto const
float property fAttackBelowHPpercent auto Const
{When falling below this HP threshold, switch confidence and attack the aggressor}

int property defaultConfidence auto hidden


Event OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace("RADSTAG: OnEffectStart")
    defaultConfidence =  akCaster.getValue(confidence) as int
    debug.trace("RADSTAG: Racial abilities initialized.")
EndEvent



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	actor myself = self.GetTargetActor()
	debug.trace("RADSTAG: I'm Hit!  Check HP threshold ("+mySelf.getValuePercentage(health)+"/"+fAttackBelowHPpercent+".  Time to hulk out.")
	if mySelf.getValue(confidence) == defaultConfidence ; if my confidence has already changed, don't bother.
		if mySelf.getValuePercentage(health) <= fAttackBelowHPpercent
			mySelf.setValue(confidence, 2) ; go aggressive
			(mySelf).startCombat(akAggressor as actor) ; and go get that jerk
		endif
	endif
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	actor myself = self.GetTargetActor()
	if aeCombatState == 0
	    ; when combat ends, assume default aggression
	    debug.trace("RADSTAG: Combat ended, make sure I have my default confidence")
	    mySelf.setvalue(confidence, defaultConfidence)
    else
    	; when combat begins (or begin searching) save our current confidence.
    	; NOTE - this feels unreliable, but having trouble witht he onMagicEffectApply, so trying it as an alternative 
    	;defaultConfidence =  mySelf.getValue(confidence) as int
    	;debug.trace("RADSTAG: Combat? Set my default confidence: "+defaultConfidence)
    endif
EndEvent