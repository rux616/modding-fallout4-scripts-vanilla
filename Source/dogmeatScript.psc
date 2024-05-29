Scriptname dogmeatScript extends ReferenceAlias

;THIS SCRIPT APPEARS TO BE OBSOLETE NOW


;ObjectReference property DogmeatRef auto const
;GlobalVariable Property dogmeatCommandOverrideCombat Auto

;THIS GLOVAL DOESN'T APPEAR TO BE ACTUALLY USED ANYWHERE
;EVENT OnCombatStateChanged(Actor akTarget, int aeCombatState)
;    if aeCombatState == 0 ; upon exiting combat
;    	dogmeatCommandOverrideCombat.setValue(0)
;    endif
;EndEVENT


; Event OnCommandModeEnter()
;     debug.trace("Dogmeat entering command mode...")
; EndEvent