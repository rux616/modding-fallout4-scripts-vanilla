Scriptname AssaultronHeadModStealthScript extends ActiveMagicEffect
{Brings the laser and stealth functionality with the assaultron head mod. Laser charges over time and then she gets the ammo so she can shoot it. The more limbs are crippled the faster the face laser recharges.}

Group stealth_Properties
    SPELL PROPERTY stealthSpell AUTO
    MAGICEFFECT PROPERTY stealthEffect AUTO
    ActorValue  property endurancecondition Auto const
endgroup

Group faceLaser_Properties
	Ammo Property AmmoAssaultron Auto Const
    {Ammo used by face laser}
	ActorValue Property headlaserAV Auto Const
	{actor value for the head with the laser}
    sound Property laserChargeSound Auto Const
    {Charge up sound}
    sound Property laserReadySound Auto Const
    {Ready sound}
    sound Property LaserFireSound Auto Const
    {Laser Fire sound}
    sound Property LaserTailSound Auto Const
    {Laser tail sound. Plays after fire sound}
    ImageSpaceModifier Property laserImod Auto Const
    {Image space for firing}
    VisualEffect Property pAssaultronHeadChargeV Auto Const
    {visual fx}
    Weapon Property pAssaultronLaser Auto Const
    {Head laser}
    int property laserState auto conditional 
    
    SPELL Property PcrThermalCoreCloak Auto Const
    {Radiation cloak spell to use while firing}

    ;contidions the shorten laser cooldown when crippled
ActorValue Property LeftAttackCondition Auto Const
ActorValue Property RightAttackCondition Auto Const
ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const
endgroup

;local vars for face laser timer
int faceLaserTimerID = 1
int faceLaserPauseTimerID = 2
int faceLaserReadyTimerID = 3
int laserChargeTime = 15
int laserCoolTimeMin = 8
int laserCoolTimeMax = 10
int laserCoolTimeLimbCrippleReduction = 4
;ids to store sound slocally
int laserChargeSoundID
int laserReadySoundID
int LaserFireSoundID
int LaserTailSoundID
;local storage for head av amount
int lastHeadAV = 100
int currentHeadAV
;stop from firing twice and used to reset laser fx when done firing
bool wepFireDoOnce = false
; gate bool to stop laser sequence if head is crippled
bool isHeadLaserCrippled = false

;Only reduce cooldown 2x
int reduceCoolTwice 
;cloak crip bool
bool isCloakCrippled = false


