Scriptname AssaultronRaceScript extends ActiveMagicEffect

Keyword Property LinkAssaultronPad Auto Const


Event OnEffectStart(Actor akTarget, Actor akCaster)
 
	debug.trace("ASSAULTRON: Loading ref: "+akCaster)
	if akCaster.isUnconscious()
		debug.trace("ASSAULTRON: Unconscious - move to my charge pad.")
		akCaster.moveto(akCaster.getLinkedRef(LinkAssaultronPad))
		akCaster.setUnconscious()
	endif

EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  NOTE NOTE NOTE NOTE
;;          7/10/2015 - jb
;; Changing this to only toggle detection ON, and only from trap triggers.
;; If you have an example where activation is required for consciousness, please refer to 62746 and see me.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnActivate(ObjectReference akActionRef)
	if akActionRef is actor
		;do nothing
	else
		actor selfRef = self.GetTargetActor()
		selfRef.blockactivation()
		debug.trace("ASSAULTRON: Received an Activation Signal from non-player input "+akActionRef)
	    debug.trace("				akActionRef = "+akActionRef)
	    if (akActionRef as TrapTrigPlate) && selfRef.isUnconscious()
			selfRef.setUnconscious(FALSE)
			 selfRef.evaluatePackage()
			debug.trace("ASSAULTRON: Waking Up!")
		endif
		selfRef.blockactivation(false)
	endif
	
EndEvent