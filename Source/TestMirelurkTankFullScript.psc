Scriptname TestMirelurkTankFullScript extends Actor

import game
import debug


; Event OnCellAttach()
;     debug.trace("Hi, Daryl")
; EndEvent

Event OnLoad()
    if Is3DLoaded()
        RegisterForHitEvent(self, Game.GetPlayer()) ; get a single hit from the player
    endif
EndEvent

Event OnUnload()
    UnregisterForAllHitEvents()
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace("Test on Activate")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    ;self.kill()
    debug.trace("Projectile is " + akProjectile)
    debug.tracefunction()
    ; if (akAggressor == game.getPlayer() && akSource as weapon)
    ; self.PlayAnimation("BlockStart")
    ; notification("")
    ; endif
    if (akAggressor == game.getPlayer())
    	;self.PlayAnimation("BlockStart")
    	; (self as ObjectReference).PlayAnimation("BlockStart")
    	self.PlaySubGraphAnimation("Ragdoll")
    	;self.PlaySubGraphAnimation("BlockStart")
    	;debug.SendAnimationEvent(self,"BlockStart")
    endif

    RegisterForHitEvent(self, Game.GetPlayer()) ; get another hit from the player
EndEvent