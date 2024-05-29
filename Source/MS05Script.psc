Scriptname MS05Script extends Quest

Location Property SalemLocation Auto
Location Property DanversLocation Auto

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
		if GetStageDone(700) && akOldLoc != DanversLocation && akNewLoc != DanversLocation
	    	; player's current and former locations are not Danvers
	   		SetStage(710)
		elseif GetStageDone(720) && akOldLoc != SalemLocation && akNewLoc != SalemLocation
	    	; player's current and former locations are not Salem
	   		SetStage(730)
		endif
	endif
endEvent