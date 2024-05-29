Scriptname MirelurkKingBlurScript extends ActiveMagicEffect

;Float Property DurationTime Auto Const
;float Property ResetTime auto const

;Spell Property crMirelurkKingBlurCloak Auto Const

Float Property MKSAAValue Auto Const

ActorValue Property MirelurkKingCanCloak Auto Const

Actor MKcaster
;int DurationTimerID = 0 const
;int ResetTimerID = 10 const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace(Self + " AKA The Cloak has started on " +self.GetCasterActor())
	MKcaster = self.GetCasterActor() as actor
	MKcaster.SetAlpha(MKSAAValue, True)
	;StartTimer(DurationTime, DurationTimerID)
	debug.trace ("The caster is " + MKcaster)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Debug.trace(self + " AKA The Cloak has ended on " + mkcaster)
    mkcaster.SetAlpha(1.00, TRUE)
EndEvent



;/
Event OnTimer(int aiTimerID)
	if (CheckDead() == FALSE)
		
		if (aiTimerID == DurationTimerID)
		
			Debug.trace("DurationTimerID has expired")
		    MKCaster.SetValue(MirelurkKingCanCloak, 0.0)
		    MKCaster.SetAlpha(1.00, True)
		    StartTimer(ResetTime, ResetTimerID)
		
		endif
		if (aiTimerID == ResetTimerID)
			
			debug.trace("ResetTimerID has expired")
			debug.trace ("The caster is STILL " + MKcaster)
			if (MKcaster.IsInCombat() == TRUE)
				Debug.trace(MKcaster + " is in combat")
				Debug.trace("Current combat state is " + MKcaster.GetCombatState())
				    MKCaster.SetValue(MirelurkKingCanCloak, 1.0)
				Debug.trace("Recast on " + MKCaster)
			endif

		endif
		
	endif

EndEvent

bool function CheckDead()
	
	if (MKcaster.isDead() == TRUE)

		CancelTimer(ResetTimerID)
		CancelTimer(DurationTimerID)
		MKCaster.SetValue(MirelurkKingCanCloak, 0.0)
		MKCaster.SetAlpha(1.00, True)
		return TRUE
	else
		return FALSE
	endif

endFunction
/;



