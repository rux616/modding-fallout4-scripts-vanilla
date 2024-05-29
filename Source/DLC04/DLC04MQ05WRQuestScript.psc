Scriptname DLC04:DLC04MQ05WRQuestScript extends Quest

Event OnQuestInit()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace("DLC04PPH Sender: " + akSender + ". OldLoc: " + akOldLoc + ". NewLoc: " + akNewLoc)
	
	; watch for player to change location
	If akSender == Game.GetPlayer()
		Weather.ReleaseOverride()
		Stop()	
	Endif
EndEvent