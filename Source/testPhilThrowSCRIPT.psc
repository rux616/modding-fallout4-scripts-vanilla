Scriptname testPhilThrowSCRIPT extends ObjectReference

EVENT onInit()

	if(RegisterForAnimationEvent(SELF, "weaponDraw") == true)
		debug.trace("attackStop registered")
	else
		debug.trace("butts")
	endif

ENDEVENT

EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
  
  	IF(asEventName == "weaponDraw")
  		Debug.trace("the RUNE of me... get it?")

  		; //cast the rune and remove the stamina
  		;game.getPlayer().damageValue("health", 25)

	ENDIF

ENDEVENT

EVENT OnUnload()
	debug.trace("unload")
	UnregisterForAnimationEvent(SELF, "meleeattackSpecial")
	
ENDEVENT

;EVENT OnEffectStart(Actor akTarget, Actor akCaster)	
;	
;	if(RegisterForAnimationEvent(game.getPlayer(), "attackStateExit") == true)
;		debug.trace("meleeattackSpecial registered")
;	else
;		debug.trace("butts")
;	endif
;
;ENDEVENT
;
;EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
;  
;  	IF(asEventName == "attackStateExit")
;  		Debug.trace("the RUNE of me... get it?")
;
;  		; //cast the rune and remove the stamina
;  		game.getPlayer().damageAv("health", 25)
;
;	ENDIF
;
;ENDEVENT
;
;EVENT OnUnload()
;	debug.trace("unload")
;	UnregisterForAnimationEvent(game.getPlayer(), "meleeattackSpecial")
;	
;ENDEVENT