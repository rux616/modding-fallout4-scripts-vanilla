Scriptname SandbagDestructionScript extends ObjectReference const
{Handles the control and fx for destructable sandbag objects}

import debug

race property deathclawRace auto const
keyword property CanBeThrown auto const

EVENT onInit()
	; when we start up, add the deathclaw flip keyword unless already destroyed
	if GetCurrentDestructionStage() > 2
		addKeyword(CanBeThrown)
	endif
endEVENT

EVENT OnLoad()
    if Is3DLoaded()
        RegisterForHitEvent(self) ; get a hit
    endif
endEVENT

EVENT OnUnload()
    UnregisterForAllHitEvents()
endEVENT

EVENT OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)

	trace("Sandbag: Received onHit by "+akAggressor+" with "+akSource)

	if (akAggressor)
    	if (akAggressor as actor).getRace() == deathclawRace
    		; if a deathclaw hit me, go boom!
    		trace("Sandbag: Passed race check")
    		damageobject(5000)
    	endif
    endif

    if (akSource is Explosion)
    	trace("Sandbag: passed explosion check")
    	damageobject(5000)
    endif

    RegisterForHitEvent(self) ; get another hit

EndEvent

EVENT OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if aiCurrentStage == 2
		removeKeyword(CanBeThrown)
	endif
;   Debug.Trace("Out destruction stage changed from " + aiOldStage + " to " + aiCurrentStage)
endEVENT