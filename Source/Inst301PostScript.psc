Scriptname Inst301PostScript extends Quest
{Attached to Inst301Post. Sets stage 10 when the player has changed location twice away from the Institute.}

Location Property InstituteLocation Auto Const

bool initialized = false

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	initialized = true
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if akOldLoc != InstituteLocation && akNewLoc != InstituteLocation
	    	; player's current and former locations are not the Institute
	   		SetStage(10)
		endif
	endif
endEvent