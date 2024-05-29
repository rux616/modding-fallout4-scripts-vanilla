Scriptname MirelurkKingBlurStartScript extends Actor Const

Race Property MirelurkKingRace Auto Const

Spell Property abMirelurkKingCloakSpell Auto Const

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    debug.trace("CombatState changed to " + aeCombatState)
    if (Self.GetRace() == MirelurkKingRace)
    	if (aeCombatState == 1 || aeCombatState == 2)
    		abMirelurkKingCloakSpell.Cast(Self)
    		Debug.trace("Cast on " + self)
    	endif
    endif
EndEvent

