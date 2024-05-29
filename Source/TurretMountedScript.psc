Scriptname TurretMountedScript extends Actor Const

Explosion Property DeathExplosion Auto Const

Activator property AshPileObject auto Const
									{The object we use as a pile.}

Armor Property SkinTurretMountedDest Auto Const
Bool Property bStartInactive = false Auto Const

sound Property NPCRobotTurretSabotageShutdown Auto Const
{PROTOTYPE: SFX for sabotaged Turret going kablooey}
MovableStatic Property SparksUpwards Auto Const
{PROTOTYPE: FX for sabotaged turret}

Event OnDying(Actor akKiller)

    placeAtMe(DeathExplosion)
    self.AttachAshPile(AshPileObject)
    equipitem(SkinTurretMountedDest)

EndEvent

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