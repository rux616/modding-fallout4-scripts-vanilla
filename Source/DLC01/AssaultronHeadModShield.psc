Scriptname DLC01:AssaultronHeadModShield extends ActiveMagicEffect

Group faceShield_Properties
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
    VisualEffect Property pAssaultronHeadChargeV Auto Const
    {visual fx}

    int property laserState auto conditional 
    
    SPELL Property DLC01RobotShield Auto Const
    {Radiation cloak spell to use while firing}


;	EffectShader Property pDLC01AssaultronShieldFXS Auto Const Mandatory
endgroup

;local vars for face laser timer
int faceLaserChargeTimerID = 1
int faceLaserOnTimerID = 2
int faceLaserOffTimerID = 3
int laserChargeTime = 5
int laserOnTime = 10
int laserCoolTime = 5
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
; gate bool to turn head laser ability on and off and stop timers when unloaded or out of combat
bool headLaserOn = false


Event OnEffectStart(Actor akTarget, Actor akCaster)
        ; register for events to use in stopping and starting additional laser fx --------------------DLC add
        RegisterForAnimationEvent(akCaster, "UnconsciousStartFX")
        RegisterForAnimationEvent(akCaster, "UnconsciousStopFX")
        ;---------------------------------------------------------------------------------------------DLC add
    ;Attach face fx
    pAssaultronHeadChargeV.play(akCaster)
    goToState ("CombatOff")
EndEvent

;Fix for dlc
Event OnEffectFinish(Actor akTarget, Actor akCaster)
    pAssaultronHeadChargeV.stop(akCaster)
EndEvent
;end fix

;Only charge laser in combat
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    actor selfRef = self.GetTargetActor()
      if (aeCombatState == 0)
    	Debug.Trace("We have left combat")
  elseif (aeCombatState == 1)
    Debug.Trace("We have entered combat")
    ;beginChargingLaser (selfRef)
    goToState ("CombatOn")
  elseif (aeCombatState == 2)
    Debug.Trace("We are searching...")
    goToState ("CombatOff")
  endIf
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
    actor selfRef = self.GetTargetActor()
	;If head laser is crippled stop all associated processes
    if akActorValue == headlaserAV 
    	debug.trace("head av is 0000000000000000")
        isHeadLaserCrippled = true
        sheildCrippled(selfRef)
    endif
EndEvent

;clean up laser stuff on death. Blow head up on death if it is charging
Event OnDying(Actor akKiller)
    actor selfRef = self.GetTargetActor()
    Debug.Trace("assaultron died") 
    if laserState >=1
        selfRef.DamageValue(headlaserAV, 100)
    endif
    isHeadLaserCrippled = true
    sheildCrippled(selfRef)
    goToState("dead")
EndEvent

State CombatOff
;wait
endstate

State CombatOn
	Event OnBeginState(string asOldState)
		 actor selfRef = self.GetTargetActor()
	    shieldCharge(selfRef)
    EndEvent
;timer for tracking long charging and charging pause
Event OnTimer(int aiTimerID)
    actor selfRef = self.GetTargetActor()
    ;  if aiTimerID == faceLaserReadyTimerID   
    ;     laserReadySoundID = laserReadySound.play(selfRef)
    ; endif
    ; if aiTimerID == faceLaserTimerID
    ;     readyLaser(selfRef)
    ;     fireLaser(selfRef);--------------------------------------------moved
    ; endif
     if aiTimerID == faceLaserChargeTimerID   
        shieldOn(selfRef)
    endif
    if aiTimerID == faceLaserOnTimerID   
        shieldOff(selfRef)
    endif
    if aiTimerID == faceLaserOffTimerID   
        shieldCharge(selfRef)
    endif
EndEvent

    ;---------------------------------------------------------------------------------------------DLC add
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    actor selfRef = self.GetTargetActor()
    if asEventName == "UnconsciousStartFX" 
        sheildCrippled(selfRef)
        goToState("dead")
    endIf
    if asEventName == "UnconsciousStopFX" 
        goToState("alive")
    endIf
EndEvent
    ;---------------------------------------------------------------------------------------------DLC add

EndState

State dead
    ;do nothing
endstate


;------------------------------------------`-------------------------- Laser sequeence functions

function myStartTimer(int time, int timerId)
	actor selfRef = self.GetTargetActor()
	if (selfRef.Is3DLoaded())
  		startTimer(time, timerId)
	endIf
endFunction

function shieldCharge(Actor selfRef)
	laserState = 1
	myStartTimer(laserChargeTime, faceLaserChargeTimerID)
   selfRef.SetSubGraphFloatVariable("fDampRate", 0.01)
   selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.75)
   laserChargeSoundID =  laserChargeSound.play(selfRef) 
endFunction

function shieldOn(Actor selfRef)
	laserState = 2
	myStartTimer(laserOnTime, faceLaserOnTimerID)
	Sound.StopInstance(laserChargeSoundID)
   laserReadySoundID =  laserReadySound.play(selfRef) 
    selfRef.SetSubGraphFloatVariable("fDampRate", 0.3)
   selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.25)
   selfRef.AddSpell(DLC01RobotShield)
endFunction

function shieldOff(Actor selfRef)
	laserState = 0
	myStartTimer(laserCoolTime, faceLaserOffTimerID)

   selfRef.SetSubGraphFloatVariable("fDampRate", 0.08)
   selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.0)
   Sound.StopInstance(laserReadySoundID)
   LaserTailSoundID = LaserTailSound.play(selfRef)
    selfRef.RemoveSpell(DLC01RobotShield);add a local radiation fx
endFunction

function sheildCrippled(Actor selfRef)
    laserState = -1
    Sound.StopInstance(laserChargeSoundID)
    Sound.StopInstance(laserReadySoundID)
    Sound.StopInstance(LaserFireSoundID)
    selfRef.SetSubGraphFloatVariable("fDampRate", 0.3)
    selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.0)
    selfRef.RemoveSpell(DLC01RobotShield);add a local radiation fx
endFunction

