Scriptname TurretStandingScript extends Actor 

ActorValue Property MotorAV Auto Const
ActorValue Property LegsCondition Auto Const
Explosion Property TurretStandingExplosion Auto Const
bool legsCrippled = false
Bool Property bStartInactive = false Auto Const

sound Property NPCRobotTurretSabotageShutdown Auto Const
{PROTOTYPE: SFX for sabotaged Turret going kablooey}
MovableStatic Property SparksUpwards Auto Const
{PROTOTYPE: FX for sabotaged turret}

objectReference Property myWiring Auto Const

; fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnCripple(ActorValue akActorValue, bool abCrippled)
	if abCrippled
		;Motors
		if akActorValue == MotorAV 
		SetAnimationVariableFloat("fAimOnGain", 0.03)
		endif
		;Legs
		if akActorValue == LegsCondition 
			legsCrippled = true
			damageobject(2000);kill
		endif
	endif
EndEvent
; end fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnDying(Actor akKiller)
    if legsCrippled == false
    placeAtMe(TurretStandingExplosion)
    endif
    if myWiring
        myWiring.DamageObject(200.0)
    endif
EndEvent

; PROTOTYPE of sabotage via terminal functionality -------------------------------------
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace("Turret: Received anim event: "+asEventName)
    if asEventName == "WeaponFire"   
        ; right now we're making an assumption that ONLY a sabotage/override can register tihs event.  poor assumption to ship with.
        ; if we keep this functionality, add keyword or a value to flag that this turret has been sabotaged.
        objectReference sparks = placeatme(SparksUpwards)
        NPCRobotTurretSabotageShutdown.playAndWait(self)
        self.kill()
        sparks.disable()
    endif
EndEvent

Event onLoad()
    if bStartInactive 
        setUnconscious(true)
    endif
EndEvent

