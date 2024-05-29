Scriptname DLC03:MQ04VRExitSimulationTriggerScript extends ObjectReference Const
{exits the player from the VR world OnEnter}

ReferenceAlias Property CurrentVRStartMarkerAlias auto const mandatory
{ alias of current start marker - updated each time player enters a memory }

bool property bAffectPlayer = true auto const 
{ if set to FALSE, will only affect VR actors }
Event OnTriggerEnter(ObjectReference akActionRef)
	actor player = Game.GetPlayer()
	if akActionRef == player
		if bAffectPlayer
			debug.trace(self + " OnTriggerEnter player")
			; move player back to start marker
			debug.trace(self + " moving player to " + CurrentVRStartMarkerAlias.GetRef())
			Game.GetPlayer().MoveTo(CurrentVRStartMarkerAlias.GetRef())
		endif
	else
		debug.trace(self + " OnTriggerEnter " + akActionRef)
		if akActionRef is DLC03:VRDataRetrieverScript && (akActionRef as DLC03:VRDataRetrieverScript).bKillOnFall == false
			debug.trace(self + " moving to last safe spot")
			; move back to last position
			(akActionRef as DLC03:VRDataRetrieverScript).MoveToLastSafeSpot()
		elseif akActionRef is actor && (akActionRef is DLC03:VRDefenderScript) == false
			debug.trace(self + " OnTriggerEnter " + akActionRef)
			(akActionRef as Actor).kill()
		endif
	endif
EndEvent