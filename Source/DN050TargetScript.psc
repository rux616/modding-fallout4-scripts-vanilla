Scriptname DN050TargetScript extends ObjectReference const

quest Property DN050 auto const

;Event OnLoad()
;	if Is3dLoaded()
;		RegisterForHitEvent(self) ; get a single hit
;	endif
;EndEvent

;Event OnUnload()
;	UnregisterForAllHitEvents()
;EndEvent

;Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
 ;   if DN050.getstage() == 30
;		DN050.setstage(35)
;	else
;		RegisterForHitEvent(self) ; too soon - get another hit (should probably remote register for quest changing stage)
;	endif
;EndEvent

Event onActivate(ObjectReference akActivator)
	if DN050.getstage() == 20 
		DN050.setstage(25)
	endif
EndEvent