Auto State alive 
Event OnEffectStart(Actor akTarget, Actor akCaster)

       ; register for events to use in stopping and starting additional laser fx
        RegisterForAnimationEvent(akCaster, "headFireStart")
        RegisterForAnimationEvent(akCaster, "headFireEnd")
        ;events for staleth control
        RegisterForAnimationEvent(akCaster, "weaponSwing")
        RegisterForAnimationEvent(akCaster, "weaponSheath")
        ;attach art for head laser
    ; while akCaster.Is3dLoaded() == false
    ;     debug.trace("Ass head waiting for 3d")
    ;     utility.wait(0.05)
    ; endWhile
        ;Attach face fx
        pAssaultronHeadChargeV.play(akCaster)
        akCaster.addItem(AmmoAssaultron, 1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
        UnregisterForAnimationEvent(akCaster, "headFireStart")
        UnregisterForAnimationEvent(akCaster, "headFireEnd")
        UnregisterForAnimationEvent(akCaster, "weaponSwing")
        UnregisterForAnimationEvent(akCaster, "weaponSheath")
                ;DLC01 fix for lingering hand fx in BAB
    pAssaultronHeadChargeV.Stop(akCaster)
    ;;end dcl01 fix
EndEvent



Event OnCripple(ActorValue akActorValue, bool abCrippled)
    actor selfRef = self.GetTargetActor()
	;If head laser is crippled stop all associated processes
    if akActorValue == headlaserAV 
    	debug.trace("head av is 0000000000000000")
        isHeadLaserCrippled = true
        laserCrippled(selfRef)
    endif
    ;If any arm or leg is crippled make the laser cooldown shotrter
    if akActorValue == LeftAttackCondition || akActorValue == RightAttackCondition || akActorValue == LeftMobilityCondition || akActorValue == RightMobilityCondition
        limbCrippledReduceLaserCoolTime()
    endif
    ;stop claoking if going into self destruct
        if selfRef.GetEquippedWeapon() || selfRef.GetValue(leftattackcondition) as int > 0 || selfRef.GetValue(rightattackcondition) as int  > 0 ;==============================
            ;donothing
            else
            Debug.Trace("No more WEPS") 
            isCloakCrippled = true
            IF (selfRef.HasMagicEffect(stealthEffect))
                            deCloak(selfRef)
            endIf
        endif
    ;If head laser is crippled stop all associated processes
    if akActorValue == endurancecondition 
        debug.trace("chest is cripped")
        UnregisterForAnimationEvent(selfRef, "weaponSwing")
        isCloakCrippled = true
        IF (selfRef.HasMagicEffect(stealthEffect))
            debug.trace("decloaking")
            deCloak(selfRef)
        endIf
    endif
EndEvent

;Only charge laser in combat
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    actor selfRef = self.GetTargetActor()
      if (aeCombatState == 0)
    Debug.Trace("We have left combat")
    IF (selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false
        deCloak(selfRef)
    endIf
  elseif (aeCombatState == 1)
    Debug.Trace("We have entered combat")
    beginChargingLaser (selfRef)

        utility.wait(0.25);=================================================================================
        IF (!selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false
            cloak(selfRef)
        endIf
    Debug.Trace("ammo is" + selfRef.GetItemCount(AmmoAssaultron) + " on combat")
  elseif (aeCombatState == 2)
    Debug.Trace("We are searching...")
    IF (selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false
        deCloak(selfRef)
    endIf
  endIf
EndEvent

;timer for tracking long charging and charging pause
Event OnTimer(int aiTimerID)
    actor selfRef = self.GetTargetActor()
    if aiTimerID == faceLaserTimerID
        readyLaser(selfRef)
        IF (selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false;===========================================================
            deCloak(selfRef)
        endIf
    endif
    if aiTimerID == faceLaserPauseTimerID   
        Debug.Trace("Starting a new laser charge up")
        beginChargingLaser (selfRef)
    endif
    if aiTimerID == faceLaserReadyTimerID   
        laserReadySoundID = laserReadySound.play(selfRef)
        
    endif
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    actor selfRef = self.GetTargetActor()
    ;test to let us know we are firing laser
    if asEventName == "headFireStart" &&  wepFireDoOnce == false && laserState == 2
        Debug.Trace("wep FIREEEEEEEEEEEEEEEE") 
         wepFireDoOnce = true
         fireLaser(selfRef)
         LaserFireSoundID = LaserFireSound.play(selfRef)
         selfRef.AddSpell(PcrThermalCoreCloak);add a local radiation fx
    endIf
    ;test to find out when laser blast is done
    if asEventName == "headFireEnd" && wepFireDoOnce == true
        wepFireDoOnce = false
        Debug.Trace("wep FIREEEEEEEEEEEEEEEE  STOOOOOOOOOOOP") 
        IF (!selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false;=====================================================================
            cloak(selfRef)
        endIf
        ;from old temp timer end......................................................
        endLaser(selfRef)
        LaserTailSoundID = LaserTailSound.play(selfRef)
        selfRef.RemoveSpell(PcrThermalCoreCloak);add a local radiation fx
        ;gap between charges
        startTimer(Utility.RandomInt(laserCoolTimeMin, laserCoolTimeMax), faceLaserPauseTimerID)
    endIf
    ;start cloak after weapons are drawn
    if asEventName == "weaponSwing" ;================================================================================
        Debug.Trace("wep swing") 
        IF (selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false
            deCloak(selfRef)
        endIf
        utility.wait(0.75)
        IF (!selfRef.HasMagicEffect(stealthEffect)) && isCloakCrippled == false
            cloak(selfRef)
        endIf
    endIf
EndEvent

;clean up laser stuff on death. Blow head up on death if it is charging
Event OnDying(Actor akKiller)
    actor selfRef = self.GetTargetActor()
    Debug.Trace("assaultron died") 
    if laserState >=1
        selfRef.DamageValue(headlaserAV, 100)
    endif
    isHeadLaserCrippled = true
    laserCrippled(selfRef)
        IF (selfRef.HasMagicEffect(stealthEffect)) 
            deCloak(selfRef)
        endIf;==========================================================================================================
    goToState("dead")
EndEvent
endstate

State dead
    ;do nothing
endstate
;------------------------------------------`-------------------------- Stealth functions


;------------------------------------------`-------------------------- Laser sequeence functions

function beginChargingLaser (Actor SelfRef)
    if isHeadLaserCrippled == true
        ;do nothing
    else
        laserState = 1
        ;start charging fx
        laserChargeSoundID =  laserChargeSound.play(selfRef) 
        selfRef.SetSubGraphFloatVariable("fDampRate", 0.002)
        selfRef.SetSubGraphFloatVariable("fToggleBlend", 1.5)
        ;timer for whole charge up`
        startTimer(laserChargeTime, faceLaserTimerID)
        ;timer for ready sound
        startTimer(laserChargeTime * 0.6, faceLaserReadyTimerID)

    endif
endFunction

function cloak(Actor SelfRef) ;================================================================================================
    debug.trace("claok")
    ;if we dont have the stealth spell, add it!
    selfRef.addspell(stealthSpell)
endFunction

function deCloak(Actor SelfRef);=================================================================================================
    debug.trace("declaok")
    ;turn of cloak
    selfRef.RemoveSpell(stealthSpell)
endFunction

function readyLaser(Actor SelfRef)
    if isHeadLaserCrippled == true
        ;do nothing
    else
    ;ramp laser visuals quick
;    selfRef.SetSubGraphFloatVariable("fDampRate", 0.1)
 ;   selfRef.SetSubGraphFloatVariable("fToggleBlend", 1.5)
        laserState = 2
        Sound.StopInstance(laserChargeSoundID)
        Debug.Trace("Adding laser")
        selfRef.equipItem(pAssaultronLaser)
    endif

endFunction

function fireLaser(Actor SelfRef)
   if selfRef.getDistance(game.getPlayer()) < 1024
        laserImod.ApplyCrossFade(0.2)
    endIf

endFunction

function endLaser(Actor SelfRef)
    laserState = 0
    ;gate laser use with weapon
    selfRef.removeItem(pAssaultronLaser)
    Debug.Trace("laser removed")
    ImageSpaceModifier.RemoveCrossFade(0.3)
    selfRef.SetSubGraphFloatVariable("fDampRate", 0.3)
    selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.0)
endFunction

function laserCrippled(Actor SelfRef)
    laserState = -1
    Sound.StopInstance(laserChargeSoundID)
    Sound.StopInstance(laserReadySoundID)
    Sound.StopInstance(LaserFireSoundID)
    selfRef.removeItem(pAssaultronLaser)
    selfRef.SetSubGraphFloatVariable("fDampRate", 0.3)
    selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.0)
    ;selfRef.SetAnimationVariableFloat("fToggleDampRate", 0.3)
    ;selfRef.SetAnimationVariableFloat("fToggleBlend", 0.0)
    ImageSpaceModifier.RemoveCrossFade(0.3)
endFunction

;if limb crippled reduce time between shos first 2x
function limbCrippledReduceLaserCoolTime()
    debug.trace("Lost limb, lowere laser cool")
    if reduceCoolTwice < 2
        laserCoolTimeMin = laserCoolTimeMin - laserCoolTimeLimbCrippleReduction
        laserCoolTimeMax = laserCoolTimeMax - laserCoolTimeLimbCrippleReduction
        reduceCoolTwice += 1
    endIf
endFunction
