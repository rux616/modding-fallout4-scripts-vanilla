Scriptname InstM03StarterScript2 extends Quest
{Used to monitor for change location events and start the quest if the player changes loc twice and neither is the Institute, then set a stage.}

Location Property InstituteLocation Auto Const
Quest Property InstM03 Auto

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
	   		InstM03.Start()
		endif
	endif
endEvent
