Scriptname defaultSpawnOnActivateSCRIPT extends ObjectReference Hidden

ACTORBASE PROPERTY thingToSpawn AUTO

OBJECTREFERENCE PROPERTY refToPlaceAt AUTO

BOOL PROPERTY playerOnly AUTO

BOOL PROPERTY oneShot AUTO


BOOL DOONCE=FALSE

EVENT onACTIVATE(OBJECTREFERENCE akActionRef)

	IF(!DOONCE)

		; //Check to see if we're player activate only
		IF(PLAYERONLY)

			IF(akActionRef == game.getPlayer())
				refToPlaceAt.placeAtMe(thingToSpawn)

			ENDIF

		ELSEIF(!PLAYERONLY)
			refToPlaceAt.placeAtMe(thingToSpawn)

		ENDIF

		; //if we're oneshot set it up so we only go round once
		IF(ONESHOT)
			DOONCE = TRUE
		ENDIF

	ENDIF

ENDEVENT