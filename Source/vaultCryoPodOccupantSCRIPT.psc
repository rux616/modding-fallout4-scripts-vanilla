Scriptname vaultCryoPodOccupantSCRIPT extends ObjectReference

OBJECTREFERENCE PROPERTY cryoPod AUTO
OBJECTREFERENCE PROPERTY occupant AUTO

FLOAT freezeWait

EVENT ONCELLLOAD()

	utility.wait(0.5)

	;close the door
	cryoPod.playAnimation("g_idleSitInstant")

	freezeWait = utility.randomFloat(3.5, 5.5)

	;let them get in
	utility.wait(freezeWait)

	debug.Trace("freezeWait: " + freezeWait)

	;turn off their AI
	(occupant as ACTOR).enableAI(FALSE)

	
ENDEVENT
