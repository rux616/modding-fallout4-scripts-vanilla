Scriptname MirelurkKingBlurTimer extends ActiveMagicEffect


Float Property DurationTime Auto Const
Float Property ResetTime auto const

;Spell Property crMirelurkKingBlurCloak Auto Const

;Float Property MKSAAValue Auto Const

ActorValue Property MirelurkKingCanCloak Auto Const

Actor MKcaster 
Float ActualDT
Float ActualRT
int DurationTimerID = 0 const
int ResetTimerID = 10 const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace(Self + "AKA The Timer has started on " + self.GetCasterActor())
	MKcaster = self.GetCasterActor() as actor
	ActualDT =  utility.RandomFloat((DurationTime-0.5), (DurationTime + 0.5))
	ActualRT =  utility.RandomFloat((ResetTime-0.5), (ResetTime + 0.5))
	debug.trace("ActualDT = " + ActualDT)
	Debug.trace("ActualRT = " + ActualRT)
	StartTimer(ActualDT, DurationTimerID)
	debug.trace("Duration Timer has been set")
	debug.trace ("The caster is " + MKcaster)
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace("Timer ID = "+ aiTimerID)
	if (CheckDead() == FALSE)
		debug.trace("Checkdead == " + Checkdead())
		if (aiTimerID == DurationTimerID)
		
			Debug.trace("DurationTimerID has expired")
		    MKCaster.SetValue(MirelurkKingCanCloak, 0.0)
		    MKCaster.SetAlpha(1.00, True)
		    StartTimer(ActualRT, ResetTimerID)
		
		endif
		if (aiTimerID == ResetTimerID)
			
			debug.trace("ResetTimerID has expired")
			if (MKcaster.IsInCombat() == TRUE)
				Debug.trace(MKcaster + " is in combat")
				Debug.trace("Current combat state is " + MKcaster.GetCombatState())
				MKCaster.SetValue(MirelurkKingCanCloak, 1.0)
				StartTimer(ActualDT, DurationTimerID)
				debug.trace("Duration Timer has been set")

			endif

		endif
		
	endif

EndEvent

bool function CheckDead()
	
	if (MKcaster.isDead() == TRUE)
		Debug.trace(self + " is dead")
		CancelTimer(ResetTimerID)
		CancelTimer(DurationTimerID)
		MKCaster.SetValue(MirelurkKingCanCloak, 0.0)
		MKCaster.SetAlpha(1.00, True)
		return TRUE
	else
		return FALSE
	endif

endFunction