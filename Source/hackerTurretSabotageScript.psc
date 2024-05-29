Scriptname hackerTurretSabotageScript extends ActiveMagicEffect Const
{Effect run when player sabotages a turret.  next time we fire, kaboom.}

sound Property NPCRobotTurretSabotageShutdown Auto Const
{SFX for sabotaged Turret going kablooey}
MovableStatic Property SparksUpwards Auto Const
{FX for sabotaged turret}
ActorValue Property overheating Auto Const
{Once the sabotage effect kicks in, this value gets set to 1.0}
Explosion Property TurretMountedExplosionSabotaged Auto Const
{a nastier death explosion from an overheated/sabotaged turret}

Event OnEffectStart(Actor akTarget, Actor akCaster)
    DEBUG.TRACE("TERMINAL: sabotage effect applied to "+akCaster+" by "+akTarget)
    registerForAnimationEvent(akTarget,"WeaponFire")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace("Turret: Received anim event: "+asEventName)
    if asEventName == "WeaponFire"
        if akSource.getValue(overheating) == 0.0
            ; right now we're making an assumption that ONLY a sabotage/override can register tihs event.  possibly a poor assumption to ship with.
            ; if we keep this functionality, add keyword or a value to flag that this turret has been sabotaged.
            akSource.setValue(overheating, 1)
            objectReference sparks = akSource.placeatme(SparksUpwards)
            NPCRobotTurretSabotageShutdown.playAndWait(akSource)
            akSource.damageObject(8888)
            (akSource as actor).killSilent()
            sparks.disable()
            akSource.placeatme(TurretMountedExplosionSabotaged)
        else
            debug.trace("Turret: ...but already overheating, so doing")
        endif
    else
        ; get some other anim event?  re-register.
        registerForAnimationEvent(akSource,"WeaponFire")
    endif
EndEvent

