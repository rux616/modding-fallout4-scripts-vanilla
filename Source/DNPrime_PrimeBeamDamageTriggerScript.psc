Scriptname DNPrime_PrimeBeamDamageTriggerScript extends ObjectReference
{Damage actors who enter the trigger}

ActorValue property Health auto mandatory const
Int property PlayerDamage = 50 auto const
{amount of damage per second the player takes when stepping into the beam}
IMPACTDATASET property SplatterImpactData AUTO const
INT property decalCount = 5 AUTO
FLOAT property DelayRandMin = 0.05 AUTO const
FLOAT property DelayRandMax = 0.2 AUTO const

FLOAT property ShaderDuration = 0.00 auto const
{Duration of Effect Shader.}

ACTIVATOR property AshPileObject auto const
{The object we use as a pile.}

EFFECTSHADER property MagicEffectShader auto const
{The Effect Shader we want.}

BOOL property bSetAlphaZero = True auto const
{When done, set the Actor Alpha to zero.}

Sound property mySound auto mandatory const

Actor Player
Int myTimerID = 0
Int myTimer = 1
Bool PlayerInTrigger = FALSE

ACTOR victim
BOOL timerRunning = FALSE

;************************************
Event OnLoad()
    Player = Game.GetPlayer()
EndEvent

;************************************

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Player)
		PlayerInTrigger = TRUE
		mySound.play(Player)
		Player.DamageValue(Health, PlayerDamage)
		StartTimer(myTimer, myTimerID)
	else
		;someone else is in trigger
		victim = akActivator as Actor
		;debug.trace("damaging actor")
		if victim.IsEssential() == FALSE
			victim.DamageValue(Health, 1000)
			victim.SetCriticalStage(victim.CritStage_DisintegrateStart)
			
			if	MagicEffectShader != none
				MagicEffectShader.play(victim, ShaderDuration)
			endif
			
			utility.wait(1)

			;victim.AttachAshPile(AshPileObject)

			victim.PlayImpactEffect(SplatterImpactData, "SprayHelperNode", Utility.RandomFloat(-0.8, 0.8), Utility.RandomFloat(-0.75, 0.75), -1.0, 320, false, true)
		    if decalCount > 0 
		    	decalCount -= 1
		   		StartTimer(Utility.RandomFloat(DelayRandMin, DelayRandMax) , 1)
		   	endif

			utility.wait(1.25)

			if	MagicEffectShader != none
				MagicEffectShader.stop(victim)
			endif

			if bSetAlphaZero == True
				victim.SetAlpha (0.0,True)
			endif

			victim.SetCriticalStage(victim.CritStage_DisintegrateEnd)

		endif
	endif
EndEvent

;************************************

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Player)
		CancelTimer()
		PlayerInTrigger = FALSE
	endif
EndEvent

;************************************

Event OnTimer(int aiTimerID)
    if (aiTimerID == myTimerID)
    	if(PlayerInTrigger == TRUE)
    		;player is in trigger, damage health and restart timer
    		mySound.play(Player)
			Player.DamageValue(Health, PlayerDamage)
			StartTimer(myTimer, myTimerID)
    	else
    		;player is not in trigger anymore
    	endif
	endif
EndEvent

;************************************



;/EVENT OnEffectStart(Actor Target, Actor Caster)
	victim = target

ENDEVENT

Event OnDying(Actor Killer)

	

EndEvent
/;