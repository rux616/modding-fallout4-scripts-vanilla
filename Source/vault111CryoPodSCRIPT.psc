Scriptname vault111CryoPodSCRIPT extends ObjectReference

OBJECTREFERENCE PROPERTY occupant AUTO

BOOL OPEN=FALSE
BOOL FIRSTOPEN = TRUE

EVENT ONACTIVATE(OBJECTREFERENCE obj)

	;OPEN AND CLOSE THE DOOR
	IF(OPEN)
		;close the door
		SELF.playAnimation("g_idleSitInstant")
		OPEN = FALSE

	ELSE
		;open the door
		SELF.playAnimation("walkStartRear")		
		OPEN = TRUE

	ENDIF

	;FIRST TIME RE-ANIMATE THE CORPSE
	IF(FIRSTOPEN)
		FIRSTOPEN = FALSE
		killOccupant()
	ENDIF

ENDEVENT

FUNCTION killOccupant()

	utility.wait(3)
	(occupant as ACTOR).enableAI(TRUE)

ENDFUNCTION