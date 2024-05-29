Scriptname DN092_RoofSafeZoneScript extends ObjectReference
{This trigger will set a quest flag on exit}

quest property DN092 auto

EVENT OnTriggerLeave(ObjectReference akActionRef)
	; make sure it's the player, and that we haven't "exited" the trigger by going back inside.
	; NOTE - may end up not caring, in case the player cuts through museum and back through front.
    if akActionRef == game.getPlayer() && !akActionRef.isInInterior()
    	DN092QuestScript theScript
    	theScript = DN092 as DN092QuestScript
    	;DN092QuestScript questScript = DN092 as DN092QuestScript
    	theScript.bLeftRoofSafeZone = TRUE
    	; clean myself up
    	disable()
    	delete()
    endif
EndEvent