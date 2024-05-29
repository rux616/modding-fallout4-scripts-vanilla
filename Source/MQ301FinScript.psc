Scriptname MQ301FinScript extends Quest

Location Property DiamondCityLocation Auto
bool initialized = false

ObjectReference Property DmndMinutemenEnableMarker Auto
ObjectReference Property DmndBoSEnableMarker Auto

GlobalVariable Property MQ301Faction Auto
GlobalVariable Property MQ301GuardState Auto

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
		if GetStageDone(10) && !GetStageDone(100) && (DiamondCityLocation.IsLoaded() == False)
	    	; Player is in an area where Diamond City is not loaded
	   		SetStage(100)
	   		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		endif
	endif
EndEvent

Function EnableGuards()
	;enable BoS Guards 
	If MQ301Faction.GetValueInt() == 1
		DmndBoSEnableMarker.Enable()
	Else
		DmndMinutemenEnableMarker.Enable()
	endif
EndFunction