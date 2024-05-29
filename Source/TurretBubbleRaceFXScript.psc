Scriptname TurretBubbleRaceFXScript extends ActiveMagicEffect
{Add fx via race}


Bool Property bStartInactive = false Auto Const

sound Property NPCRobotTurretSabotageShutdown Auto Const
{PROTOTYPE: SFX for sabotaged Turret going kablooey}
MovableStatic Property SparksUpwards Auto Const
{PROTOTYPE: FX for sabotaged turret}

keyword property trapTrigger auto Const
{When activated by something with this keyword, become conscious.}

actor selfRef



Event OnActivate(ObjectReference akActionRef)
	debug.trace(selfRef+" received activation from "+akActionRef)
    if akActionRef.hasKeyword(trapTrigger)
    	if selfRef.isUnconscious()
    		selfRef.setUnconscious(FALSE)
    	endif
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace("Turret: Received anim event: "+asEventName)
    if asEventName == "WeaponFire"   
    	; right now we're making an assumption that ONLY a sabotage/override can register tihs event.  poor assumption to ship with.
    	; if we keep this functionality, add keyword or a value to flag that this turret has been sabotaged.
    	objectReference sparks = selfRef.placeatme(SparksUpwards)
    	NPCRobotTurretSabotageShutdown.playAndWait(selfRef)
    	selfRef.kill()
    	sparks.disable()
    endif
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
    selfRef = akCaster
    if bStartInactive 
        selfRef.setUnconscious(true)
    endif
EndEvent
