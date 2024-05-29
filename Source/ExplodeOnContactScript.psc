Scriptname ExplodeOnContactScript extends ActiveMagicEffect Const
{ExplodesTorsoOnContact
}

;;ACTOR victim
;race Property LibertyPrimeRace Auto Const
Bool Property dismemberActor = true Auto Const

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
    
   ; victim = akTarget
  ;  if  victim.GetRace() != LibertyPrimeRace
		debug.trace(akTarget +  "got splatedddddd")
		if dismemberActor == true
			akTarget.Dismember( "Torso", true, true, true)
		endif
		akTarget.Kill()
;	endIf
ENDEVENT

