Scriptname tpMotorFXSCRIPT extends ActiveMagicEffect

IMAGESPACEMODIFIER PROPERTY sprintBurstIMOD AUTO
IMAGESPACEMODIFIER PROPERTY sprintActiveIMOD AUTO
IMAGESPACEMODIFIER PROPERTY sprintEndIMOD AUTO

BOOL SHOWBOOST = TRUE

EVENT OnEffectStart(Actor Target, Actor Caster)

	;if(RegisterForAnimationEvent(game.getPlayer(), "footSprintRight") == true)
	;	debug.trace("footSprintRight registered")
	;else
	;	debug.trace("butts")
	;endif

	; //register for the events we need
	RegisterForAnimationEvent(game.getPlayer(), "iModOn")
	RegisterForAnimationEvent(game.getPlayer(), "iModOff")

ENDEVENT

; // We've received one of the events we're polling for.  Do something about it!
EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
  
  	; // catch the start event, we've begun boosting
  	;IF(asEventName == "footSprintRight")
  		
  		; // if we're just starting, play the boost effect
  	;	IF(SHOWBOOST)

  			; //play the boos effect, make sure we dont play it again until we're done
  	;		Debug.trace("vroom vroom mister falcon")
	;		sprintBurstIMOD.Apply()
	;		SHOWBOOST = FALSE

	;		utility.wait(1.4)

	;		sprintActiveIMOD.Apply()

	;		utility.wait(5)

	;		sprintEndIMOD.Apply()
	;		sprintActiveIMOD.Remove()
			
			;utility.wait(0.5)

	;		SHOWBOOST = TRUE

	;	ENDIF

	;ENDIF

	; ////////////////////////////
	; // THE REAL STUFF IS HERE
	; ////////////////////////////

	; // when we're done sprinting, kill it
	IF(asEventName == "iModOn")
		
		If(SHOWBOOST)

			; // dpmt show the boost again
			SHOWBOOST = FALSE

			; // play the boost
			sprintBurstIMOD.Apply()

			utility.wait(1.4)

			; // begin the sustained sprint Imod
			sprintActiveIMOD.Apply()

		ENDIF

	ENDIF

	; // when we're done sprinting, kill it
	IF(asEventName == "iModOff")
		
		; //play the rampdown
		sprintEndIMOD.Apply()
		sprintActiveIMOD.Remove()
		SHOWBOOST = TRUE

	ENDIF

ENDEVENT