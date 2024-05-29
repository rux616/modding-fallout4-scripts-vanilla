Scriptname DLC03:WorkshopRadiantOwned03Script extends DLC03:WorkshopRadiantOwnedScript

ReferenceAlias property SettlementSpokesman auto const mandatory

LocationAlias property DungeonLocation auto const mandatory

LocationAlias Property ActualLocation Auto Const

function StartupCustom()
	; register for events
	RegisterForRemoteEvent(SettlementSpokesman.GetActorRef(), "OnLocationChange")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; check if current location is target (when this quest starts from a location change event)
	CheckLocation(Game.GetPlayer().GetCurrentLocation())
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		CheckLocation(akNewLoc)
	endif

	if akNewLoc == DungeonLocation.GetLocation()
		if GetStageDone(415) && GetStageDone(418) == false && GetStageDone(420) == false 
			SetStage(418)
		endif
	endif
endEvent

; if we've entered the target location, set stage
function CheckLocation(Location akNewLoc)
	if !GetStageDone(70) && akNewLoc == ActualLocation.GetLocation()
    	; player has arrived in settlement location - start attack timer
    	debug.trace(self + " start attack timer")
   		SetStage(70)
   		((self as Quest) as WorkshopAttackScript).StartTimerGameTime(1.0)
	endif
endFunction


