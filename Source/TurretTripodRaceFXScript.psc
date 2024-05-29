Scriptname TurretTripodRaceFXScript extends ActiveMagicEffect
{Adds fx via race spell}

ActorValue Property MotorAV Auto Const
ActorValue Property LegsCondition Auto Const
Explosion Property TurretStandingExplosion Auto Const
bool legsCrippled = false
Bool Property bStartInactive = false Auto Const
Bool Property bOverheating = false auto


objectReference Property myWiring Auto Const

actor selfRef

;ActorBase Property EncTurretStandingCart Auto 
Keyword Property TurretNoTurnsCart Auto Const
Keyword Property TurretTripodMounted Auto Const

Activator Property pTurretTripodAshpile Auto Const Mandatory
Activator Property pTurretTripodAshpileCart Auto Const Mandatory
Activator Property pTurretTripodAshpileMounted Auto Const Mandatory



Event OnEffectStart(Actor akTarget, Actor akCaster) 
  	selfRef = akCaster
    ;restrict turning ability for cart turret
  	if selfRef.HasKeyword(TurretNoTurnsCart)
  		selfRef.SetAnimationVariableFloat("AimHeadingMaxCW", 0.0)
  		selfRef.SetAnimationVariableFloat("AimHeadingMaxCCW", 0.0)
      selfRef.SetAnimationVariableFloat("AimPitchMaxUp", 20.0)
  	endif
    if bStartInactive 
        selfRef.setUnconscious(true)
    endif
EndEvent

; fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnCripple(ActorValue akActorValue, bool abCrippled)
  debug.trace(self + " OnCripple akActorValue=" + akActorValue + " abCrippled=" + abCrippled)
	if abCrippled
		;Motors
		if akActorValue == MotorAV 
    		selfRef.SetAnimationVariableFloat("fAimOnGain", 0.03)
		endif
		;Legs
		; if akActorValue == LegsCondition 
		; 	legsCrippled = true
		; 	selfRef.damageobject(2000);kill
		; endif
	endif
EndEvent
; end fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnDying(Actor akKiller)
    debug.trace(self + "OnDying")
    
    if selfRef.HasKeyword(TurretNoTurnsCart)
      selfRef.AttachAshPile(pTurretTripodAshpileCart)
    elseif selfRef.HasKeyword(TurretTripodMounted)
      selfRef.AttachAshPile(pTurretTripodAshpileMounted)
    else
      selfRef.AttachAshPile(pTurretTripodAshpile)
    endif
    HandleDeath()
EndEvent

Event OnEnterBleedout()
    debug.trace(self + "OnEnterBleedout")
    HandleDeath()
EndEvent

function HandleDeath()
    debug.trace(self + "HandleDeath")
    if legsCrippled == false && selfRef.IsDestroyed() == false
        selfRef.placeAtMe(TurretStandingExplosion)
    endif
    if myWiring
        myWiring.DamageObject(200.0)
    endif
endFunction

; ; PROTOTYPE of sabotage via terminal functionality -------------------------------------
;; NOTE - THIS STUFF HAS MOVED TO TO MAGIC EFFECT SCRIPT - hackerTurretSabotageScript
; Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;     debug.trace("Turret: Received anim event: "+asEventName)

;     if asEventName == "WeaponFire" && !bOverheating
;         bOverheating = TRUE
;         unregisterForAnimationEvent(akSource, "WeaponFire")
;         ; right now we're making an assumption that ONLY a sabotage/override can register tihs event.
;         ; if we keep this functionality, add keyword or a value to flag that this turret has been sabotaged.
;         objectReference sparks = selfRef.placeatme(SparksUpwards)
;         NPCRobotTurretSabotageShutdown.play(selfRef)
;         selfRef.kill()
;         sparks.disable()
;     else
;         registerForAnimationEvent()
;     endif
; EndEvent


